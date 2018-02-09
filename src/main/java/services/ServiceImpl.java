package services;

import dao.DaoImpl;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import models.*;


public class ServiceImpl implements Service{
   
   DaoImpl dao;
   
   public ServiceImpl(DaoImpl dao) {
      this.dao = dao;
   }
   
   //Agenda --------------------------
   @Override
   public boolean addAgenda(Agenda object) {
      dao.addAgenda(object);return true;
   }
   @Override
   public boolean updateAgenda(Agenda object) {
      dao.updateAgenda(object);return true;
   }
   @Override
   public boolean deleteAgenda(int id) {
      dao.deleteAgenda(id);return true;
   }
   @Override
   public Agenda getAgenda(int id) {
      return dao.getAgenda(id);
   }
   @Override
   public ArrayList<Agenda> getAgendasOfUser(int id_user) {
      return dao.getAgendasOfUser(id_user);
   }
   @Override
   public ArrayList<Agenda> getAgendasOfPatient(int id_patient) {
      return dao.getAgendasOfPatient(id_patient);
   }
   
   //Diagnostic ----------------------
   @Override
   public boolean addDiagnostic(Diagnostic object) {
      dao.addDiagnostic(object);return true;
   }
   @Override
   public boolean updateDiagnostic(Diagnostic object) {
      dao.updateDiagnostic(object);return true;
   }
   @Override
   public boolean deleteDiagnostic(int id) {
      dao.deleteDiagnostic(id);return true;
   }
   @Override
   public Diagnostic getDiagnostic(int id) {
      return dao.getDiagnostic(id);
   }
   @Override
   public ArrayList<Diagnostic> getDiagnostics(int id_patient) {
      return dao.getDiagnosticsOfPatient(id_patient);
   }
   
   //HM ------------------------------
   @Override
   public boolean addHistorique_medical(Historique_medical object) {
      dao.addHistorique_medical(object);return true;
   }
   @Override
   public boolean updateHistorique_medical(Historique_medical object) {
      dao.updateHistorique_medical(object);return true;
   }
   @Override
   public boolean deleteHistorique_medical(int id) {
      dao.deleteHistorique_medical(id);return true;
   }
   @Override
   public Historique_medical getHistorique_medical(int id) {
      return dao.getHistorique_medical(id);
   }
   @Override
   public ArrayList<Historique_medical> getHistorique_medicals(int id_patient) {
      return dao.getHistorique_medicalOfPatient(id_patient);
   }
   
   //Imagerie ------------------------
   @Override
   public boolean addImagerie(Imagerie object) {
      dao.addImagerie(object);return true;
   }
   @Override
   public boolean updateImagerie(Imagerie object) {
      dao.updateImagerie(object);return true;
   }
   @Override
   public boolean deleteImagerie(int id) {
      dao.deleteImagerie(id);return true;
   }
   @Override
   public Imagerie getImagerie(int id) {
      return dao.getImagerie(id);
   }
   @Override
   public ArrayList<Imagerie> getImageries(int id) {
      return dao.getImageriesOfPrescription(id);
   }
   @Override
   public ArrayList<Imagerie> getImageriesOfPatient(int id_patient) {
      return dao.getImageriesOfPatient(id_patient);
   }
   
   //Memo ----------------------------
   @Override
   public boolean addMemo(Memo object) {
      dao.addMemo(object);return true;
   }
   @Override
   public boolean updateMemo(Memo object) {
      dao.updateMemo(object);return true;
   }
   @Override
   public boolean deleteMemo(int id) {
      dao.deleteMemo(id);return true;
   }
   @Override
   public Memo getMemo(int id) {
      return dao.getMemo(id);
   }
   @Override
   public ArrayList<Memo> getMemosOfUser(int id_user) {
      return dao.getMemosOfUser(id_user);
   }
   
   public ArrayList<Memo> getMemos(int id_user) throws SQLException {
      ArrayList<Memo> items = new ArrayList<>();
      ResultSet rs = dao.getData("SELECT * FROM memo where id_user="+id_user+" order by created_at desc ;");
      while(rs.next()){
         Memo object = new Memo();
         object.setId_memo(rs.getInt("id_memo"));
         object.setId_user(rs.getInt("id_user"));
         object.setDescription(rs.getString("description"));
         object.setCreated_at(rs.getDate("creadted_at"));
         items.add(object);
      }
      return items;
   }
   
   
   //Patient -------------------------
   @Override
   public boolean addPatient(Patient object) {
      dao.addPatient(object);return true;
   }
   @Override
   public boolean updatePatient(Patient object) {
      dao.updatePatient(object);return true;
   }
   @Override
   public boolean deletePatient(int id) {
      dao.deletePatient(id);return true;
   }
   @Override
   public Patient getPatient(int id) {
      return dao.getPatient(id);
   }
   @Override
   public ArrayList<Patient> getPatients(int id_user) {
      return dao.getPatientsOfUser(id_user);
   }
   
   //Prescription --------------------
   @Override
   public boolean addPrescription(Prescription object) {
      dao.addPrescription(object);return true;
   }
   @Override
   public boolean updatePrescription(Prescription object) {
      dao.updatePrescription(object);return true;
   }
   @Override
   public boolean deletePrescription(int id) {
      dao.deletePrescription(id);return true;
   }
   @Override
   public Prescription getPrescription(int id) {
      return dao.getPrescription(id);
   }
   @Override
   public ArrayList<Prescription> getPrescriptions(int id_patient) {
      return dao.getPrescriptionsOfPatient(id_patient);
   }
   
   //User ----------------------------
   @Override
   public boolean addUser(User object) {
      dao.addUser(object);return true;
   }
   @Override
   public boolean updateUser(User object) {
      dao.updateUser(object);return true;
   }
   @Override
   public boolean deleteUser(int id) {
      dao.deleteUser(id);return true;
   }
   @Override
   public User getUser(int id) {
      return dao.getUser(id);
   }
   @Override
   public ArrayList<User> getUsers() {
      return new ArrayList<User>();
   }
   
   //----------------------------------
   @Override
   public int getNextID(String table) {
      return dao.getNextID(table);
   }
   
}
