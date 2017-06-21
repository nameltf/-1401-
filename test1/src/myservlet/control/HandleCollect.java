package myservlet.control;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.*;
import javax.servlet.http.*;
import mybean.data.Login;

public class HandleCollect extends HttpServlet {
	   public void init(ServletConfig config) throws ServletException { 
		      super.init(config);
		   }
		   public  void  doPost(HttpServletRequest request,HttpServletResponse response) 
		                        throws ServletException,IOException {
		      request.setCharacterEncoding("gb2312");
		      String c = request.getParameter("collect");
		      System.out.println(c);
		      Login loginBean=null;
		      HttpSession session=request.getSession(true);
		      try{  loginBean=(Login)session.getAttribute("loginBean");
		            boolean b =loginBean.getLogname()==null||
		            loginBean.getLogname().length()==0;
		            if(b)
		              response.sendRedirect("Login.jsp");//重定向到登录页面
		            LinkedList<String> picture = loginBean.getcpicture();
		             picture.add(c);
		            speakSomeMess(request,response,c); 
		      }
		      catch(Exception exp){
		           response.sendRedirect("Login.jsp");//重定向到登录页面
		      }
		   }
		   public  void  doGet(HttpServletRequest request,HttpServletResponse response)
		                        throws ServletException,IOException {
		      doPost(request,response);
		   }
		   public void speakSomeMess(HttpServletRequest request,
		                     HttpServletResponse response,String c) {
		       response.setContentType("text/html;charset=GB2312");
		        try {
		         PrintWriter out=response.getWriter();
		         out.print("<HTML><Body background=image/background1.jpg><center><body>");
		        
		         out.println("<h2>"+c+"已收藏</h2>") ;
		       
		        
		      
		         out.println("</body></html>");
		        }
		        catch(IOException exp){}
		   }
		}

