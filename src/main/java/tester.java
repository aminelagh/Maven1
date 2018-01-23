
import java.util.regex.Pattern;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import services.*;

public class tester {
   
   public static void main(String[] args) {
      
      
      //ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
      //Service service = (ServiceImpl)context.getBean("beanService");
      
      
      String Str = new String("a.b.cd.e.fgh..i.th.amming.jpg");
      String extension = "";
      for (String retval: Str.split(Pattern.quote("."))) {
         //System.out.println(retval);
         extension = retval;
      }
      System.out.println(" extension : "+extension);
      
      
      String txt = "programming.jpg";// file.getOriginalFilename();
      String[] parts = txt.split(".");
      System.out.println(" **** ");
      for (String part : parts) {
         System.out.println(" **** ");
         System.out.println(part);
      }
      //System.out.println("=======> "+parts[0]);
      //System.out.println("=======> "+parts[1]);
      
   }
   
   
   
   
}
