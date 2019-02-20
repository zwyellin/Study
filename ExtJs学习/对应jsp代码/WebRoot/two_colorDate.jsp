<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'two_colorPalette.jsp' starting page</title>
   
    <script type="text/javascript"  src="extjs/adapter/ext/ext-base.js"></script>
    <script type="text/javascript"  src="extjs/ext-all.js"></script>
    <script type="text/javascript"  src="extjs/ext-lang-zh_CN.js"></script>
    <link href="extjs/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
    <link href="css/two_menu.css" rel="stylesheet" type="text/css" >
    <script type="text/javascript">
		Ext.onReady(function(){
			/*颜色选择器*/
			var colorPalette=new Ext.ColorPalette({
				renderTo:"colorPalette",//渲染到 <div id="colorPalette"></div>节点。component继承属性
				style:"display:inline-block;margin-right:20px",//修改组件样式
				listeners:{
					'select':function(self,color){
						console.log(self);//===this
						console.log(color);//选择的颜色
					}
				}
			})
			//配置value的颜色选择器
			var colorPaletteValue=new Ext.ColorPalette({
				renderTo:"colorPalette",//可以渲染同一元素上
				style:"display:inline-block;margin-right:20px",//修改组件样式
				value:"0000FF",//初始化时高亮的颜色（必须为不包含 # 符号的6位16进制颜色编码）
				listeners:{}
			})
			//select（）方法使用
			setTimeout(function(){
				colorPalette.select("0000FF");
			},1000)
			
		  /*日期选择器*/
			var DatePicker=new Ext.DatePicker({
				renderTo:"datePicker",
				style:"display:inline-block;margin-right:20px",//修改组件样式
				listeners:{
					'select':function(self,date){
						console.log(self);
						console.log(date);
					}
				}
			})
			//
			var DatePicker=new Ext.DatePicker({
				renderTo:"datePicker",
				style:"display:inline-block;margin-right:20px",//修改组件样式
				disabledDays:[1,3,4,5,0],//0-6表示日，一，二，三，四，五，六
				disabledDaysText:"这个是当选中禁用星期时显示的错误文本",
				handler:function(self,date){console.log(date)}
			})
		
		})
	</script>
  </head>
  <body>
   <div id="colorPalette"></div>
   <div id="datePicker"></div>
  </body>
</html>
