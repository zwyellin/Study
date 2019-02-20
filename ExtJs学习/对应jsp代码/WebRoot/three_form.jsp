<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'three_form.jsp' starting page</title>
    
    <script type="text/javascript"  src="extjs/adapter/ext/ext-base.js"></script>
    <script type="text/javascript"  src="extjs/ext-all.js"></script>
    <script type="text/javascript"  src="extjs/ext-lang-zh_CN.js"></script>
    <link href="extjs/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
    <link href="css/two_menu.css" rel="stylesheet" type="text/css" >
    <script type="text/javascript">
		Ext.onReady(function(){
			Ext.QuickTips.init();//初始化消息提示框
            Ext.form.Field.prototype.msgTarget = 'side';
			//普通输入框
		    var textfield1=new Ext.form.TextField({
		    	name:'name',//表单提交时的name
		    	value:undefined,//表单提交时的value,可以设置初始值
		    	fieldLabel:"姓名",//选项前面的文字
		    	//以下为TextField自身属性
		    	emptyText:'请输入名字',//空白时文字
		    	//【校验】:输入框内容变化就会触发，也可以设置失去焦点时也触发
				allowBlank:false,//【校验】是否允许为空
		    	blankText:"为空时的文本提示",//【提示】不符合allowBlank的文本提示
		    	minLength:5,//【校验】字段最少字符控制
		    	minLengthText:"不符合minLength时的文本提示",//【提示】不符合minLength时的文本提示
		    	maxLength:10,//【校验】字段最多字符控制
		    	maxLengthText:"不符合maxLengthText的文本提示",//【提示】不符合maxLengthText的文本提示		 	
		    })
		    //普通输入框,这边测试validator:function校验函数
		    var textfield2=new Ext.form.TextField({
		    	name:'age',
		    	fieldLabel:"年龄",
		    	emptyText:'请输入年龄',//空白时文字
		    	inputType:"number",//输入框类型
				allowBlank:false,//是否允许为空
				msgTarget:"qtip",//设置文本提示位置 
				validateOnBlur:false,//失去焦点时不校验，默认为true（校验）
				validationDelay:1000,//校验延迟，默认250毫秒
		    	validator:function(value){//函数校验 可以执行复杂的校验,会覆盖其它的校验
		    		console.log("校验")
		    		if(value.length<1) return "不符合minLength时的文本提示"
		    		else if(value.length>3) return "不符合maxLengthText的文本提示"
		    	}
		    })
		    //带下拉按钮的输入框，需要自定义触发域，一般作为下拉框基类来使用
		    var trigger=new Ext.form.TriggerField({
		    	name:'triggerField',
		    	fieldLabel:"下拉框基类",
		    	//其它属性:以下属性为TriggerField方法
		    	onTriggerClick:function(self){console.log(self,'点击下拉框倒三角会触发这个函数')}
		    })
		    //TriggerField的子类表单日期
		    var datefield=new Ext.form.DateField({//拥有TextField属性及日期选择器属性
		    	name:'date',
		    	fieldLabel:"日期",
		    	emptyText:"请输入日期",
		    	allowBlank:false,
		    	validateOnBlur:false,
		    	validator:function(value){//函数校验 可以执行复杂的校验,会覆盖其它的校验
		    		console.log("日期输入框【校验函数】:"+value);
		    	},
		    	//其它属性:以下属性为日期选择器属性，参考日期选择器
		    	//format: Y M D y m d 可以使用用任何分隔符
		    	format:'y/m/d/星期D',//Y大写表示完整年份2018，y表示18。M表示十二月，m表示12。D表示星期，d表示天数28
		    	disabledDays:[1,3,4,5,0],//表示禁止点击的星期。0-6表示日，一，二，三，四，五，六
		    	disabledDaysText:"这个是鼠标悬浮禁用星期时显示的错误文本",
		    	listeners:{
		    		'select':function(self,date){console.log("日期输入框【select事件】:"+date)}
		    	}
		    })
		     //TriggerField的子类comboBox
		     //--------------------------LocalStore------------------------------------
		    var comboLocalStore=new Ext.data.ArrayStore({//本地数据源，，写法
              	    fields: ['id', 'value'],
                	data: [[1, '江西'], [2, '江苏'], [3, '安徽']]
                  })
            var comboBoxLocal=new Ext.form.ComboBox({
             	name:'province',
		    	fieldLabel:"省份",
		    	emptyText:"请选择省份",
		    	allowBlank:false,
		    	blankText:"为空时的文本提示",//【提示】不符合allowBlank的文本提示
                //其它属性:以下属性comboBox自身属性
		    	//Ext.form.ComboBox重定义了onTriggerClick:function函数，实现数据下载，显示等
		    	store:comboLocalStore,//该组合框绑定的数据仓库（默认为 undefined）。
		    	mode:"local",//如果ComboBox读取本地数据则将值设为'local'（默认为 'remote' 表示从服务器读取数据）。
		    	editable:true,//是否可编辑	
		    	title:"这个是下拉框标题",//如果提供了，则会创建一个包含此文本的元素并被添加到下拉列表的顶部 
		    	displayField:"value",//下拉框显示字段。绑定数据之后，下拉域的key值，对应数据源storm中的fields中的字段
		    	
		    	hiddenName:undefined,//下拉框的隐藏name，如果设置了hiddenName  则提交字段为[hiddenName:valueField],如果设置的是name,则提交字段为[name:displayField]
		    	valueField:"id",//下拉框的value值，对应数据源storm中的fields中的字段
		    	
		    	triggerAction:"all",//默认为'query',点击下拉框倒三角加载数据逻辑，是基于输入框内容加载还是加载所有		    	
		    	listWidth:200,//以象素表示的下拉列表的宽度其它还有:minHeight maxHeight
		    	listeners:{
		    		'select':function(self){
		    			console.log(self);
		    			console.log(self.value);//valueField值
		    			console.log(self.lastSelectionText)//displayField值
		    			//远程加载store清空内容
		    			comboRemoteStore.removeAll();//其实下面add设置false效果一样
		    			comboboxRemote.clearValue() ;
		    			comboRemotePostParams.type=self.value;
	    		        comboRemoteStore.reload({//load函数一般只执行一次,reload()重新加载时，自动读取load设置的参数
                            params: {}, //records,获取的数据;options,load()时传递的参数;success是否成功
                            callback: function (records, options, success) {},//records每一个记录   options代表自身配置,success标识请求状态
                            scope: comboRemoteStore,
                            add: false//设置为true,load()得到的数据会添加到原来store数据的尾部,否则先清除之前的数据,将得到的数据添加到store中
                        }); 
		    		}
		    	}
             })
		     //------------------------------------------------------------------------
		     //--------------------------RemoteStore------------------------------------
		     //先配置store
		     var comboRemoteStoreMap=['id','value']; //相当于静态数据的fields
		     var comboRemotePostParams={type:1,limit:3};
		     var comboRemoteStore = new Ext.data.Store({ 
                 autoLoad : true,//自动加载,如果手动加载，则comboActiveStore.load()
                 //每次HTTP请求都会带上这个参数
                 baseParams:comboRemotePostParams,//注意位置，在请求url前  但这样写是post提交
                 //Proxy对象，用于访问数据对象
                 proxy: new Ext.data.HttpProxy({ url: 'http://localhost:8080/hello/comboTest'}),//设定读取的地址，后面可以带参数，为get提交
                 //如何排序的对象
                 sortInfo : {//排序配置
			        field : "id",//排序字段
			        direction : "ASC"//排序方法
		         },
		         //远程排序，会添加请求参数【sort,dir】  sort:sortInfo.field  dir:sortInfo.direction
		         remoteSort:true,//boolen值 
		         //处理数据对象的DataReader会返回一个Ext.data.Record对象的数组                 
                 reader: new Ext.data.JsonReader({ 
                      root: 'data',//要解析的总json对象
                      totalProperty: 'total' //赋值为返回字段的总数
                      }, comboRemoteStoreMap),//总json对象 子项的，的字段映射
                 listeners:{
                     'beforeload':function(store,options){},//加载之前触发
                     'load':function(store,options){}//加载后触发
                    }
             });
            //--------------------------------------------------------------
		    var comboboxRemote=new Ext.form.ComboBox({
		   		name:'city',
		    	fieldLabel:"城市",
		    	emptyText:"请选择城市",
		    	allowBlank:false,
		    	//其它属性:以下属性comboBox自身属性
		    	store:comboRemoteStore,//该组合框绑定的数据仓库（默认为 undefined）。
		    	mode:"remote",//数据来源，默认"remote"远程。"local"本地
		    	editable:true,//是否可编辑	
		    	title:"这个是下拉框标题",//下拉框标题
		    	displayField:"value",//下拉框的显示的值，对应数据源store中的fields中的字段
		    	
		    	hiddenName:undefined,//下拉框的隐藏name，如果设置了hiddenName则提交字段为[hiddenName:valueField],如果设置的是name,则提交字段为[name:displayField]
		    	valueField:"id",//下拉框的显示值的value，对应数据源store中的fields中的字段
		    	
		    	triggerAction:"all",//默认为'query',点击下拉框倒三角加载数据逻辑，是基于输入框内容加载还是加载所有
		    	pageSize:4,//每页显示个数 。只在 mode = 'remote'时生效（默认为 0）。会传递参数，参数为limit:4
		    	loadingText:"这个是加载数据是文本提示",//加载数据是文本提示
		    	//queryParam可以作为额外参数，作为请求。会传递参数，默认参数为【queryParam值:allQuery值】
		    	queryParam:"query11",//如果不使用这个额外参数，可以置其值为"",默认"query"
		    	allQuery:"这里是query提交时的文本",//query提交的文本。即这边提交参数为:[query11:"这里是query提交时的文本"]
		    	
		    	listWidth:200,//以象素表示的下拉列表的宽度其它还有:minHeight maxHeight
		    })
		    var timefield=new Ext.form.TimeField({
		        name:'time',
		    	fieldLabel:"时间",
		    	emptyText:"请选择时间",
		    	allowBlank:false,
		    	//以下属性comboBox自身属性
		    	title:"跨度为30分钟",
		    	maxHeight:100,//修改下拉框高度
		    	//TimeField属性
		    	format:'时间   H:i ',//g 小时:1-12,h 小时:01-12,G 小时:1-23,H 小时:01-23
		    				 //i 分钟:00-59, s 秒 :00-59,a 上午下午:am pm ,A:AM PM
		    				 //这边发现bug,a 及  A在下拉框能正常显示，但选择后输入框为空。不是中文问题
			    minValue: '9:00 AM',
			    maxValue: '6:00 PM',
			    increment: 30,//跨度,单位为分钟
			});
		    var textarea=new Ext.form.TextArea({
		        //BoxComponent属性
		        width:200,
		    	height:150,
		    	//form.field属性
		        name:'textarea',
		    	fieldLabel:"描述",
		    	//TextField属性
		    	emptyText:"请描述下你的情况",	
		    })
		    var numberfield=new Ext.form.NumberField ({
		    	name:'number',
		    	fieldLabel:"number加强版输入框",
		    	emptyText:"请输入",
		    	//NumberField 自身属性
		    	minValue:10,
		    	maxValue:10000,
		    	decimalPrecision:1,//精度。设置小数点后最大精确位数(默认为 2)。	
		    })
            var hiddenfield=new Ext.form.Hidden({
            	//Ext.form.Field属性
                name:'hiddenField',
                value:'这个是表单隐藏项'
            });
             /* 增加单选按钮 组*/   //提交的字段 [name:inputValue]  sex:1
             //这个不添加到一个Group中 
            var radio_alone=new Ext.form.Radio({//只要是同name,即使不在同一组中，能实现当选效果
            	//Ext.form.Field属性
                fieldLabel:"性别'is alone'",//不在Group中，这个属性才生效
                name:'sex',//注意要同name,才能实现单选作用
                //Checkbox属性
                boxLabel:'女',              
                inputValue:"woman",
                checked:true
            })
            //这个添加到Group中
            var radio=new Ext.form.Radio({
            	//Ext.form.Field属性
            	name:'sex',//注意要同name,才能实现单选作用
            	//Checkbox属性,Radio自身没有添加属性
                boxLabel:'女', //checkbox旁边显示的文字
                inputValue:"woman",
                checked:true
            })
			//radioGroup组
            var radioGroup=new Ext.form.RadioGroup({
            	//Ext.form.Field属性
                fieldLabel:'性别',
                width:100,
                //checkBoxGroup属性
                items:[{  //这边测试，一个写在里面。一个外面
               		name:'sex',
                    boxLabel:'男',
                    inputValue:"man",
                },radio],
                //columns布局方式，几列。默认"auto",值有：'auto'/Numbel/Array
                columns:2,//这里表示：2列
                allowBlank:false,//是否允许为空
                blankText:"这个是radioGroup不能为空文本提示"//【校验】是否满足allowBlank的文字提示
            });
            /* 复选框 添加到表单中*/ //提交的字段 [name:inputValue] 得到的是数组 love[1,2]  
            var checkbox_alone=new Ext.form.Checkbox({
            	//Ext.form.Field属性
            	name:'love',
                fieldLabel:"爱好'is alone'",//不在Group中，这个属性才生效
                //Checkbox属性
                boxLabel:'唱歌',
                inputValue:"sing",
                checked:true
            })
            //这个添加到Group中
            var checkbox=new Ext.form.Checkbox({
                //Ext.form.Field属性
                name:'love',
                //Checkbox属性
                boxLabel:'运动',
                inputValue:"sports",
                checked:true
            })
            //CheckboxGroup组
            var checkboxGroup=new Ext.form.CheckboxGroup({
                fieldLabel:'爱好',
                width:800,
                //checkBoxGroup属性
                items:[{//这边测试，一个写在里面。一个外面
                 	name:'love',
                    boxLabel:'上网',
                    inputValue:"surf",
                },{
                    name:'love',
                    boxLabel:'旅游',
                    inputValue:"travel",
                },{
                    name:'love',
                    boxLabel:'购物',
                    inputValue:"shopping",
                },checkbox],
                //columns布局方式，几列。默认"auto",值有：'auto'/Numbel/Array
                columns:[0.4,0.2,0.2,0.2],//这里表示：4列，宽度比例为Array中的比例
                allowBlank:false,//是否允许为空
                blankText:"这个是checkGroup不能为空文本提示"//【校验】是否满足allowBlank的文字提示
            })
//按钮
 var btReset=new Ext.Button({
        text:'重置',
        handler:function(val){
           form.getForm().reset();//表单重置
        }
});
var btSubmit=new Ext.Button({
        text:'提交',
        listeners:{
           'click':function(){
              if(form.getForm().isValid()){//表单校验
                  //获得表单内容
                  console.log(form.getForm().getValues());//获得表单内容，包括隐藏域的
                  form.getForm().submit({
	                  url : 'http://localhost:8080/hello/form',//提交地址  
	                  waitMsg : '正在提交,请稍等……',  
	                  timeout : 100000,  
	                  method : 'GET',  
	                  reset : false ,   //当成功提交后清空输入域的值  
	                  success : function(form,action){     //是与业务相关的只有后台响应为true或响应的JSON包含success:true  
	                    Ext.MessageBox.alert('提示', '提交成功');
	                  },
	                  failure : function(form,action){  //后台响应的JSON包含error:{},就认为连接失败  
	                     Ext.Msg.alert('提示','提交失败<br/>');   
	                  }  
                  })
                 
              }else{
                  Ext.MessageBox.alert('提示', '输入不合法');
              }}
        }
});
			//表单
			var form=new Ext.form.FormPanel({
				renderTo:"form",
				items:[textfield1,textfield2,trigger,datefield,comboBoxLocal,comboboxRemote,
				timefield,textarea,numberfield,hiddenfield,radio_alone,radioGroup,checkbox_alone,checkboxGroup],
				buttons:[btReset,btSubmit]
			})
		})
	</script>
	
  </head>
  
  <body>
    <div id="form"></div>
  </body>
</html>
