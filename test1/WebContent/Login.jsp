<%@ page contentType="text/html;charset=GB2312" %>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope="session"/>
<title>��¼ҳ��</title>
<div align="center">
<HTML><BODY background=image/hi1.jpg><Font size=14>
<CENTER> <h1><font Size=400 color=blue>        </font></h1><br>
         <h1><font Size=400 color=blue>         </font></h1><br>
<FORM action="loginServlet" Method="post">
<div align="center">
<table   cellspacing="60"   >
   <tr><td><img src="image/name.png" width=30 height=30 ></img><font Size=6 >   �� ¼ ��:</font><Input   type=text name="rname" ></td></tr>
    <tr><td><img src="image/password.png" width=30 height=30 ></img><font Size=6 >  ��������:<Input  type=password name="rpassword"></td></tr>
     <td  align="center"><Input  type=submit name="l" value="��  ¼" style="width:100px;height:50px;font-size:25px;" ></A></td>  </tr> </table>
<table  cellpadding="40" cellspacing="10">     
     <tr>
     <td><font Size=5  color=pink><A href="Register.jsp">ע��</A></td>
     <td><font Size=5 ><A href="main.jsp">��ҳ</A></td>
     <td><font Size=5 ><A href="exitServlet">�˳�</A></td>
    </tr>
</table>
</form>
</div >
<div align="center" ><font Size=5.5  color=black>
��¼������Ϣ:<jsp:getProperty name="loginBean" property="backNews"/>
&nbsp;&nbsp;&nbsp;��¼����:<jsp:getProperty name="loginBean" property="logname"/>
<div >
</div >
</BODY></HTML>
