<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'init.jsp' starting page</title>
    <script type="text/javascript"  src="extjs/adapter/ext/ext-base.js"></script>
    <script type="text/javascript"  src="extjs/ext-all.js"></script>
    <script type="text/javascript"  src="extjs/ext-lang-zh_CN.js"></script>
    <link href="extjs/resources/css/ext-all.css" rel="stylesheet" type="text/css" />
    <link href="css/two_menu.css" rel="stylesheet" type="text/css" >
    <script type="text/javascript">
        Ext.onReady(function(){
        	var toolbar= new Ext.Toolbar({  
                renderTo:'toolbar',  //渲染到某个节点上
                items:[{
                	text:'菜单按钮',
                	menu:new Ext.menu.Menu({
                		items:[
                			new Ext.menu.Item({text:"普通选项"}),
                			{text:"普通选项另外写法"},//普通选项 简写
                			{text:"配置href的选项",href:'http://www.baidu.com'},
                			new Ext.menu.Item({text:"这个是带图标的选项",iconCls:'menuIcon menuIcon1'}),//定义了背景图的CSS样式类。类名，可以多个
                			new Ext.menu.Separator(),//也可以配置属性，但都是从baseItem继承过来的
                			'-',//分隔符 简写
                			new Ext.menu.CheckItem({text:"这个是check选项",checked:false}),//checked 默认false
                			{text:"check选项另外写法",checked:false},//check选项 简写
                			new Ext.menu.CheckItem({text:"这个是默认勾选的check选项",checked:true}),
                			new Ext.menu.Separator(),
                			new Ext.menu.CheckItem({text:"这个check加入到了单选组",group:'groupOne'}),
                			new Ext.menu.CheckItem({text:"这个check加入到了单选组",group:'groupOne'}),//通过group把其加入一个单选组
                			new Ext.menu.Separator(),
                			new Ext.menu.TextItem({text:"这个是静态文本"}),
                			'静态文本简写',//静态文本简写
                			new Ext.menu.Item({text:"这个是菜单选项",menu:new Ext.menu.Menu({
               						items:[
               							{text:"普通选项"},
               							{text:"普通选项"},
               							{text:"普通选项"}]
                				})
                			}),
                			new Ext.menu.Separator(),
                			new Ext.menu.Item({text:"color菜单",menu:new Ext.menu.ColorMenu()}),
                			new Ext.menu.Item({text:"date菜单",menu:new Ext.menu.DateMenu()})
                		]
                	})
                }
                ]
            })	
        })
   </script>
  </head> 
  <body>
  <div id="toolbar"></div>
  </body>
</html>
