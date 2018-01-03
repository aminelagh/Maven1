package dao;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import util.JDBCUtil;
import models.Patient;

public class PatientDaoJDBCImpl implements PatientDao{
   
   JDBCUtil jdbc;
   public PatientDaoJDBCImpl(JDBCUtil jDBCUtil){
      this.jdbc = jDBCUtil;
   }
   
   @Override
   public void add(Patient p) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      int fumeur = p.isFumeur() ? 1 : 0;
      if(p.getId_patient()==0)
         p.setId_patient(this.getNextID());
      
      String query = "INSERT INTO patients VALUES("+p.getId_patient()+","+p.getId_user()+",'"+p.getNom()+"','"+p.getPrenom()+"','"+p.getCin()+"','"+p.getAdresse()+"','"+p.getDob()+"',"+fumeur+",'"+created_at+"');";
      jdbc.execute(query);
   }
   
   @Override
   public void delete(int id_patient) {
      String query = "DELETE FROM patients WHERE id_patient="+id_patient+" ;";
      jdbc.execute(query);
   }
   
   @Override
   public Patient get(int id_patient) {
      Patient p = null;
      try{
         String query = "SELECT * FROM patients where id_patient = "+id_patient;
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
         // p = new Patient(rs.getInt("id_patient"), rs.getInt("id_user"), rs.getString("nom"), rs.getString("prenom") , rs.getString("cin"), rs.getString("adresse"), rs.getString("dob"), rs.getBoolean("fumeur"), rs.getDate("created_at"));
         
      }catch(Exception e){
         System.out.println("Erreur: "+e.getCause()+" \n "+e.getMessage());
      }
      return p;
   }
   
   @Override
   public void update(Patient p) {
      int fumeur = p.isFumeur()?1:0;
      String query = "UPDATE patients SET id_user="+p.getId_user()+", nom='"+p.getNom()+"', prenom='"+p.getPrenom()+"', cin='"+p.getCin()+"', adresse='"+p.getAdresse()+"', dob='"+p.getDob()+"', fumeur="+fumeur+" WHERE id_patient="+p.getId_patient()+" ; ";
      jdbc.execute(query);
   }
   
   @Override
   public ArrayList<Patient> get() {
      ArrayList<Patient> patients = new ArrayList<>();
      //return patients;
      try{
         String query = "SELECT * FROM patients ;";
         ResultSet rs = jdbc.getSelection(query);
         while(rs.next()){
            Patient p = new Patient();//rs.getInt("id_patient"), rs.getInt("id_user"), rs.getString("nom"), rs.getString("prenom"),rs.getString("dob"), rs.getString("cin"), rs.getString("adresse"),  rs.getBoolean("fumeur") );//, rs.getDate("created_at"));
            p.setId_patient(rs.getInt("id_patient"));
            p.setId_user(rs.getInt("id_user"));
            p.setNom(rs.getString("nom"));
            p.setPrenom(rs.getString("prenom"));
            p.setAdresse(rs.getString("adresse"));
            p.setCin(rs.getString("cin"));
            p.setDob(rs.getString("dob"));
            p.setFumeur(rs.getBoolean("fumeur"));
            p.setCreated_at(rs.getDate("created_at"));
            patients.add(p);
         }
         
      }catch(Exception e){
         System.out.println("Erreur: "+e.getCause()+" \n "+e.getMessage());
      }
      return patients;
   }
   
   @Override
   public ArrayList<Patient> getMine(int id_user) {
      ArrayList<Patient> patients = new ArrayList<>();//return patients;
      try{
         String query = "SELECT * FROM patients where id_user = "+id_user;
         ResultSet rs = jdbc.getSelection(query);
         while(rs.next()){
            //Patient(int id_patient, int id_user, String nom, String prenom, String dob, String cin, String adresse, boolean fumeur, Date created_at)
            Patient p = new Patient(rs.getInt("id_patient"), rs.getInt("id_user"), rs.getString("nom"), rs.getString("prenom")
                    ,rs.getString("dob"), rs.getString("cin"), rs.getString("adresse"),  rs.getBoolean("fumeur"), rs.getDate("created_at"));
            patients.add(p);
         }
         
      }catch(Exception e){
         System.out.println("Erreur: "+e.getCause()+" \n "+e.getMessage());
      }
      return patients;
   }
   
   @Override
   public void execute(String query) {
      jdbc.equals(query);
   }
   
   @Override
   public int getNextID() {
      int nextid=1;
      try{
         String query = "SELECT id_patient FROM patients order by id_patient desc limit 1";
         ResultSet rs = jdbc.getSelection(query);
         if(rs.next())
            nextid = rs.getInt(1)+1;
      }catch(Exception e){
         System.out.println("Erreur: "+e.getCause()+" \n "+e.getMessage());
      }
      return nextid;
   }
   
}
