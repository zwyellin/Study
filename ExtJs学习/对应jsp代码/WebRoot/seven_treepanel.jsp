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
			Ext.QuickTips.init();//初始化消息提示框
			var mytree=new Ext.tree.TreePanel({
			       renderTo:"window",//应用到的html元素id
				   title:"Extjs静态树",
			       animate:true,//是否动画
			       autoScroll:true,
			       autoHeight:true,
			       width:200,
			       //
			       collapsible:true,//是否可折叠的
			       rootVisible:true,//是否显示根节点						      
			       lines:true,//是否显示节点之间连接的横竖线
			       loader:new Ext.tree.TreeLoader({
			       		dataUrl:"http://localhost:8080/hello/tree",
			       		baseParams:{name:"tree"}//可选，额外传参。本身会传node属性:当前el的id
			       }),//
			       root:new Ext.tree.AsyncTreeNode({// nodeType: 'async',
			           id:"root",
			           text:"根节点",//节点名称			
			           expanded:true,//展开			
			           leaf:false,//是否为叶子节点,默认false			
			           children:[
			           		{text:'节点 a',leaf:true},
			           		{text:'节点 b',expanded:true,//这里测试 ,qtip href expanded checked
			           		children:[
			           			{text:"节点b1",checked:true,leaf:true},
			           			{text:"节点b2",checked:true,leaf:true},
			           			{text:"节点b3",qtip:"这个是超链接",href:"http://www.baidu.com",leaf:true}]
			           		},
			           		{id:"child1",text:'节点c'},//测试，如果leaf:false且没有children，则会异步加载数据
			           		{text:'节点d',
			           			children:[
			           			{id:"child2",text:"节点d1"}]//对比id:child1,的请求参数
			           		}],//children end
			       }),
			       listeners:{
			       		"beforeload":function()	{//第一次点击+都会触发。
			       			console.log("加载数据")
			       		}
			       }
			   });
		})
	</script>
  </head> 
  <body style="padding:20px">
    <div id="window"></div>

   

  </body>
</html>  