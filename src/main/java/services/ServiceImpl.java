package services;

import dao.DaoImpl;
import java.util.ArrayList;
import models.*;


public class ServiceImpl implements Service{
   
   DaoImpl dao;
   
   public ServiceImpl(DaoImpl dao) {
      this.dao = dao;
   }
   
   @Override
   public boolean addDiagnostic(Diagnostic object) {
      dao.addDiagnostic(object);return true;
   }
   
   @Override
   public boolean addHistorique_medical(Historique_medical object) {
      dao.addHistorique_medical(object);return true;
   }
   
   @Override
   public boolean addImagerie(Imagerie object) {
      dao.addImagerie(object);return true;
   }
   
   @Override
   public boolean addPatient(Patient object) {
      dao.addPatient(object);return true;
   }
   
   @Override
   public boolean addPrescription(Prescription object) {
      dao.addPrescription(object);return true;
   }
   
   @Override
   public boolean addUser(User object) {
      dao.addUser(object);return true;
   }
   
   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   //Update ********************************************************************
   
   @Override
   public boolean updateDiagnostic(Diagnostic object) {
      dao.updateDiagnostic(object);return true;
   }
   
   @Override
   public boolean updateHistorique_medical(Historique_medical object) {
      dao.updateHistorique_medical(object);return true;
   }
   
   @Override
   public boolean updateImagerie(Imagerie object) {
      dao.updateImagerie(object);return true;
   }
   
   @Override
   public boolean updatePatient(Patient object) {
      dao.updatePatient(object);return true;
   }
   
   @Override
   public boolean updatePrescription(Prescription object) {
      dao.updatePrescription(object);return true;
   }
   
   @Override
   public boolean updateUser(User object) {
      dao.updateUser(object);return true;
   }
   
   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   //Delete ********************************************************************
   
   @Override
   public boolean deleteDiagnostic(int id) {
      dao.deleteDiagnostic(id);return true;
   }
   
   @Override
   public boolean deleteHistorique_medical(int id) {
      dao.deleteHistorique_medical(id);return true;
   }
   
   @Override
   public boolean deleteImagerie(int id) {
      dao.deleteImagerie(id);return true;
   }
   
   @Override
   public boolean deletePatient(int id) {
      dao.deletePatient(id);return true;
   }
   
   @Override
   public boolean deletePrescription(int id) {
      dao.deletePrescription(id);return true;
   }
   
   @Override
   public boolean deleteUser(int id) {
      dao.deleteUser(id);return true;
   }
   
   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   //get ***********************************************************************
   
   @Override
   public Diagnostic getDiagnostic(int id) {
      return dao.getDiagnostic(id);
   }
   
   @Override
   public Historique_medical getHistorique_medical(int id) {
      return dao.getHistorique_medical(id);
   }
   
   @Override
   public Imagerie getImagerie(int id) {
      return dao.getImagerie(id);
   }
   
   @Override
   public Patient getPatient(int id) {
      return dao.getPatient(id);
   }
   
   @Override
   public Prescription getPrescription(int id) {
      return dao.getPrescription(id);
   }
   
   @Override
   public User getUser(int id) {
      return dao.getUser(id);
   }
   
   //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
   //Get (s)********************************************************************
   
   @Override
   public ArrayList<Diagnostic> getDiagnostics(int id_patient) {
      return dao.getDiagnosticsOfPatient(id_patient);
   }
   
   @Override
   public ArrayList<Historique_medical> getHistorique_medicals(int id_patient) {
      return dao.getHistorique_medicalOfPatient(id_patient);
   }
   
   @Override
   public ArrayList<Imagerie> getImageries(int id) {
      return dao.getImageriesOfPrescription(id);
   }
   
   @Override
   public ArrayList<Patient> getPatients(int id_user) {
      return dao.getPatientsOfUser(id_user);
   }
   
   @Override
   public ArrayList<Prescription> getPrescriptions(int id_patient) {
      return dao.getPrescriptionsOfPatient(id_patient);
   }
   
   @Override
   public ArrayList<User> getUsers() {
      return new ArrayList<User>();
   }
   
   @Override
   public int getNextID(String table) {
      return dao.getNextID(table);
   }
   
}
