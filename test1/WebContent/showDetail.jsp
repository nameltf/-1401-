<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="mybean.data.Login" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<HTML><Body background=image/background3.jpg><center>
<% if(loginBean==null){
        response.sendRedirect("Login.jsp");//重定向到登录页面
   }
   else {
       boolean b =loginBean.getLogname()==null||
                  loginBean.getLogname().length()==0;
       if(b)
         response.sendRedirect("Login.jsp");//重定向到登录页面
   }

   String id = request.getParameter("chakan"); 
 
   if(id==null) {
       out.print("没有产品号，无法查看细节");
       return;
   } 
   Connection con;
   Statement sql; 
   ResultSet rs;
   try {  Class.forName("com.mysql.jdbc.Driver");
   }
   catch(Exception e){} 
   String uri="jdbc:mysql://127.0.0.1/test1";
   try{ 
     con=DriverManager.getConnection(uri,"root","");
     sql=con.createStatement();
     String cdn=
     "SELECT * FROM cloth_detail where id = '"+id+"'";
     rs=sql.executeQuery(cdn);
     String picture="02.jpg";
   
     while(rs.next()){
       String idd=rs.getString(1);
        picture=rs.getString(2); 
     } 
     String pic ="<img src='image/"+picture+"' width=476 height=520 ></img>";
     out.print(pic); //产片图片
     con.close();
  }
  catch(SQLException exp){}
%>
</Center></BODY></HTML>
