<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<div align="center">
<BODY background=image/background3.jpg><font size=2>
<br><br><br><br><br><br><br><br><br><br>
<div align="center">
 <Font color=red   size=20><H3></H3></Font>
<A href="upload.jsp"><font size=2>上传照片</font></A>
<br>
 <div align="center">
 <% if(loginBean==null){
        response.sendRedirect("Login.jsp");//重定向到登录页面
   }
   else {
       boolean b =loginBean.getLogname()==null||
                  loginBean.getLogname().length()==0;
       if(b)
         response.sendRedirect("Login.jsp");//重定向到登录页面
   }%>
 
<%   try {  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception e){} 
      String uri="jdbc:mysql://127.0.0.1/test1?"+
                             "user=root&password=&characterEncoding=gb2312";
      Connection con; 
      Statement sql;
    
      ResultSet rs1;
      ResultSet rs2;
      try {
        con=DriverManager.getConnection(uri);
        sql=con.createStatement();
        
        //读取classify表，获得分类：  
        rs1=sql.executeQuery("SELECT * FROM   cloth_dynasty  ");
        out.print("<form action='queryServlet' method ='post'>") ;
        out.print("<select name='fenleiNumber'>") ;
        while(rs1.next()){
           int id = rs1.getInt(1);
           String name = rs1.getString(2);
           out.print("<option value ="+id+">"+name+"</option>");
        }
        String numberID = request.getParameter("id");
        out.println(numberID);
       out.print("</select>");
        out.print("<input type ='submit' value ='查询'>");  
        out.print("</form>");
        con.close();
      }
      catch(SQLException e){ 
         out.print(e);
      }
        
      try {
          con=DriverManager.getConnection(uri);
          sql=con.createStatement();
        
        //读取classify表，获得分类：  
        rs2=sql.executeQuery("SELECT * FROM   cloth_detail  ");
        //out.print("<form action='queryServlet' method ='post'>") ;
        //out.print("<select name='fenleiNumber'>") ;
        while(rs2.next()){
           int id = rs2.getInt(1);
           String picture = rs2.getString(2);
          // out.print("<option value ="+id+">"+name+"</option>");

          String pic ="<img src='image/"+picture+"' width=476 height=520 ></img>";
       
          out.print(pic); //产片图片
        	 
        }  
       
     
     }
     catch(SQLException e){ 
        out.print(e);
     }
%>
</div>                                                                                                                                                                  


</font>




</BODY></HTML>
