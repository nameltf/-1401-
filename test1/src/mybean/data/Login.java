package mybean.data;
import java.util.*;
public class Login {
   String logname="",
          backNews="未登录";
   LinkedList<String> cpicture; //收藏图片
   public Login() {
	      cpicture = new LinkedList<String>();
	   }
   public void setLogname(String logname){  
      this.logname = logname;
   }
   public String getLogname(){
      return logname;
   }
   public void setBackNews(String s) {
      backNews = s;
   } 
   public String getBackNews(){
      return backNews;
   }
   public LinkedList<String> getcpicture() { 
	      return cpicture;
	   }
}
   

