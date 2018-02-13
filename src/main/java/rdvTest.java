
import java.sql.Connection;
import java.sql.*;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Agenda;


public class rdvTest {
   
   public static void main(String[] args) {
      
      Connection cn = null;
      Statement st = null;
      
      String driver = "com.mysql.jdbc.Driver";
      String url = "jdbc:mysql://localhost:3306/kineapp_db";
      
      try {
         Class.forName(driver);
         cn = DriverManager.getConnection(url, "root", "");
         st = cn.createStatement();
         
         ResultSet rs = null;
         
         rs = st.executeQuery("select * from rdv ;");
         
         ArrayList<Agenda> items = new ArrayList<Agenda>();
         
         while(rs.next()){
            String date_d = rs.getString("date_debut");
            String date_debut = date_d.substring(0, 10);
            String heure_debut = date_d.substring(11, 21);
            
            String date_f = rs.getString("date_fin");
            String date_fin = date_f.substring(0, 10);
            String heure_fin = date_f.substring(11, 21);  
            
            Agenda object = new Agenda();
            object = new Agenda();
            object.setId_user(rs.getInt("id_user"));
            object.setId_agenda(rs.getInt("id_agenda"));
            object.setId_patient(rs.getInt("id_patient"));
            object.setDescription(rs.getString("description"));
            object.setDate_debut(date_debut);
            object.setDate_fin(date_fin);
            object.setHeure_debut(heure_debut);
            object.setHeure_fin(heure_fin);
            object.setEtat(rs.getString("etat"));
            object.setCreated_at(rs.getDate("created_at"));
            items.add(object);
            System.out.println(object.toString()+"\n**************");
         }
         
         
      } catch (Exception ex) {
         Logger.getLogger(rdvTest.class.getName()).log(Level.SEVERE, null, ex);
      }
      
      
   }
   
}
