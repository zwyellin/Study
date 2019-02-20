<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <base href="<%=basePath%>">  
    <title>My JSP 'Ext.jsp' starting page</title>  
    <script type="text/javascript"  src="extjs/adapter/ext/ext-base.js"></script>
    <script type="text/javascript"  src="extjs/ext-all.js"></script>
    <script type="text/javascript"  src="extjs/ext-lang-zh_CN.js"></script>
    <link href="extjs/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        Ext.onReady(function(){
            //面板 Panel
            //布局 Layout
            //组件 Component
            //窗口 Window
            //对话框 Dialog
            /*添加按钮 会添加到表单的buttons */
            var btReset=new Ext.Button({
                text:'重置',
                handler:function(val){//handler:首发方法处理事件。
                    console.log(form.getForm());//获得表单组件，其中form是创建的表单变量
                    console.log(Ext.get("formId"));//获得表单的dom
                    form.getForm().reset();//表单重置
                    alert('按钮点击触发事件：你点击了'+val.text)
                }
            });
            var btSubmit=new Ext.Button({
                text:'提交',
                listeners:{//listeners:事件监听。
                    'click':function(){
                        winGrid.show();
                        if(form.getForm().isValid()){//表单校验
                            //获得表单内容
                            console.log(form.getForm().getValues());//获得表单内容，包括隐藏域的
                            //Ext.get是获得该组件的element。即Ext.getCmp('').el=Ext.get('')
                             console.log('通过id访问组件'+Ext.get("txName").dom.value)//通过id 
                             //Ext.getCmp是获得该组件
                             console.log(Ext.getCmp("provinceId").lastSelectionText,Ext.getCmp("provinceId").lastSelectionText)
                             Ext.MessageBox.alert('提示', '提交成功');
                        }else{
                            Ext.MessageBox.alert('提示', '输入不合法');
                        }},
                    'dbClick':function(){Ext.MessageBox.alert('提示', '鼠标移过按钮');}
                }
            });
            /* 添加文本输入框框 会添加到表单的items*/
            Ext.QuickTips.init();//初始化消息提示框
            Ext.form.Field.prototype.msgTarget = 'side';
            var txName=new Ext.form.TextField({
                width:140,
                id:'txName',
                allowBlank:false,//能否为空
                blankText:'不能为空',
                fieldLabel:'名字',//相当于label
                emptyText :'请输入姓名',
                inputType:'string',//输入类型 ，即input type
                name:'name',
                maxLength:10,//对应还要minLength及minLangthText
                maxLangthText:'输入太多字符',
                vtypeText:'错误信息sdfsdfsd',
                validator:function(val){//
                    console.log("校验函数",val)
                    if(val.length<5) return false;
                }, 
                msgTarget:'side'//其它还有'ftop'
            });
            var txPass=new Ext.form.TextField({
                width:140,
                allowBlank:false,//能否为空
                blankText:'不能为空',
                fieldLabel:'密码',//相当于label
                inputType:'password',//输入类型 ，即input type
                name:'pass',//提交的字段
                maxLength:10,//对应还要minLength及minLangthText
                maxLangthText:'输入太多字符',
                vtypeText:'错误信息sdfsdfsd',
                validator:function(val){//
                    console.log("校验函数",val)
                    if(val.length<5) return false;
                }, 
                msgTarget:'side'//其它还有'ftop'
            });
            /* 添加隐藏域 添加到表单中*/
            var hiddenEle=new Ext.form.Hidden({
                name:'id',
                value:'1'
            });
            /* 添加时间组件 添加到表单中*///提交的字段 [name:输入框值]  birthDay:''
            var dateBirthDay=new Ext.form.DateField({
                fieldLabel:'出生时间',
                blankText:'选择日期',
                name:'birthDay',
                allowBlank:false,//能否为空
                editable:false,//能否编辑
                format:'y、m、d',//默认格式'y-m-d'，可以选择y m d或任意组合和顺序，其中可以选择分隔符

            });
            /* 增加单选按钮 组 添加到表单中*/   //提交的字段 [name:inputValue]  sex:1  
            var radio=new Ext.form.Radio({
                boxLabel:'女',
                name:'sex',//注意要同name,才能实现单选作用
                inputValue:1,//
                checked:true
            })
            var radio_alone=new Ext.form.Radio({
                fieldLabel:"性别'is alone'",//这个只有在独自使用不再RadioGroup中才有效果
                boxLabel:'女',
                name:'sex',//注意要同name,才能实现单选作用，不在同一个组中，在同一form都能实现单选作用,因为同name，所以不会额外提交这个字段
                inputValue:2,
                checked:true
            })
            var radioGroup=new Ext.form.RadioGroup({
                fieldLabel:'性别',
                width:100,
                items:[{  //这边测试，一个写在里面。一个外面
                    boxLabel:'男',
                    name:'sex',
                    inputValue:0,
                    checked:false
                },radio]
            });
            /* 复选框 添加到表单中*/ //提交的字段 [name:inputValue] 得到的是数组 love[1,2]  
            var checkbox=new Ext.form.Checkbox({
                boxLabel:'运动',
                name:'love',
                inputValue:3,
            })
            var checkbox_alone=new Ext.form.Checkbox({
                fieldLabel:"爱好'is alone'",
                boxLabel:'唱歌',
                name:'love',
                inputValue:4,
            })
            var checkboxGroup=new Ext.form.CheckboxGroup({
                fieldLabel:'爱好',
                width:200,
                items:[{//这边测试，一个写在里面。一个外面
                    boxLabel:'上网',
                    name:'love',
                    inputValue:0,
                },{
                    boxLabel:'旅游',
                    name:'love',
                    inputValue:1,
                },{
                    boxLabel:'购物',
                    name:'love',
                    inputValue:2,
                },checkbox]
            })
            /* 下拉列表 会添加到表单中 */
            var comboLocalStore=new Ext.data.ArrayStore({//本地数据源，，写法
                fields: ['id', 'value','other'],
                data: [[1, '江西',110], [2, '江苏',120], [3, '安徽',130]]
            })
            var comboBoxLocal=new Ext.form.ComboBox({
                id:'provinceId',
                fieldLabel:"省份",
                hiddenName:'province',
                emptyText:'请选择',
                triggerAction:"all",//选择之后点击下拉是依据什么来搜索的， all加载所有，query当前行字段
                editable: false,//是否可编辑
                mode:'local',//标明数据来源：默认remote,即表示从服务器读取数据。还有local,表示本地数据
                store:comboLocalStore,//数据源
                displayField: 'value',//显示字段。绑定数据之后，显示场是哪个字段，对应数据源storm中的fields中的字段：这边即id或value
                valueField: 'id',//如果设置了hiddenName  则提交字段为[hiddenName:valueField],如果设置的是nanme,则提交字段为[name:displayField]
                listeners:{
                    'beforeselect':function(){},//选中前时事件
                    'select':function(that){//选中时事件
                        console.log(that);
                        console.log(that.lastSelectionText);    //获得displayField 值
                        console.log(that.value);                //获得valueField 值
                        //这边设置联动
                        //修改请求参数,因为下一次请求会和这个有关系
                        comboActivePostParams={ type: that.value, limit: 10 };
                        comboActiveStore.reload({//load函数一般只执行一次,reload()重新加载时，自动读取load设置的参数
                             params: { type: that.value, limit: 3 }, //records,获取的数据;options,load()时传递的参数;success是否成功
                             callback: function (records, options, success) {//records每一个记录   options代表自身配置,success标识请求状态
                                 console.log("请求成功");
                                 console.log(records,options,success);
                                records=records.filter(function(val,index,arr){
                                     console.log(val.id!='0');
                                     return val.id!='0'
                                 })
                                 records.forEach(function(val,index,srr){
                                     val.data.value=val.data.value+'------预处理数据';//可以处理数据，貌似filter不可以
                                 })
                             },
                             scope: comboActiveStore,
                             add: false//设置为true,load()得到的数据会添加到原来store数据的尾部,否则先清除之前的数据,将得到的数据添加到store中
                         });
                         comboBoxActive.setValue(''); //清空原来值，不然会留下原先选择了的字段
                    }
                }
            })
              //动态加载下拉框
              var comboActiveStoreMap=['id','value']; //相当于静态数据的fields
              var comboActivePostParams={type:1,limit:3};
              var comboActiveStore = new Ext.data.Store({ 
                 autoLoad : true,//自动加载,如果手动加载，则comboActiveStore.load()
                 baseParams:comboActivePostParams,//注意位置，在请求url前  但这样写是post提交
                  proxy: new Ext.data.HttpProxy({ url: 'http://localhost:8080/hello/comboTest'}),//设定读取的地址，后面可以带参数，为get提交
                  sortInfo : {//排序配置
			        field : "id",//排序字段
			        direction : "ASC"//排序方法
		         },                    
                  reader: new Ext.data.JsonReader({ 
                      root: 'data',//要解析的总json对象
                      totalProperty: 'total' //赋值为返回字段的总数
                      }, comboActiveStoreMap),//总json对象 子项的，的字段映射
                listeners:{
                    'beforeload':function(store,options){//加载之前触发
                        console.log("before load");//可以在这里增删改查参数
                        console.log(store,options);
                         options.params.type=comboBoxLocal.getValue() || 1;
                        //options.params.startNew= options.params.start
                        // delete options.params.start; 修改参数名
                    }
                }
             });
             var comboBoxActive=new Ext.form.ComboBox({
                id:'cityId',
                fieldLabel:"市区",
                hiddenName:'city',
                emptyText:'请选择',
                triggerAction:"all",
                editable: false,
                mode:'local',//
                store:comboActiveStore,//数据源
                displayField: 'value',//显示字段。绑定数据之后，显示场是哪个字段，对应数据源storm中的fields中的字段：这边即id或value
                valueField: 'id',//如果设置了hiddenName  则提交字段为[hiddenName:valueField],如果设置的是nanme,则提交字段为[name:displayField]
                listeners:{
                    'beforeselect':function(){},//选中前时事件
                    'select':function(that){//选中时事件
                        console.log(that);
                        console.log(comboActiveStore)
                        console.log(that.lastSelectionText);    //获得displayField 值
                        console.log(that.value);                //获得valueField 值
                    }
                }
            });
            /* 增加表单 会添加到窗体中*/
            var form=new Ext.form.FormPanel({
                frame:true,//外边框是否可定义True表示为面板的边框外框可自定义的，false表示为边框可1px的点线（默认为false）。
                title:"这个是表单标题",
                id:'formId',
                html:"<a href='http://www.baidu.com'>我是表单内容这是超链接baidu。com</a>",
                items:[txName,txPass,hiddenEle,dateBirthDay,radioGroup,
                radio_alone,checkboxGroup,checkbox_alone,comboBoxLocal,
                comboBoxActive],//位置都可以放,这里是内容区
                buttons:[btReset,btSubmit]//但是这个是放在下面的，这里是按钮区，不局限于按钮
            });

              //创建窗体组
              var windowGroup=new Ext.WindowGroup();
        
            /* 创建窗体 */
            var win = new Ext.Window({
                    title: '窗口',
                    width: 476,
                    height: 374,
                    html: '<div>这里是窗体内容</div>',
                    resizable: true,
                    id:'win1',
                    modal: true,      //
                    closable: true,   //是否可以关闭
                    maximizable: true,//是否有最大按钮
                    minimizable: true,//是否有最小按钮
                    buttonAlign:'right',//left、center、right)，默认值为right
                    //其它属性tbar、bbar、fbar、header、footer
                    items:[form],
                    manager:windowGroup
            });
            windowGroup.get('win1')
            win.show(); 
            /* 创建表单窗体 */
            //-------------------------------------------------------------
            //cm 列模型 Grid的列模型（ColumnModel）的默认实现。该类由列配置组成的数组初始化
            //创建方式1(简化版)   new Ext.grid.ColumnModel（[{每一列信息},{},{}]）
            var cm = new Ext.grid.ColumnModel([ 
                new Ext.grid.RowNumberer(),//一个辅助类，用于传入到Ext.grid.ColumnModel，作为自动列数字的生成
                  {
                    header : '编号1',//* 头部字符串
                    dataIndex : 'id',//* 数据源字段
                    width : 200,//宽度
                    align:'right', //文本对齐方式，left(默认) center right
                    sortable : true,//是否可排序
                    resizable:true,//列宽度是否可以手动改变,默认true。受fixed的影响
                    fixed:true,//列宽是否固定，权限比resizable高，若为true,则不可手动改变宽度，及 forceFit:true对该列无效
                    menuDisabled:false,//列菜单是否禁止
                    hidden:false,//是否隐藏该列
                    hideable:false,//是否可以隐藏该列，tip:用户可以手动隐藏某列的
                    tooltip:'tooltip属性提示的信息',
                    renderer:function(value){ //数据渲染函数
                        return value+'---rander修改';
                    },
                    listeners:{//事件监听
                        'widthchange':function(){console.log('宽度改变');Ext.MessageBox.alert('提示', '宽度改变');},
                        'headerchange':function(){Ext.MessageBox.alert('提示', '头部改变');},
                        'hiddenchange':function(){Ext.MessageBox.alert('提示', '隐藏/反隐藏事件');},
                    }
                }, {
                    header : '编号',
                    dataIndex:"id", 
                    width:200,
                    align:'center'
	            }, {
                    header : '值',
                    dataIndex:"value", 
                    sortable : true,
                    width:200,
                    align:'left'
	            }])
            /* 创建方式2(json格式)   new Ext.grid.ColumnModel（{
                column:[{每一列信息},{},{}],
                listeners:{
                    widthchange:function(cm,colindex,width){}
                }
             ）*/
             /* 创建toolbar 工具条 */
            var Gridbbar = new Ext.PagingToolbar({//自动提供翻页控制的--->分页工具栏,
                //当点击时，会触发store的load事件，增加/覆盖参数为：start:当前页。limit:pageSize
                pageSize : 3,//每一页显示个数         
                store : comboActiveStore,//会获得该数据的total，total/pageSize为有多少页
                displayInfo : true,//为true时展示展现信息
                displayMsg : '这个是表格grid的tbar,显示{0}条到{1}条,共{2}条',//用来显示翻页的情况信息 ｛0｝:第几项，值为start*pageSize -start*pageSize+pageSize {2}为store的total
                emptyMsg : "没有符合条件的记录",//没有数据记录的时候所展示的信息
                listeners:{//也可以手动来触发,但会重复。。。
                    'change':function(ele,val){
                        // ele.store.reload({
                        //     params:{
                        //         start:val.activePage,
                        //         limit:val.pages,
                        //         type:2
                        //     }
                        // })
                    }
                }
            });
            var Gridtbar=new Ext.Toolbar([
                //简化版 完整版为：new Ext.Toolbar({items:[] ...})
                //工具栏常用元素 button Fill Item Separator TextItem
                {//这个是非常普通的button
                    text:"这个是表格Grid的ttbar",
                    handler : function() {
                        winGrid.hide();
                    }
              },{//创建一个带menu属性的，即带菜单的按钮
                 text:'菜单选项',
                 menu:new Ext.menu.Menu({//创建菜单
                     shadow:"frame",
                     items:[{
                            text:'doc', 
                            checked:true,
                            menu:new Ext.menu.Menu({//二级菜单，还可以...
                                items:[{
                                        text:'C盘'
                                    },{
                                        text:"D盘",
                                        handler:function(val){Ext.MessageBox.alert('提示','你选择了'+val.text)}
                                    }]
                            })
                        }, {
                            text:'Excel',
                            menu:new Ext.menu.Menu({//多选菜单，此时，添加的元素不再是普通的button
                                items:[
                                		new Ext.menu.Item({ text:"oneitem.xls"}),
                                        new Ext.menu.Item({text:"twoItem.xls"}),
                                        new Ext.menu.Separator(),
                                        new Ext.menu.TextItem({text:"静态文本"}),
                                        new Ext.menu.CheckItem({ text:"one.xls"}),
                                        new Ext.menu.CheckItem({text:"two.xls"}),
                                        new Ext.menu.CheckItem({ text:"three.xls"}),
                                        new Ext.menu.CheckItem({text:"four.xls",group:'file'}),//如果增加group属性，则属性值一样的，成为单选
                                        new Ext.menu.CheckItem({ text:"five.xls",group:'file'}),
                                        new Ext.menu.CheckItem({text:"six.xls"})
                                      ]
                            })
                       }, {
                            text:'txt',
                            handler:function(val){Ext.MessageBox.alert('提示','你选择了'+val.text)},
                            menu:new Ext.menu.Menu({
                                items:[{
                                    text:'颜色菜单',
                                    menu:new Ext.menu.ColorMenu({ //颜色菜单
                                         handler:function(cm,color){Ext.MessageBox.alert('提示','你选择了'+color)}
                                        })
                                 },{
                                    text:'日期菜单',
                                    menu:new Ext.menu.DateMenu({ //日期菜单
                                         handler:function(cm,date){Ext.MessageBox.alert('提示','你选择了'+date)}
                                        })
                                }]
                            })
                        }]
                    })
              },"-",//这个是分割符
              "搜索",//没有按钮效果,纯文本
              new Ext.form.TextField({//输入框
                    emptyText:"搜索一下，马上知晓"
              }),
              new Ext.Toolbar.Spacer({//工具栏空白
                  width:50
              }),
              dateBirthDay,//日期组件
              comboBoxLocal,//下拉框
              "->",//相当于后面部分，float:right
              "<a href='http://www.baidu.com'>百度一下</a>",//添加html
              new Ext.Toolbar.Spacer({//工具栏空白
                  width:50
              })
            ])
             /* 创建表格 */
            var grid=new Ext.grid.GridPanel({//主要配置，列模型，数据源，选区模型
                //基本配置
                title:'这个是网格标题',
                autoScroll : true,
                width:1100, /* 可以配置 autoWidth : true, */
                autoHeight:true,/* 可以配置 height :600  maxHeight :1200*/
                tbar:Gridtbar,
                bbar:Gridbbar,
                //模型配置
                cm:cm,//colModel的简写方式 列模型 也可以简化版，直接这边配置columns:[{header:'看看',dataIndex:'value',width:100}], 效果一样的
                sm : new Ext.grid.RowSelectionModel({//selModel的简写方式 选区模型
		        	singleSelect : true, //默认false, True表示为同时只能选单行  按住ctrl+点击看效果
                    listeners :{
                        'selectionchange':function(){},
                        'rowselect':function(){},
                        'rowdeselect':function(){}//行反选触发
                    }
		            }),
                store : comboActiveStore,//数据源
                //其它配置
                disableSelection:false,//是否禁止选区功能
                enableColumnMove:true,//是否开启列拖地，默认true
                enableColumnResize:true,//列是否可以调节宽度
                trackMouseOver:true,//数遍移动是否高亮显示
                stripeRows:true,//开启行与行的斑马区分
                /* tbar  bbar  fbar  header  footer buttons items  tools */
                viewConfig: {//这个功能强制让表格在固定的宽度（用表格的width，如果为null就用表格父容器的宽度）里中调整各列到合适的宽度
                    forceFit:true//cm 各个列定义的宽度将失效，除非它定义了fixed:true
                }
            })
              /* 创建窗体 */
              var winGrid = new Ext.Window({
                    title: '窗口',
                    width: 1200,
                    height: 800,
                    id:"win2",
                    html: '<div>xxx</div>',
                    resizable: true,
                    modal: true,      //
                    closable: true,   //是否可以关闭
                    maximizable: true,//是否有最大按钮
                    minimizable: true,//是否有最小按钮
                    buttonAlign:'right',//left、center、right)，默认值为right
                    //其它属性tbar、bbar、fbar、header、footer
                    items:[grid],
                    manager:windowGroup
            });
            winGrid.show();
            var windowGroupChangeBtn=new Ext.Button({
                text:"切换",
                renderTo:'windowGroupChange',
                handler:function(){
                    Ext.MessageBox.alert("消息","点击事件");
                   console.log(windowGroup.get('win2'))
                //    windowGroup.each(function(cmp){
                //        console.log('----')
                //        console.log(cmp);
                //        cmp.show();
                //    })
                }
            })
        });
        
    </script>
  </head>
  
  <body>
    This is my JSP pag发生的e. <br>
    <div id="windowGroupChange"></div>
  </body>
</html>
