Ext.namespace("Ext.cicsu.form");

var GridRecord = Ext.data.Record.create([{
	name : 'url'
}]);

Ext.cicsu.form.CustomUIUploadPanel = Ext.extend(Ext.Panel, {
	/**
	 * 缺省构造参数，可被自定义设置覆盖(第一次给属性赋值)
	 */
	/** 顶部工具栏 */
	tbar : '',
	/** Ext.DataView */
	dataview : '',
	/** Ext.data.SimpleStore */
	dataview_store : '',
	/** Ext.XTemplate */
	dataview_tpl : '',
	fileCount : 0,

	fileArray : '',

	fileType : '',
	maxCount : '',

	initComponent : function() {
		/**
		 * 在组件初始化期间调用的代码
		 * 
		 * 因为配置对象应用到了“this”，所以属性可以在这里被覆盖，或者添加新的属性（如items,tools,buttons）
		 * 可以对实体传过来的配置属性进行重新赋值（第三次赋值） new MyClass({第二次赋值});
		 */
		this.createTbar(this.dataview_store);
		this.createDataview_store();
		this.createDataview_tpl();
		this.createDataview();
		Ext.apply(this, {
			items : [this.dataview]
		});

		/** 调用父类代码之前 调用父类构造函数（必须） */
		Ext.cicsu.form.CustomUIUploadPanel.superclass.initComponent.apply(this,
				arguments);

		/** 调用父类代码之后 如：设置事件处理和渲染组件 */
		Ext.getCmp('deleteButton').disable();
	},
	/** 创建工具条 */
	createTbar : function() {
		var this_ = this;
		this.fileArray = new Array();
		this.tbar = [{
			id : 'addFile',
			text : '添加',
			xtype : 'browsebutton',
			iconCls : 'page_addIcon',
			handler : function(bb) {
				var inp = bb.detachInputFile(false);
				var filePath = inp.getValue();
				var fileName = inp.getValue().split(/[\/\\]/).pop();
				/**将扩展名转为小写*/
				var extendName = fileName.split('.')[fileName.split('.').length
						- 1].toLowerCase();

				// 进行文件类型的验证
				var arrType = this_.fileType.split(",");
				if (this_.fileType != '') {
					for (var i = 0; i < arrType.length; i++) {
						/**将配置的扩展名在此也转为小写，并且要trim*/
						if (i == arrType.length - 1
								&& extendName != arrType[i].trim().toLowerCase()) {
							Ext.Msg.alert('提示', "请添加"+this_.fileType+"格式的文件");
							return;
						} else if (extendName == arrType[i].toLowerCase()) {
							break;
						}
					}
				}
				
				//对上传文件的个数进行验证
				if(this_.maxCount != '') {
					if(this_.maxCount<this_.dataview_store.getCount()+1) {
						Ext.Msg.alert('提示','您最多只能上传'+this_.maxCount+'个文件');
						return;
					}
				}
				
				var rec = new GridRecord({
					url : filePath
				});
				this_.dataview_store.add(rec);

				this_.fileArray.push({
					id : rec.id,
					file : inp
				});
				Ext.getCmp('deleteButton').enable();
				this_.fileCount++;
			}
		}, '->', {
			text : "删除",
			iconCls : 'page_delIcon',
			id : 'deleteButton',
			handler : function() {
				var selectedRecs = this_.dataview.getSelectedRecords();
				for (var i = 0; i < selectedRecs.length; i++) {
					for (var j = 0; j < this_.fileArray.length; j++) {
						if (this_.fileArray[j].id == selectedRecs[i].id) {
							this_.fileArray[j].file.remove();
							this_.fileArray[j].file = null;
							this_.fileCount--;
							if (this_.fileCount <= 0) {
								Ext.getCmp('deleteButton').disable();
							}
						}
					}
				}
				this_.dataview_store.remove(selectedRecs);
			}
		}];
	},

	/** 为dataview属性创建store */
	createDataview_store : function() {
		this.dataview_store = new Ext.data.SimpleStore({
			fields : [{
				name : 'url'
			}]
		});
	},

	/** 为dataview创建数据视图模板 */
	createDataview_tpl : function() {
		this.dataview_tpl = new Ext.XTemplate('<tpl for=".">',
				'<div class="data-item">{url}</div>', '</tpl>');
	},

	/** 创建dataview */
	createDataview : function() {
		var this_ = this;
		this.dataview = new Ext.DataView({
			store : this.dataview_store,
			tpl : this.dataview_tpl,
			autoHeight : true,
			multiSelect : true,
			// overClass : 'x-view-over',// 鼠标悬停item时的类样式,defaults to undefined
			itemSelector : 'div.data-item',// 必须项,值为item选择器,此值也可为.thumb-wrap
			emptyText : ''
		});
	},
	clearPanel : function() {
		for (var j = 0; j < this.fileArray.length; j++) {
			if(this.fileArray[j].file) {
				this.fileArray[j].file.remove();
			}
 			this.fileArray[j].file = null;
			this.fileCount--;
			if (this.fileCount <= 0) {
				Ext.getCmp('deleteButton').disable();
			}
		}
 		this.dataview_store.removeAll();
	}
});

// 注册成xtype以便能够延迟加载
Ext.reg('customuiuploadPanel', Ext.cicsu.form.CustomUIUploadPanel);
