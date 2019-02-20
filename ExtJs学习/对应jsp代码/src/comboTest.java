import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/comboTest")
public class comboTest extends HttpServlet {

	/**
		 * The doGet method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to get.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);
	}

	/**
		 * The doPost method of the servlet. <br>
		 *
		 * This method is called when a form has its tag value method equals to post.
		 * 
		 * @param request the request send by the client to the server
		 * @param response the response send by the server to the client
		 * @throws ServletException if an error occurred
		 * @throws IOException if an error occurred
		 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("combo 收到请求");
		Enumeration<?> enu=request.getParameterNames();  
		while(enu.hasMoreElements()){  
		String paraName=(String)enu.nextElement();  
		System.out.println(paraName+": "+request.getParameter(paraName));  
		} 
		
		int Param_type=Integer.parseInt(request.getParameter("type"));//参数type
		int param_limit=Integer.parseInt(request.getParameter("limit"));//参数limit
		int param_start=0;
		try{
			param_start=Integer.parseInt(request.getParameter("start"));//参数start
		}catch(Exception e){
			
		}
		
		String[] strArrJX={"赣州","吉安","南昌","抚州","鹰潭","上饶","九江","景德镇","宜春","萍乡"};//type1
		String[] strArrJS={"南京","镇江","常州","无锡","苏州","盐城","扬州","泰州","徐州","张家港"};//type2
		String[] strArrAH={"安庆","铜陵","黄山","滁州","马鞍山","宿州","芜湖","宣城","六安","合肥"};//type3
		String[] strArr=strArrJX;//默认数组
		switch (Param_type) {
		case 1: strArr=strArrJX;break;
		case 2: strArr=strArrJS;break;
		case 3: strArr=strArrAH;break;
		default:
			break;
		}
		//返回数据
		String jsonStr="";
		if(param_start<strArr.length){
			jsonStr	="{'data':[";
			int length=(param_start+param_limit)>strArr.length ? strArr.length :(param_start+param_limit);
			for (int i =param_start; i <length; i++) {
				jsonStr+="{'id':'"+i+"','value':'"+strArr[i]+"'},";
			}
		}else{
			jsonStr	="{'data':['id':null,'value':null";
		}
	
		jsonStr=jsonStr.substring(0, jsonStr.length()-1);
		jsonStr+="],'total':'"+strArr.length+"'}";
		out.println(jsonStr);
		out.flush();
		out.close();
	}

}
