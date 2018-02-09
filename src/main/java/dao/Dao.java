package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import models.*;

public interface Dao {
   
   //Agenda -----------------
   public void addAgenda(Agenda object);
   public void updateAgenda(Agenda object);
   public void deleteAgenda(int id);
   public Agenda getAgenda(int id);
   public ArrayList<Agenda> getAgendasOfUser(int id_user);
   public ArrayList<Agenda> getAgendasOfPatient(int id_patient);
   
   //Diagnostic --------------
   public void addDiagnostic(Diagnostic object);
   public void updateDiagnostic(Diagnostic object);
   public void deleteDiagnostic(int id);
   public Diagnostic getDiagnostic(int id_dig);
   public ArrayList<Diagnostic> getDiagnosticsOfPatient(int id_patient);
   
   //HM ----------------------
   public void addHistorique_medical(Historique_medical object);
   public void updateHistorique_medical(Historique_medical object);
   public void deleteHistorique_medical(int id);
   public Historique_medical getHistorique_medical(int id_hm);
   public ArrayList<Historique_medical> getHistorique_medicalOfPatient(int id_patient);
   
   //Imagerie ----------------
   public void addImagerie(Imagerie object);
   public void updateImagerie(Imagerie object);
   public void deleteImagerie(int id);
   public Imagerie getImagerie(int id_im);   
   public ArrayList<Imagerie> getImageriesOfPrescription(int id_prescription);
   public ArrayList<Imagerie> getImageriesOfPatient(int id_patient);
   
   //Memo --------------------
   public void addMemo(Memo object);
   public void updateMemo(Memo object);
   public void deleteMemo(int id);
   public Memo getMemo(int id);
   public ArrayList<Memo> getMemosOfUser(int id_user);
   
   //Patient -----------------
   public void addPatient(Patient object);
   public void updatePatient(Patient object);
   public void deletePatient(int id);
   public Patient getPatient(int id_pa);
   public ArrayList<Patient> getPatientsOfUser(int id_user);
   
   //Prescription ------------
   public void addPrescription(Prescription object);
   public void updatePrescription(Prescription object);
   public void deletePrescription(int id);
   public Prescription getPrescription(int id_pr);
   public ArrayList<Prescription> getPrescriptionsOfPatient(int id_patient);
   
   //User --------------------
   public void addUser(User object);
   public void updateUser(User object);
   public void deleteUser(int id);
   public User getUser(int id);
   
   
   
   
   
   public ResultSet getData(String query);
   public void execute(String query);
   
   public int getNextID(String table_name);
   
}
