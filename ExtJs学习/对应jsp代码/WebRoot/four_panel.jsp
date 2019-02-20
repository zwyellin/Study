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
            //panel面板
            var panel=new Ext.Panel({
	        	//component属性
	        	renderTo:"panel",
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
	        	frame:false,
	        	draggable:false,//拖动
	        	floating:false,//浮动
	        	tools:[{
	        		id:"help"
	        		},{
	        		
	        		}]
           })
        })
	</script>
  </head> 
  <body style="padding:20px">
  <div id="panel"></div>
   <div id="panelContentEl" style="border:1px solid red">
   	<span style="color:red">外部html</span></br>
   	可以通过panel的contentEl属性:'对应html的id'</br>
   	就可以在panel外定义好html,然后渲染进来</br>
   	<span style="color:blue">这块内容在panel的html自身html内容的后面</span>
   </div>
   
   <div id="window"></div>
  </body>
</html>  