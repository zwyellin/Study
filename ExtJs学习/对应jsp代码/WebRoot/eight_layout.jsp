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
	Ext.onReady(function () {
            new Ext.Viewport({
                title: "Viewport",
                layout: "border",
                defaults: {
                    bodyStyle: "background-color: #FFFFFF;",
                    frame: true
                },
                items: [
                            { region: "west", width:90, title: 'north', collapsible: true },
                            { region: "east", width: 90, title: 'north', collapsible: true },
                            { region: "north", height: 100, title:'north' , collapsible:true },
                            { region: "center", split: true, border: true, collapsible: true,title:'center' },
                            { region: "south", title:"south", split: true, border: true, collapsible: true, height: 100 },

                        ]
            });
        });
	</script>
  </head> 
  <body style="padding:20px">
    <div id="window"></div>
  </body>
</html>  