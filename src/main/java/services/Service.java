package services;

import java.util.ArrayList;
import models.*;


public interface Service {
   
   //Agenda --------------------
   public boolean addAgenda(Agenda object);
   public boolean updateAgenda(Agenda object);
   public boolean deleteAgenda(int id);
   public Agenda getAgenda(int id);
   public ArrayList<Agenda> getAgendasOfUser(int id_user);
   public ArrayList<Agenda> getAgendasOfPatient(int id_patient);
   
   //Diagnostic ----------------
   public boolean addDiagnostic(Diagnostic object);
   public boolean updateDiagnostic(Diagnostic object);
   public boolean deleteDiagnostic(int id);
   public Diagnostic getDiagnostic(int id);
   public ArrayList<Diagnostic> getDiagnostics(int id_patient);
   
   //HM ------------------------
   public boolean addHistorique_medical(Historique_medical object);
   public boolean updateHistorique_medical(Historique_medical object);
   public boolean deleteHistorique_medical(int id);
   public Historique_medical getHistorique_medical(int id);
   public ArrayList<Historique_medical> getHistorique_medicals(int id_patient);
   
   //Imagerie ------------------
   public boolean addImagerie(Imagerie object);
   public boolean updateImagerie(Imagerie object);
   public boolean deleteImagerie(int id);
   public Imagerie getImagerie(int id);
   public ArrayList<Imagerie> getImageries(int id);
   public ArrayList<Imagerie> getImageriesOfPatient(int id_patient);
   
   //Memo ----------------------   
   public boolean addMemo(Memo object);
   public boolean updateMemo(Memo object);
   public boolean deleteMemo(int id);
   public Memo getMemo(int id);
   public ArrayList<Memo> getMemosOfUser(int id_user);
   
   //Patient -------------------
   public boolean addPatient(Patient object);
   public boolean updatePatient(Patient object);
   public boolean deletePatient(int id);
   public Patient getPatient(int id);
   public ArrayList<Patient> getPatients(int id_user);
   
   //Prescription --------------
   public boolean addPrescription(Prescription object);
   public boolean updatePrescription(Prescription object);
   public boolean deletePrescription(int id);
   public Prescription getPrescription(int id);
   public ArrayList<Prescription> getPrescriptions(int id_patient);
   
   //User ----------------------
   public boolean addUser(User object);
   public boolean updateUser(User object);
   public boolean deleteUser(int id);
   public User getUser(int id);
   public ArrayList<User> getUsers();
   
   
   public int getNextID(String table);
   
}
