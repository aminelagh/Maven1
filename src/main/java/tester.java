import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Patient;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import services.DiagnosticServiceImpl;
import services.PatientService;
import services.PatientServiceImpl;
import util.HibernateUtil;
import util.JDBCUtil;

public class tester {
   
   public static void main(String[] args) {
      
      //ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
      //PatientService patientService = (PatientServiceImpl)context.getBean("beanPatientServiceHibernate");
      //diagnosticService = (DiagnosticServiceImpl)context.getBean("beanDiagnosticServiceHibernate");
      
      //      System.out.println("********: "+patientService.getNextID2());
      
      //System.exit(0);
      
      
      JDBCUtil jdbc = new JDBCUtil("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/kineapp_db", "root", "");
      
      int nextid=1;
      Patient p = null;
      try{
         String query = "SELECT id_patient FROM patients order by id_patient desc limit 1";
         ResultSet rs = jdbc.getSelection(query);         
         if(rs.next())
            nextid = rs.getInt(1)+1;         
         
         
      }catch(Exception e){
         System.out.println("Erreur: "+e.getCause()+" \n "+e.getMessage());
      }
      System.out.println("next id: "+nextid);
      
   }
   
}
