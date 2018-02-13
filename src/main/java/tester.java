
import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Pattern;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class tester {
   
   
   public static void main(String[] args) throws IOException
   {
      //SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      /*
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd");
      Date date = new Date();
      String created_at = sdf.format(new Date());
      
      System.out.println("======> "+created_at);
      
      Calendar cal = Calendar.getInstance();
      cal.setTime(date);
      
      System.out.println("======> "+cal);
      */
      
      
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd");
      
      Date current = new Date();
      String currentSTR = sdf.format(current);
      System.out.println("currentSTR ==> "+currentSTR);
      
      Calendar calMonth = Calendar.getInstance();
      calMonth.setTime(current);
      calMonth.set(Calendar.MONTH, (calMonth.get(Calendar.MONTH)+1));
      
      Date month = new Date();
      month = calMonth.getTime();
      System.out.println("====> +1 month: "+sdf.format(month));
      
      
      Calendar calWeek = Calendar.getInstance();
      calWeek.setTime(current);
      calWeek.set(Calendar.MONTH, (calWeek.get(Calendar.DATE)+7));
      
      Date week = new Date();
      week = calWeek.getTime();
      System.out.println("====> +1 week: "+sdf.format(month));
      /*
      INSERT INTO rdv (id_rdv,id_user,id_patient,description,date_debut,date_fin, etat, created_at) 
              VALUES (1,1,1,'desc1', '2018-02-01 08:30:00', '2018-02-02 07:16:18', 'etat1', CURRENT_TIMESTAMP)
      */
      
      /*
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd");
      
      Calendar now = Calendar.getInstance();
      System.out.println("Current date : " 
              + sdf.format(now.get(Calendar.MONTH) + 1) 
              + " \n  "
              + now.get(Calendar.DATE) + "-" + now.get(Calendar.YEAR));
      
      
      now.add(Calendar.MONTH, 10);
      System.out.println("date after 10 months : " + (now.get(Calendar.MONTH) + 1) + "-"
              + now.get(Calendar.DATE) + "-" + now.get(Calendar.YEAR));
      
      */
   }
   
}
