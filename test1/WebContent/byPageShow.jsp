<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="mybean.data.DataByPage" %>
<%@ page import="com.sun.rowset.*" %>
<jsp:useBean id="dataBean" class="mybean.data.DataByPage" scope="session"/>
<HTML><Body background=image/background3.jpg><center>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<div align="center" valign="middle" >
  <table border=1 width="704"   >
  <tr>
    <th><font Size=5>ID</th>
    <th><font Size=4>查看图片</th>
    <th><font Size=5>收藏</th>
    
  </tr>
<jsp:setProperty name="dataBean" property="pageSize" param="pageSize"/>
<jsp:setProperty name="dataBean" property="currentPage" param="currentPage"/>
<%    
      CachedRowSetImpl rowSet=dataBean.getRowSet();
      if(rowSet==null) {
         out.print("没有任何查询信息，无法浏览");
         return;  
      }
      rowSet.last(); 
      int totalRecord=rowSet.getRow();
      out.println("全部记录数"+totalRecord+"<p>"); //全部记录数
      int pageSize=dataBean.getPageSize();  //每页显示的记录数
      int totalPages = dataBean.getTotalPages();
      if(totalRecord%pageSize==0)
           totalPages = totalRecord/pageSize;//总页数
      else
           totalPages = totalRecord/pageSize+1;
      dataBean.setPageSize(pageSize);
      dataBean.setTotalPages(totalPages);
      if(totalPages>=1) {
         if(dataBean.getCurrentPage()<1)
              dataBean.setCurrentPage(dataBean.getTotalPages());
         if(dataBean.getCurrentPage()>dataBean.getTotalPages())
              dataBean.setCurrentPage(1);
         int index=(dataBean.getCurrentPage()-1)*pageSize+1;
         rowSet.absolute(index);  //查询位置移动到currentPage页起始位置
         boolean boo=true;
         for(int i=1;i<=pageSize&&boo;i++) { 
            String id=rowSet.getString(1);
            String picture=rowSet.getString(2); 
            String detail="<form  action='showDetail.jsp' method = 'post'>"+
                     "<input type ='hidden' name='chakan' value= "+id+">"+
                     "<input type ='submit'  value='查看图片' ></form>";
             String button="<form  action='collectServlet' method = 'post'>"+
                             "<input type ='hidden' name='collect' value= "+picture+">"+
                             "<input type ='submit'  value='收藏图片' ></form>";
            out.print("<tr>");
            out.print("<td>"+id+"</td>");
            out.print("<td>"+detail+"</td>");
            out.print("<td>"+button+"</td>");
            out.print("</tr>");
            boo=rowSet.next();
         }
     }
%>

 </table>
 <BR>每页最多显示<jsp:getProperty name="dataBean" property="pageSize"/>条信息
 <p>当前显示第<Font color=blue>
     <jsp:getProperty name="dataBean" property="currentPage"/>
   </Font>页,共有
   <Font color=blue><jsp:getProperty name="dataBean" property="totalPages"/>
   </Font>页。
<Table align="center">
  <tr><td><FORM action="" method=post>
          <Input type=hidden name="currentPage" value=
         "<%=dataBean.getCurrentPage()-1 %>">
           <Input type=submit name="g" value="上一页"></FORM></td>&nbsp;&nbsp;
      <td><FORM action="" method=post>
          <Input type=hidden name="currentPage"
           value="<%=dataBean.getCurrentPage()+1 %>">
          <Input type=submit name="g" value="下一页"></FORM></td></tr>
 
</Table>
 
</Center>
</BODY></div></HTML>
