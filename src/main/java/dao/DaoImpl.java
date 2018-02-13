package dao;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import models.*;
import util.JDBCUtil;


public class DaoImpl implements Dao{
   
   JDBCUtil jdbc;
   public DaoImpl(JDBCUtil jDBCUtil){
      this.jdbc = jDBCUtil;
   }
   
   //Agenda ------------------
   @Override
   public void addAgenda(Agenda object) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      String query = "INSERT INTO rdv (id_agenda, id_user, id_patient, description, date_debut, date_fin, etat, created_at) VALUES("
              + ""+object.getId_agenda()+","+ ""+object.getId_user()+","+ ""+object.getId_patient()+","
              + "'"+object.getDescription()+"',"
              + "'"+object.getDate_debut()+" "+object.getHeure_debut()+"',"
              + "'"+object.getDate_fin()+" "+object.getHeure_fin()+"',"
              + "'"+object.getEtat()+"',"
              + "'"+created_at+"');";
      jdbc.execute(query);
   }
   @Override
   public void updateAgenda(Agenda object) {
      String query = "UPDATE rdv SET id_user="+object.getId_user()+", "
              + "id_patient="+object.getId_patient()+", "
              + "description='"+object.getDescription()+"', "
              + "date_debut='"+object.getDate_debut()+" "+object.getHeure_debut()+"', "
              + "date_fin='"+object.getDate_fin()+" "+object.getHeure_fin()+"', "
              + "etat='"+object.getEtat()+"' "
              + "WHERE id_agenda="+object.getId_agenda()+" ; ";
      jdbc.execute(query);}
   @Override
   public void deleteAgenda(int id) {
      String query = "DELETE FROM rdv WHERE id_agenda="+id+" ;";
      jdbc.execute(query);
   }
   @Override
   public Agenda getAgenda(int id) {
      Agenda object = null;
      try{
         String query = "SELECT * FROM rdv where id_agenda = "+id;
         ResultSet rs = jdbc.getSelection(query);
         if(rs.next()){
            object = new Agenda();
            
            String date_d = rs.getString("date_debut");
            String date_debut = date_d.substring(0, 10);
            String heure_debut = date_d.substring(11, 21);
            
            String date_f = rs.getString("date_fin");
            String date_fin = date_f.substring(0, 10);
            String heure_fin = date_f.substring(11, 21);
            
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
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getAgenda(): "+e.getCause()+" \n "+e.getMessage());
      }
      return object;
      
   }
   @Override
   public ArrayList<Agenda> getAgendasOfUser(int id_user) {
      ArrayList<Agenda> items = new ArrayList<Agenda>();
      try{
         String query = "SELECT * FROM rdv WHERE id_user="+id_user+" ;";
         //String query = "Call getWeeks("+id_user+","+nbre_weeks+");";
         ResultSet rs = jdbc.getSelection(query);
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
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getAgendasOfUser(): "+e.getCause()+" \n "+e.getMessage());
      }
      return items;
   }
   
   /*
   public ArrayList<Agenda> getAgendasOfUser(int id_user) {
   ArrayList<Agenda> items = new ArrayList<Agenda>();
   try{
   String query = "SELECT * FROM agenda WHERE id_user="+id_user+" ;";
   //String query = "Call getWeeks("+id_user+","+nbre_weeks+");";
   ResultSet rs = jdbc.getSelection(query);
   while(rs.next()){
   Agenda object = new Agenda();
   object = new Agenda();
   object.setId_user(rs.getInt("id_user"));
   object.setId_agenda(rs.getInt("id_agenda"));
   object.setId_patient(rs.getInt("id_patient"));
   object.setDescription(rs.getString("description"));
   object.setDate_debut(rs.getString("date_debut"));
   object.setDate_fin(rs.getString("date_fin"));
   object.setHeure_debut(rs.getString("heure_debut"));
   object.setHeure_fin(rs.getString("heure_fin"));
   object.setEtat(rs.getString("etat"));
   object.setCreated_at(rs.getDate("created_at"));
   items.add(object);
   }
   }catch(Exception e){
   System.out.println("Erreur DaoImpl.getAgendasOfUser(): "+e.getCause()+" \n "+e.getMessage());
   }
   return items;
   }*/
   @Override
   public ArrayList<Agenda> getAgendasOfPatient(int id_patient) {
      ArrayList<Agenda> items = new ArrayList<Agenda>();
      try{
         String query = "SELECT * FROM agenda WHERE id_patient="+id_patient+" ;";
         ResultSet rs = jdbc.getSelection(query);
         while(rs.next()){
            Agenda object = new Agenda();
            object = new Agenda();
            object.setId_user(rs.getInt("id_user"));
            object.setId_agenda(rs.getInt("id_agenda"));
            object.setId_patient(rs.getInt("id_patient"));
            object.setDescription(rs.getString("description"));
            object.setDate_debut(rs.getString("date_debut"));
            object.setDate_fin(rs.getString("date_fin"));
            object.setHeure_debut(rs.getString("heure_debut"));
            object.setHeure_fin(rs.getString("heure_fin"));
            object.setEtat(rs.getString("etat"));
            object.setCreated_at(rs.getDate("created_at"));
            items.add(object);
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getAgendasOfPatient(): "+e.getCause()+" \n "+e.getMessage());
      }
      return items;
   }
   public ArrayList<Agenda> getAgendasOfUser(int id_user, String last) {
      String query = "SELECT * FROM agenda WHERE id_user="+id_user+" ;";
      switch(last){
         case "day":    query = "SELECT * FROM agenda WHERE id_user="+id_user+" ;";break;
         case "week":   query = "SELECT * FROM agenda WHERE id_user="+id_user+" ;";break;
         case "2weeks": query = "SELECT * FROM agenda WHERE id_user="+id_user+" ;";break;
         case "month":  query = "SELECT * FROM agenda WHERE id_user="+id_user+" ;";break;
         
      }
      ArrayList<Agenda> items = new ArrayList<Agenda>();
      try{
         ResultSet rs = jdbc.getSelection(query);
         while(rs.next()){
            Agenda object = new Agenda();
            object.setId_user(rs.getInt("id_user"));
            object.setId_agenda(rs.getInt("id_agenda"));
            object.setId_patient(rs.getInt("id_patient"));
            object.setDescription(rs.getString("description"));
            object.setDate_debut(rs.getString("date_debut"));
            object.setDate_fin(rs.getString("date_fin"));
            object.setHeure_debut(rs.getString("heure_debut"));
            object.setHeure_fin(rs.getString("heure_fin"));
            object.setEtat(rs.getString("etat"));
            object.setCreated_at(rs.getDate("created_at"));
            items.add(object);
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getAgendasOfPatient(): "+e.getCause()+" \n "+e.getMessage());
      }
      return items;
   }
   /*
   public ArrayList<Rdv> getWeeks(int id_user, int nbre_weeks){
   String query = "Call getWeeks("+id_user+","+nbre_weeks+");";
   ArrayList<Rdv> items = new ArrayList<Rdv>();
   try{
   ResultSet rs = jdbc.getSelection(query);
   while(rs.next()){
   Rdv object = new Rdv();
   object.setId_user(rs.getInt("id_user"));
   object.setId_rdv(rs.getInt("id_rdv"));
   object.setId_patient(rs.getInt("id_patient"));
   object.setDescription(rs.getString("description"));
   object.setDate_debut(rs.getDate("date_debut"));
   object.setDate_fin(rs.getDate("date_fin"));
   object.setEtat(rs.getString("etat"));
   object.setCreated_at(rs.getDate("created_at"));
   items.add(object);
   }
   }catch(Exception e){
   System.out.println("Erreur DaoImpl.getWeeks(): "+e.getCause()+" \n "+e.getMessage());
   }
   return items;
   }*/
   
   //Diagnostic --------------
   @Override
   public void addDiagnostic(Diagnostic dig) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      String query = "INSERT INTO diagnostic (id_diagnostic, id_patient, description, nombre_seances, created_at) VALUES("
              + ""+dig.getId_diagnostic()+","
              + ""+dig.getId_patient()+","
              + "'"+dig.getDescription()+"',"
              + ""+dig.getNombre_seances()+","
              + "'"+created_at+"');";
      jdbc.execute(query);
   }
   @Override
   public void updateDiagnostic(Diagnostic dig) {
      String query = "UPDATE diagnostic SET id_patient="+dig.getId_patient()+", "
              + "description='"+dig.getDescription()+"', "
              + "nombre_seances="+dig.getNombre_seances()+" "
              + "WHERE id_diagnostic="+dig.getId_diagnostic()+" ; ";
      jdbc.execute(query);
   }
   @Override
   public void deleteDiagnostic(int dig) {
      String query = "DELETE FROM diagnostic WHERE id_diagnostic="+dig+" ;";
      jdbc.execute(query);
   }
   @Override
   public Diagnostic getDiagnostic(int id_dig) {
      Diagnostic p = null;
      try{
         String query = "SELECT * FROM diagnostic where id_diagnostic = "+id_dig;
         ResultSet rs = jdbc.getSelection(query);
         if(rs.next()){
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
   public ArrayList<Diagnostic> getDiagnosticsOfPatient(int id) {
      ArrayList<Diagnostic> items = new ArrayList<Diagnostic>();
      try{
         String query = "SELECT * FROM diagnostic WHERE id_patient="+id+" ;";
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
   
   //HM ----------------------
   @Override
   public void addHistorique_medical(Historique_medical hm) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      String date = sdf.format(hm.getDate());
      String query = "INSERT INTO historique_medical (id_hm, id_patient, description, date, created_at) VALUES("
              + ""+hm.getId_hm()+","
              + ""+hm.getId_patient()+","
              + "'"+hm.getDescription()+"',"
              + "'"+date+"',"
              + "'"+created_at+"');";
      jdbc.execute(query);
   }
   @Override
   public void updateHistorique_medical(Historique_medical hm) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String date = sdf.format(hm.getDate());
      String query = "UPDATE historique_medical SET id_patient="+hm.getId_patient()+", "
              + "description='"+hm.getDescription()+"', date='"+date+"' "
              + "WHERE id_hm="+hm.getId_hm()+" ; ";
      jdbc.execute(query);
   }
   @Override
   public void deleteHistorique_medical(int hm) {
      String query = "DELETE FROM historique_medical WHERE id_hm="+hm+" ;";
      jdbc.execute(query);
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
   
   //Imagerie ----------------
   @Override
   public void addImagerie(Imagerie im) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      String query = "INSERT INTO imagerie (id_imagerie, id_prescription, filename, created_at) VALUES("
              + ""+im.getId_imagerie()+","
              + ""+im.getId_prescription()+","
              + "'"+im.getFilename()+"',"
              + "'"+created_at+"');";
      jdbc.execute(query);
   }
   @Override
   public void updateImagerie(Imagerie im) {
      String query = "UPDATE patient SET id_prescription="+im.getId_prescription()+", "
              + "filename='"+im.getFilename()+"'  "
              + "WHERE id_imagerie="+im.getId_imagerie()+" ; ";
      jdbc.execute(query);
   }
   @Override
   public void deleteImagerie(int im) {
      String query = "DELETE FROM imagerie WHERE id_imagerie="+im+" ;";
      jdbc.execute(query);
   }
   @Override
   public Imagerie getImagerie(int id_im) {
      Imagerie im = null;
      try{
         String query = "SELECT * FROM imagerie where id_imagerie = "+id_im;
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
   public ArrayList<Imagerie> getImageriesOfPrescription(int id_prescription) {
      ArrayList<Imagerie> items = new ArrayList<Imagerie>();
      try{
         String query = "SELECT * FROM imagerie WHERE id_prescription="+id_prescription+" ;";
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
   public ArrayList<Imagerie> getImageriesOfPatient(int id_patient) {
      ArrayList<Imagerie> items = new ArrayList<Imagerie>();
      try{
         //String query = "SELECT * FROM imagerie WHERE id_prescription="+id_patient+" ;";
         String query = "SELECT * FROM imagerie WHERE id_prescription IN (SELECT id_prescription FROM prescription WHERE id_patient = "+id_patient+")";
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
   
   //Memo --------------------
   @Override
   public void addMemo(Memo object) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      String query = "INSERT INTO memo (id_memo, id_user, description,etat,created_at) VALUES("
              + ""+object.getId_memo()+","
              + ""+object.getId_user()+","
              + "'"+object.getDescription()+"',"
              + "'"+object.getEtat()+"',"
              + "'"+created_at+"');";
      jdbc.execute(query);
   }
   @Override
   public void updateMemo(Memo object) {
      String query = "UPDATE memo SET id_user="+object.getId_user()+", "
              + "description='"+object.getDescription()+"',  "
              + "etat='"+object.getEtat()+"'  "
              + "WHERE id_memo="+object.getId_memo()+" ; ";
      jdbc.execute(query);
   }
   @Override
   public void deleteMemo(int id) {
      String query = "DELETE FROM memo WHERE id_memo="+id+" ;";
      jdbc.execute(query);
   }
   @Override
   public Memo getMemo(int id) {
      Memo object = null;
      try{
         String query = "SELECT * FROM memo where id_memo = "+id;
         ResultSet rs = jdbc.getSelection(query);
         if(rs.next()){
            object = new Memo();
            object.setId_memo(rs.getInt("id_memo"));
            object.setId_user(rs.getInt("id_user"));
            object.setDescription(rs.getString("description"));
            object.setEtat(rs.getString("etat"));
            object.setCreated_at(rs.getDate("created_at"));
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getMemo(): "+e.getCause()+" \n "+e.getMessage());
      }
      return object;
   }
   @Override
   public ArrayList<Memo> getMemosOfUser(int id_user) {
      ArrayList<Memo> items = new ArrayList<Memo>();
      try{
         String query = "SELECT * FROM memo WHERE id_user="+id_user+" order by created_at desc;";
         ResultSet rs = jdbc.getSelection(query);
         while(rs.next()){
            Memo object = new Memo();
            object.setId_memo(rs.getInt("id_memo"));
            object.setId_user(rs.getInt("id_user"));
            object.setDescription(rs.getString("description"));
            object.setEtat(rs.getString("etat"));
            object.setCreated_at(rs.getDate("created_at"));
            items.add(object);
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getMemosOfUser(): "+e.getCause()+" \n "+e.getMessage());
      }
      return items;
   }
   
   //Patient -----------------
   @Override
   public void addPatient(Patient p) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      int fumeur = p.isFumeur() ? 1 : 0;
      String query = "INSERT INTO patient (id_patient, id_user, nom, prenom, cin, adresse, dob, fumeur, created_at) VALUES("
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
   public void updatePatient(Patient p) {
      int fumeur = p.isFumeur()?1:0;
      String query = "UPDATE patient SET id_user="+p.getId_user()+", "
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
   public void deletePatient(int pa) {
      String query = "DELETE FROM patient WHERE id_patient="+pa+" ;";
      jdbc.execute(query);
   }
   @Override
   public Patient getPatient(int id_pa) {
      Patient p = null;
      try{
         String query = "SELECT * FROM patient where id_patient = "+id_pa;
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
   public ArrayList<Patient> getPatientsOfUser(int id_user) {
      ArrayList<Patient> items = new ArrayList<Patient>();
      try{
         String query = "SELECT * FROM patient WHERE id_user="+id_user+" order by id_patient asc;";
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
   
   //Prescription ------------
   @Override
   public void addPrescription(Prescription pr) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      String date = sdf.format(pr.getDate());
      String query = "INSERT INTO prescription (id_prescription, id_patient, description, date, created_at) VALUES("
              + ""+pr.getId_prescription()+", "
              + ""+pr.getId_patient()+", "
              + "'"+pr.getDescription()+"', "
              + "'"+date+"', "
              + "'"+created_at+"');";
      jdbc.execute(query);
   }
   @Override
   public void updatePrescription(Prescription pr) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String date = sdf.format(pr.getDate());
      String query = "UPDATE prescription SET id_patient="+pr.getId_patient()+", "
              + "description='"+pr.getDescription()+"', "
              + "date='"+date+"' "
              + "WHERE id_prescription="+pr.getId_prescription()+" ; ";
      jdbc.execute(query);
   }
   @Override
   public void deletePrescription(int pr) {
      String query = "DELETE FROM prescription WHERE id_prescription="+pr+" ;";
      jdbc.execute(query);
   }
   @Override
   public Prescription getPrescription(int id_pr) {
      Prescription p = null;
      try{
         String query = "SELECT * FROM prescription where id_prescription = "+id_pr;
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
   public ArrayList<Prescription> getPrescriptionsOfPatient(int id_patient) {
      ArrayList<Prescription> items = new ArrayList<Prescription>();
      try{
         String query = "SELECT * FROM prescription WHERE id_patient="+id_patient+" ;";
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
   
   //User --------------------
   @Override
   public void addUser(User object) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      String query = "INSERT INTO user (id_user, id_role, nom, prenom, email, password, created_at) VALUES("
              + ""+object.getId_user()+", "
              + ""+object.getId_role()+", "
              + "'"+object.getNom()+"', "
              + "'"+object.getPrenom()+"', "
              + "'"+object.getEmail()+"', "
              + "'"+object.getPassword()+"', "
              + "'"+created_at+"');";
      jdbc.execute(query);
   }
   @Override
   public void updateUser(User object) {
      String query = "UPDATE user SET id_role="+object.getId_role()+", "
              + "nom='"+object.getNom()+"', "
              + "prenom='"+object.getPrenom()+"', "
              + "email='"+object.getEmail()+"', "
              + "password='"+object.getPassword()+"' "
              + "WHERE id_user="+object.getId_user()+" ; ";
      jdbc.execute(query);}
   @Override
   public void deleteUser(int id) {
      String query = "DELETE FROM user WHERE id_user="+id+" ;";
      jdbc.execute(query);
   }
   @Override
   public User getUser(int id) {
      User object = null;
      try{
         String query = "SELECT * FROM user where id_user = "+id;
         ResultSet rs = jdbc.getSelection(query);
         if(rs.next()){
            object = new User();
            object.setId_user(rs.getInt("id_user"));
            object.setId_role(rs.getInt("id_role"));
            object.setNom(rs.getString("nom"));
            object.setPrenom(rs.getString("prenom"));
            object.setEmail(rs.getString("email"));
            object.setPassword(rs.getString("password"));
         }
      }catch(Exception e){
         System.out.println("Erreur DaoImpl.getUser(): "+e.getCause()+" \n "+e.getMessage());
      }
      return object;
   }
   
   //***************************************************************************
   
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
            query = "SELECT id_diagnostic FROM diagnostic order by id_diagnostic desc limit 1";
            break;
         case "historique_medical":
            query = "SELECT id_hm FROM historique_medical order by id_hm desc limit 1";
            break;
         case "imagerie":
            query = "SELECT id_imagerie FROM imagerie order by id_imagerie desc limit 1";
            break;
         case "patient":
            query = "SELECT id_patient FROM patient order by id_patient desc limit 1";
            break;
         case "prescription":
            query = "SELECT id_prescription FROM prescription order by id_prescription desc limit 1";
            break;
         case "user":
            query = "SELECT id_user FROM user order by id_user desc limit 1";
            break;
         case "agenda":
            query = "SELECT id_agenda FROM agenda order by id_agenda desc limit 1";
            break;
         case "memo":
            query = "SELECT id_memo FROM memo order by id_memo desc limit 1";
            break;
      }
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
