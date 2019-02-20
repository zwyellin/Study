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
          
          	var tabs = new Ext.TabPanel({
    			renderTo: Ext.getBody(),
   		     	activeTab: 0,
   		     	tabPosition:"top",//Tab候选栏渲染的位置（默认为 'top'）。其它可支持值是'bottom'
    			items: [{
        			title: 'Tab 1',
        			
        			html: 'A simple tab'
    			},{
       				title: 'Tab 2',
        			html: 'Another one'
    			}]
});

           
        })     
	</script>
  </head> 
  <body style="padding:20px">
    <div id="window"></div>

   

  </body>
</html>  