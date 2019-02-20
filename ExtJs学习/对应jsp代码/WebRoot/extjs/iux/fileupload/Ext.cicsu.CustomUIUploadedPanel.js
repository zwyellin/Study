Ext.namespace("Ext.cicsu");

var GridRecord = Ext.data.Record.create([{
	name : 'url'
}]);

Ext.cicsu.CustomUIUploadedPanel = Ext.extend(Ext.Panel, {
	/**
	 * 缺省构造参数，可被自定义设置覆盖(第一次给属性赋值)
	 */
	/** 面板标题 */
	title : '',
	/** Ext.grid.EditorGridPanel */
	moduleId : '',
	grid : '',
	/** Ext.data.Store */
	grid_store : '',
	/** grid的reader */
	grid_reader : '',
	/** grid的列模式 */
	grid_columnModel : '',

	initComponent : function() {
		/**
		 * 在组件初始化期间调用的代码
		 * 
		 * 因为配置对象应用到了“this”，所以属性可以在这里被覆盖，或者添加新的属性（如items,tools,buttons）
		 * 可以对实体传过来的配置属性进行重新赋值（第三次赋值） new MyClass({第二次赋值});
		 */
		this.createGrid_reader();
		this.createGrid_store();
		this.createGrid_columnModel();
		this.createGird();
		Ext.apply(this, {
			items : [this.grid]
		});

		/** 调用父类代码之前 调用父类构造函数（必须） */
		Ext.cicsu.CustomUIUploadedPanel.superclass.initComponent.apply(this,
				arguments);

		/** 调用父类代码之后 如：设置事件处理和渲染组件 */
		if (this.moduleId.trim() != '') {
			this.displayUploaded(this.moduleId.trim());
		}
	},
	/** 为grid_store属性创建reader */
	createGrid_reader : function() {
		this.grid_reader = new Ext.data.JsonReader({
			root : 'result'
		}, [{
			name : 'attachmentId'
		}, {
			name : 'realname'
		}, {
			name : 'fileSize'
		}]);
	},
	/** 为grid属性创建store */
	createGrid_store : function() {
		var this_ = this;
		this.grid_store = new Ext.data.Store({
			pruneModifiedRecords : true,
			proxy : new Ext.data.HttpProxy({
				url : './Attachment!queryAttachmentRelation.action'
			}),
			reader : this_.grid_reader
		});
	},

	/** 为grid创建列model */
	createGrid_columnModel : function() {
		this.grid_columnModel = new Ext.grid.ColumnModel([
				new Ext.grid.RowNumberer()/** 行号 */
				, {
					dataIndex : 'realname',
					width : 300
				}, {
					dataIndex : 'fileSize',
					width : 100,
					renderer : function(value) {
						if (value < 1024) {
							return subFloat(value, 2) + '字节'
						} else if (value >= 1024 && value < 1024 * 1024) {
							return subFloat((value) / 1024, 2) + "KB";
						} else if (value >= 1024 * 1024
								&& value < 1024 * 1024 * 1024) {
							return subFloat((value) / (1024 * 1024), 2) + "MB";
						} else if (value >= 1024 * 1024 * 1024
								&& value < 1024 * 1024 * 1024 * 1024) {
							return subFloat((value) / (1024 * 1024 * 1024), 2)
									+ "GB";
						} else if (value >= 1024 * 1024 * 1024 * 1024
								&& value < 1024 * 1024 * 1024 * 1024 * 1024) {
							return subFloat((value)
									/ (1024 * 1024 * 1024 * 1024), 2)
									+ "TB";
						} else {
							return "数据大小超过TB数量级";
						}
					}
				}, {
					dataIndex : 'attachmentId',
					renderer : function(value) {
						return "<a href='javascript:void(0)' onclick=download('"
								+ value + "')>下载</a>";
					}
				}]);
	},
	/** 创建grid */
	createGird : function() {

		var this_ = this;

		this.grid = new Ext.grid.EditorGridPanel({
			autoHeight : true,
			autoScroll : true,
			store : this.grid_store,
			trackMouseOver : true,
			enableDragDrop : true,
			tbar : ['->', {
				text : "删除选中",
				iconCls : 'page_delIcon',
				handler : function() {
					var records = this_.grid.getSelectionModel()
							.getSelections();
					var ids = "";
					for (var i = 0; i < records.length; i++) {
						if (i != records.length - 1) {
							ids += records[i].get("attachmentId") + ",";
						} else {
							ids += records[i].get("attachmentId");
						}
						this_.grid_store.remove(records[i]);
					}
					if (ids != "") {
						Ext.Ajax.request({
							url : './Attachment!deleteAttachmentsByIds.action',
							params : {
								ids : ids
							},
							method : "POST",
							success : function(response) {
								this_.grid_store.reload();
							},
							failure : function(response) {
								Ext.Msg.alert("警告", "数据删除失败，请稍后再试！");
							}
						});
					} else {
						Ext.Msg.alert("提示", "请选择您要删除的数据！");
					}
				}
			}],
			loadMask : {
				msg : '正在加载表格数据,请稍等...'
			},
			stripeRows : true,
			frame : false,
			cm : this.grid_columnModel,
			sm : new Ext.grid.RowSelectionModel()
		});
	},
	displayUploaded : function(moduleId) {
		var this_ = this;
		this_.grid_store.load({
			params : {
				moduleId : this_.moduleId
			}
		});
	},
	setModuleId : function(moduleId) {
		this.moduleId = moduleId;
		if (moduleId.trim() != '') {
			this.displayUploaded(this.moduleId);
		}
	}
});
function download(id) {
	var exist = fileIsExist(id);
	if (exist == false) {
		Ext.Msg.alert("提示", "该文件可能不存在！");
	} else {
		window.open("./Attachment!downloadAttachment.action?aid=" + id);
	}
}

function fileIsExist(id) {
	var flag = false;
	Ext.Ajax.request({
		url : './Attachment!fileIsExist.action',
		method : 'POST',
		async : false,// 同步执行
		params : {
			id : id
		},
		success : function(response) {
			var res = Ext.util.JSON.decode(response.responseText);
			if (res.exist == true) {
				flag = true;
			} else {
				flag = false;
			}
		},
		failure : function(response) {
			flag = false;
		}
	});
	return flag;
}
// 注册成xtype以便能够延迟加载
Ext.reg('customuiuploadedpanel', Ext.cicsu.CustomUIUploadedPanel);
