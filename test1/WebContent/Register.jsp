<%@ page contentType="text/html;charset=GB2312" %>
<jsp:useBean id="userBean" class="mybean.data.Register" scope="request"/>
<title>注册页面</title>
<HTML><BODY background=image/hi2.jpg><Font size=20>

<CENTER> <h1><font Size=400 color=blue>        
         </font></h1><br>
         <h1><font Size=400 color=blue>        
         </font></h1><br>
<tr></tr>
<FORM action="registerServlet" method="post" name=form>
<div align="center">
<table   cellspacing="50">
   <tr><td><img src="image/name.png" width=30 height=30 ></img> <font Size=6 >   用 户 名:<Input size=30  type=text name="rname"  ></td></tr>
    <tr><td><img src="image/password.png" width=30 height=30 ></img> <font Size=6 > 输入密码:<Input size=30  type=password name="rpassword"></td></tr>
    <tr><td><img src="image/password.png" width=30 height=30 ></img> <font Size=6 >  重复密码:<Input size=30  type=password name="again_password"></td></tr>
    <tr ><tr></tr>
     <td><Input  type=submit name="g" value="注册" style="width:100px;height:50px;font-size:30px;"></td>
     <td><A href="Login.jsp"><font Size=6 >登录</A></td>
    </tr>
</table>
</Form>

<div align="center"><font Size=5 >
<p> 注册反馈：
<jsp:getProperty name="userBean"  property="backNews" />
<p> <font Size=5 >用户姓名：
<jsp:getProperty name="userBean"  property="rname"/>
</div >   
</Body></HTML>

