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
    <th><font Size=4>�鿴ͼƬ</th>
    <th><font Size=5>�ղ�</th>
    
  </tr>
<jsp:setProperty name="dataBean" property="pageSize" param="pageSize"/>
<jsp:setProperty name="dataBean" property="currentPage" param="currentPage"/>
<%    
      CachedRowSetImpl rowSet=dataBean.getRowSet();
      if(rowSet==null) {
         out.print("û���κβ�ѯ��Ϣ���޷����");
         return;  
      }
      rowSet.last(); 
      int totalRecord=rowSet.getRow();
      out.println("ȫ����¼��"+totalRecord+"<p>"); //ȫ����¼��
      int pageSize=dataBean.getPageSize();  //ÿҳ��ʾ�ļ�¼��
      int totalPages = dataBean.getTotalPages();
      if(totalRecord%pageSize==0)
           totalPages = totalRecord/pageSize;//��ҳ��
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
         rowSet.absolute(index);  //��ѯλ���ƶ���currentPageҳ��ʼλ��
         boolean boo=true;
         for(int i=1;i<=pageSize&&boo;i++) { 
            String id=rowSet.getString(1);
            String picture=rowSet.getString(2); 
            String detail="<form  action='showDetail.jsp' method = 'post'>"+
                     "<input type ='hidden' name='chakan' value= "+id+">"+
                     "<input type ='submit'  value='�鿴ͼƬ' ></form>";
             String button="<form  action='collectServlet' method = 'post'>"+
                             "<input type ='hidden' name='collect' value= "+picture+">"+
                             "<input type ='submit'  value='�ղ�ͼƬ' ></form>";
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
 <BR>ÿҳ�����ʾ<jsp:getProperty name="dataBean" property="pageSize"/>����Ϣ
 <p>��ǰ��ʾ��<Font color=blue>
     <jsp:getProperty name="dataBean" property="currentPage"/>
   </Font>ҳ,����
   <Font color=blue><jsp:getProperty name="dataBean" property="totalPages"/>
   </Font>ҳ��
<Table align="center">
  <tr><td><FORM action="" method=post>
          <Input type=hidden name="currentPage" value=
         "<%=dataBean.getCurrentPage()-1 %>">
           <Input type=submit name="g" value="��һҳ"></FORM></td>&nbsp;&nbsp;
      <td><FORM action="" method=post>
          <Input type=hidden name="currentPage"
           value="<%=dataBean.getCurrentPage()+1 %>">
          <Input type=submit name="g" value="��һҳ"></FORM></td></tr>
 
</Table>
 
</Center>
</BODY></div></HTML>
