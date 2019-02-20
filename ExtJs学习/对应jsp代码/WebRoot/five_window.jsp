<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'four_panel.jsp' starting page</title>
     <script type="text/javascript"  src="extjs/adapter/ext/ext-base.js"></script>
    <script type="text/javascript"  src="extjs/ext-all.js"></script>
    <script type="text/javascript"  src="extjs/ext-lang-zh_CN.js"></script>
    <link href="extjs/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
    <link href="css/two_menu.css" rel="stylesheet" type="text/css" >
    <script type="text/javascript">
            Ext.onReady(function(){
          	//toolbar
        	var toolbar_t= new Ext.Toolbar({  
                items:[['这个作为panel的tbar']]
            })	
            var toolbar_b= new Ext.Toolbar({  
                items:[['这个作为panel的bbar']]
            })
            //创建按钮
            var bt1=new Ext.Button({
            	text:"按钮1"
            })
            var bt2=new Ext.Button({
            	text:"按钮2"
            })
            //创建一个/*颜色选择器、日期选择器*/，添加到panel的item中,类型：基类是component即可		
			var colorPalette=new Ext.ColorPalette({})
			var DatePicker=new Ext.DatePicker({})
            
           var win=new Ext.Window({
	        	//component属性
	        	renderTo:"window",
	        	width:800,//不设置宽度会100%
	        	height:400,
	        	//Container容器属性
	        	items:[colorPalette,DatePicker],//这块内容在Body区最前面
	        	//panel属性
	        	  //这里是头部
	        	header:true,//会增加一个额头,用来显示title。如果false。title内容不展示
	        	title:"panel的title属性",//显示在header位置
	        	tbar:toolbar_t,
	        	  //这里是内容区
	        	html:"<div style='width:100px;height:100px;background:#ccc'>内部html</div>",
	        	contentEl:"panelContentEl",//内容显示位置在html后
	        	  //这里是底部
	        	bbar:toolbar_b,
	        	buttons:[bt1,bt2],
	        	buttonAlign:"center",//按钮布局的配置 
	        	  //其它配置
	        	frame:true,
				draggable:true,
	        	floating:false,//浮动,这里貌似要为false才··可以
	        	//window自身属性
	        	modal:false,//遮罩类型，默认false,表示弹出窗口后，父窗口能否有效。
	        	animateTarget:"window",//没发现效果
	        	resizable:true,//面板能否改变大小
	        	resizeHandles:"all",//配合resizable使用,值有  'n'北(north),'s'南(south),'e'东(east),'w'西(west),
                                    //'nw'西北(northwest),'sw'西南(southwest),'se'东北(southeast),'ne'东南(northeast),'all'所有(all)	        	
	        	
	        	closable:true,//是否具有关闭按钮,
	        	closeAction:"destroy",//点击关闭按钮时的动作,'destroy'发现无效
	        	
	        	minimizable:true,//是否具有最小按钮//如果resizable:false则此项没效果
	        	maximizable:true,//是否具有最大按钮//如果resizable:false则此项没效果
	        	maximized:true,//打开窗体时显示是否最大化，没发现什么效果
	        	
	        	minHeight:300,//这个对应手动重置窗体大小时，能缩小的宽高
	        	minWidth:300,
	        	listeners:{
	        		'close':function(){//关闭事件
	        			console.log("关闭")//返回false，可以阻止关闭
	        		},
	        		//window事件
	        		'minimize':function(e){//最小化要自定义，不然点击最小化按钮没有反应
	        			//this.close();
	   
	        			this.setSize(200,300);//minWidth无关
	        		},
	        		'maximize':function(){//最大化事件,不起作用
	        			console.log("最大化")
	        		},	        		
	        	}
           })
        })
	</script>
  </head> 
  <body style="padding:20px">
    <div id="window"></div>
    <div id="panelContentEl" style="border:1px solid red">
   		<span style="color:red">外部html</span></br>
   		可以通过panel的contentEl属性:'对应html的id'</br>
   		就可以在panel外定义好html,然后渲染进来</br>
   		<span style="color:blue">这块内容在panel的html自身html内容的后面</span>
   </div>
  </body>
</html>  