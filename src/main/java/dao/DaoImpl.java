package dao;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import models.Diagnostic;
import models.Historique_medical;
import models.Imagerie;
import models.Patient;
import models.Prescription;
import util.JDBCUtil;


public class DaoImpl implements Dao{
   
   JDBCUtil jdbc;
   public DaoImpl(JDBCUtil jDBCUtil){
      this.jdbc = jDBCUtil;
   }
   
   @Override
   public void addDiagnostic(Diagnostic dig) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      String query = "INSERT INTO diagnostics VALUES("
              + ""+dig.getId_diagnostic()+","
              + ""+dig.getId_patient()+","
              + "'"+dig.getDescription()+"',"
              + ""+dig.getNombre_seances()+","
              + "'"+created_at+"');";
      jdbc.execute(query);
   }
   
   @Override
   public void addHistorique_medical(Historique_medical hm) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      String date = sdf.format(hm.getDate());
      String query = "INSERT INTO historique_medical VALUES("
              + ""+hm.getId_hm()+","
              + ""+hm.getId_patient()+","
              + "'"+hm.getDescription()+"',"
              + "'"+date+"',"
              + "'"+created_at+"');";
      jdbc.execute(query);
   }
   
   @Override
   public void addImagerie(Imagerie im) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      String query = "INSERT INTO imageries VALUES("
              + ""+im.getId_imagerie()+","
              + ""+im.getId_prescription()+","
              + "'"+im.getFilename()+"',"
              + "'"+created_at+"');";
      jdbc.execute(query);
   }
   
   @Override
   public void addPatient(Patient p) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      int fumeur = p.isFumeur() ? 1 : 0;
      String query = "INSERT INTO patients VALUES("
              + ""+p.getId_patient()+","
              + ""+p.getId_user()+","
              + "'"+p.getNom()+"',"
              + "'"+p.getPrenom()+"',"
              + "'"+p.getCin()+"',"
              + "'"+p.getAdresse()+"',"
              + "'"+p.getDob()+"',"
              + ""+fumeur+","
              + "'"+created_at+"');";
      jdbc.execute(query);
   }
   
   @Override
   public void addPrescription(Prescription pr) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      String date = sdf.format(pr.getDate());
      String query = "INSERT INTO prescriptions VALUES("
              + ""+pr.getId_prescription()+", "
              + ""+pr.getId_patient()+", "
              + "'"+pr.getDescription()+"', "
              + "'"+date+"', "
              + "'"+created_at+"');";
      jdbc.execute(query);
   }
   
   @Override
   public void updateDiagnostic(Diagnostic dig) {
      String query = "UPDATE diagnostics SET id_patient="+dig.getId_patient()+", "
              + "description='"+dig.getDescription()+"', "
              + "nombre_seances="+dig.getNombre_seances()+", "
              + "WHERE id_diagnostic="+dig.getId_diagnostic()+" ; ";
      jdbc.execute(query);
   }
   
   @Override
   public void updateHistorique_medical(Historique_medical hm) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String date = sdf.format(hm.getDate());
      String query = "UPDATE historique_medical SET id_patient="+hm.getId_patient()+", "
              + "description='"+hm.getDescription()+"', date='"+date+"', "
              + "WHERE id_hm="+hm.getId_hm()+" ; ";
      jdbc.execute(query);
   }
   
   @Override
   public void updateImagerie(Imagerie im) {
      String query = "UPDATE patients SET id_prescription="+im.getId_prescription()+", "
              + "filename='"+im.getFilename()+"', "
              + "WHERE id_imagerie="+im.getId_imagerie()+" ; ";
      jdbc.execute(query);
   }
   
   @Override
   public void updatePatient(Patient p) {
      int fumeur = p.isFumeur()?1:0;
      String query = "UPDATE patients SET id_user="+p.getId_user()+", "
              + "nom='"+p.getNom()+"', "
              + "prenom='"+p.getPrenom()+"', "
              + "cin='"+p.getCin()+"', "
              + "adresse='"+p.getAdresse()+"', "
              + "dob='"+p.getDob()+"', "
              + "fumeur="+fumeur+" "
              + "WHERE id_patient="+p.getId_patient()+" ; ";
      jdbc.execute(query);
   }
   
   @Override
   public void updatePrescription(Prescription pr) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String date = sdf.format(pr.getDate());
      String query = "UPDATE prescriptions SET id_patient="+pr.getId_patient()+", "
              + "description='"+pr.getDescription()+"', "
              + "date='"+date+"', "
              + "WHERE id_prescription="+pr.getId_prescription()+" ; ";
      jdbc.execute(query);
   }
   
   @Override
   public void deleteDiagnostic(int dig) {
      String query = "DELETE FROM diagnostics WHERE id_diagnostic="+dig+" ;";
      jdbc.execute(query);
   }
   
   @Override
   public void deleteHistorique_medical(int hm) {
      String query = "DELETE FROM historique_medical WHERE id_hm="+hm+" ;";
      jdbc.execute(query);
   }
   
   @Override
   public void deleteImagerie(int im) {
      String query = "DELETE FROM imageries WHERE id_imagerie="+im+" ;";
      jdbc.execute(query);
   }
   
   @Override
   public void deletePatient(int pa) {
      String query = "DELETE FROM patients WHERE id_patient="+pa+" ;";
      jdbc.execute(query);
   }
   
   @Override
   public void deletePrescription(int pr) {
      String query = "DELETE FROM prescriptions WHERE id_prescription="+pr+" ;";
      jdbc.execute(query);
   }
   
   @Override
   public Diagnostic getDiagnostic(int id_dig) {
      Diagnostic p = null;
      try{
         String query = "SELECT * FROM diagnostics where id_diagnostic = "+id_dig;
         ResultSet rs = jdbc.getSelection(query);
         if(rs.next())
         {
            p = new Diagnostic();
            p.setId_diagnostic(rs.getInt("id_diagnostic"));
            p.setId_patient(rs.getInt("id_patient"));
            p.setDescription(rs.getString("description"));
            p.setNombre_seances(rs.getInt("nombre_seances"));
            p.setCreated_at(rs.getDate("created_at"));
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getDiagnostic(): "+e.getCause()+" \n "+e.getMessage());
      }
      return p;
   }
   
   @Override
   public Historique_medical getHistorique_medical(int id_hm) {
      Historique_medical hm = null;
      try{
         String query = "SELECT * FROM historique_medical where id_hm = "+id_hm;
         ResultSet rs = jdbc.getSelection(query);
         if(rs.next()){
            hm = new Historique_medical();
            hm.setId_hm(rs.getInt("id_hm"));
            hm.setId_patient(rs.getInt("id_patient"));
            hm.setDescription(rs.getString("description"));
            hm.setDate(rs.getDate("date"));
            hm.setCreated_at(rs.getDate("created_at"));
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getHistorique_medical(): "+e.getCause()+" \n "+e.getMessage());
      }
      return hm;
   }
   
   @Override
   public Imagerie getImagerie(int id_im) {
      Imagerie im = null;
      try{
         String query = "SELECT * FROM imageries where id_imagerie = "+id_im;
         ResultSet rs = jdbc.getSelection(query);
         if(rs.next()){
            im = new Imagerie();
            im.setId_imagerie(rs.getInt("id_imagerie"));
            im.setId_prescription(rs.getInt("id_prescription"));
            im.setFilename(rs.getString("filename"));
            im.setCreated_at(rs.getDate("created_at"));
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getImagerie(): "+e.getCause()+" \n "+e.getMessage());
      }
      return im;
   }
   
   @Override
   public Patient getPatient(int id_pa) {
      Patient p = null;
      try{
         String query = "SELECT * FROM patients where id_patient = "+id_pa;
         ResultSet rs = jdbc.getSelection(query);
         if(rs.next())
         {
            p=new Patient();
            p.setId_patient(rs.getInt("id_patient"));
            p.setId_user(rs.getInt("id_user"));
            p.setNom(rs.getString("nom"));
            p.setPrenom(rs.getString("prenom"));
            p.setAdresse(rs.getString("adresse"));
            p.setCin(rs.getString("cin"));
            p.setDob(rs.getString("dob"));
            p.setFumeur(rs.getBoolean("fumeur"));
            p.setCreated_at(rs.getDate("created_at"));
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getPatient(): "+e.getCause()+" \n "+e.getMessage());
      }
      return p;
   }
   
   @Override
   public Prescription getPrescription(int id_pr) {
      Prescription p = null;
      try{
         String query = "SELECT * FROM prescriptions where id_prescription = "+id_pr;
         ResultSet rs = jdbc.getSelection(query);
         if(rs.next()){
            p = new Prescription();
            p.setId_prescription(rs.getInt("id_prescription"));
            p.setId_patient(rs.getInt("id_patient"));
            p.setDescription(rs.getString("description"));
            p.setDate(rs.getDate("date"));
            p.setCreated_at(rs.getDate("created_at"));
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getPrescription(): "+e.getCause()+" \n "+e.getMessage());
      }
      return p;
   }
   
   @Override
   public ArrayList<Diagnostic> getDiagnosticsOfPatient(int id) {
      ArrayList<Diagnostic> items = new ArrayList<Diagnostic>();
      try{
         String query = "SELECT * FROM diagnostics WHERE id_patient="+id+" ;";
         ResultSet rs = jdbc.getSelection(query);
         while(rs.next()){
            Diagnostic p = new Diagnostic();
            p.setId_diagnostic(rs.getInt("id_diagnostic"));
            p.setId_patient(rs.getInt("id_patient"));
            p.setDescription(rs.getString("description"));
            p.setNombre_seances(rs.getInt("nombre_seances"));
            p.setCreated_at(rs.getDate("created_at"));
            items.add(p);
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getDiagnosticsOfPatient(): "+e.getCause()+" \n "+e.getMessage());
      }
      return items;
   }
   
   @Override
   public ArrayList<Historique_medical> getHistorique_medicalOfPatient(int id) {
      ArrayList<Historique_medical> items = new ArrayList<Historique_medical>();
      try{
         String query = "SELECT * FROM historique_medical WHERE id_patient="+id+" ;";
         ResultSet rs = jdbc.getSelection(query);
         while(rs.next()){
            Historique_medical p = new Historique_medical();
            p.setId_hm(rs.getInt("id_hm"));
            p.setId_patient(rs.getInt("id_patient"));
            p.setDescription(rs.getString("description"));
            p.setDate(rs.getDate("date"));
            p.setCreated_at(rs.getDate("created_at"));
            items.add(p);
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getHistorique_medicalOfPatient(): "+e.getCause()+" \n "+e.getMessage());
      }
      return items;
   }
   
   @Override
   public ArrayList<Imagerie> getImageriesOfPrescription(int id_prescription) {
      ArrayList<Imagerie> items = new ArrayList<Imagerie>();
      try{
         String query = "SELECT * FROM imageries WHERE id_prescription="+id_prescription+" ;";
         ResultSet rs = jdbc.getSelection(query);
         while(rs.next()){
            Imagerie p = new Imagerie();
            p.setId_imagerie(rs.getInt("id_imagerie"));
            p.setId_prescription(rs.getInt("id_prescription"));
            p.setFilename(rs.getString("filename"));
            p.setCreated_at(rs.getDate("created_at"));
            items.add(p);
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getImageriesOfPrescription(): "+e.getCause()+" \n "+e.getMessage());
      }
      return items;
   }
   
   @Override
   public ArrayList<Patient> getPatientsOfUser(int id_user) {
      ArrayList<Patient> items = new ArrayList<Patient>();
      try{
         String query = "SELECT * FROM patients WHERE id_user="+id_user+" ;";
         ResultSet rs = jdbc.getSelection(query);
         while(rs.next()){
            Patient p = new Patient();
            p.setId_patient(rs.getInt("id_patient"));
            p.setId_user(rs.getInt("id_user"));
            p.setNom(rs.getString("nom"));
            p.setPrenom(rs.getString("prenom"));
            p.setAdresse(rs.getString("adresse"));
            p.setCin(rs.getString("cin"));
            p.setDob(rs.getString("dob"));
            p.setFumeur(rs.getBoolean("fumeur"));
            p.setCreated_at(rs.getDate("created_at"));
            items.add(p);
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getPatientsOfUser(): "+e.getCause()+" \n "+e.getMessage());
      }
      return items;
   }
   
   @Override
   public ArrayList<Prescription> getPrescriptionsOfPatient(int id_patient) {
      ArrayList<Prescription> items = new ArrayList<Prescription>();
      try{
         String query = "SELECT * FROM prescriptions WHERE id_patient="+id_patient+" ;";
         ResultSet rs = jdbc.getSelection(query);
         while(rs.next()){
            Prescription p = new Prescription();
            p.setId_prescription(rs.getInt("id_prescription"));
            p.setId_patient(rs.getInt("id_patient"));
            p.setDescription(rs.getString("description"));
            p.setDate(rs.getDate("date"));
            p.setCreated_at(rs.getDate("created_at"));
            items.add(p);
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getPrescriptionsOfPatient(): "+e.getCause()+" \n "+e.getMessage());
      }
      return items;
   }
   
   @Override
   public ResultSet getData(String query) {
      return jdbc.getSelection(query);
   }
   
   @Override
   public void execute(String query) {
      try{
         jdbc.getSelection(query);
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.execute(): "+e.getCause()+" \n "+e.getMessage());
      }
   }
   
   @Override
   public int getNextID(String table_name) {
      String query = null;
      switch(table_name){
         case "diagnostic":
            query = "SELECT id_diagnostic FROM diagnostics order by id_diagnostic desc limit 1";
            break;
         case "historique_medical":
            query = "SELECT id_hm FROM historique_medical order by id_hm desc limit 1";
            break;
         case "imagerie":
            query = "SELECT id_imagerie FROM imageries order by id_imagerie desc limit 1";
            break;
         case "patient":
            query = "SELECT id_patient FROM patients order by id_patient desc limit 1";
            break;
         case "description":
            query = "SELECT id_description FROM descriptions order by id_description desc limit 1";
            break;
         case "user":
            query = "SELECT id_user FROM users order by id_user desc limit 1";
            break;
      }
      query = "SELECT id_patient FROM patients order by id_patient desc limit 1";
      int nextid=1;
      try{
         ResultSet rs = jdbc.getSelection(query);
         if(rs.next())
            nextid = rs.getInt(1)+1;
      }catch(Exception e){
         System.out.println("Erreur: DaoImpl.getNextID(): "+e.getCause()+" \n "+e.getMessage());
      }
      return nextid;
   }
   
}
