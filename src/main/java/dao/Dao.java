package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import models.*;

public interface Dao {
   
   public void addDiagnostic(Diagnostic object);
   public void addHistorique_medical(Historique_medical object);
   public void addImagerie(Imagerie object);
   public void addPatient(Patient object);
   public void addPrescription(Prescription object);
   public void addUser(User object);
   
   public void updateDiagnostic(Diagnostic object);
   public void updateHistorique_medical(Historique_medical object);
   public void updateImagerie(Imagerie object);
   public void updatePatient(Patient object);
   public void updatePrescription(Prescription object);
   public void updateUser(User object);
   
   public void deleteDiagnostic(int id);
   public void deleteHistorique_medical(int id);
   public void deleteImagerie(int id);
   public void deletePatient(int id);
   public void deletePrescription(int id);
   public void deleteUser(int id);
   
   public Diagnostic getDiagnostic(int id_dig);
   public Historique_medical getHistorique_medical(int id_hm);
   public Imagerie getImagerie(int id_im);
   public Patient getPatient(int id_pa);
   public Prescription getPrescription(int id_pr);
   public User getUser(int id);
   
   public ArrayList<Diagnostic> getDiagnosticsOfPatient(int id_patient);
   public ArrayList<Historique_medical> getHistorique_medicalOfPatient(int id_patient);
   
   public ArrayList<Imagerie> getImageriesOfPrescription(int id_prescription);
   public ArrayList<Imagerie> getImageriesOfPatient(int id_patient);
   
   public ArrayList<Patient> getPatientsOfUser(int id_user);
   public ArrayList<Prescription> getPrescriptionsOfPatient(int id_patient);
      
   public ResultSet getData(String query);
   public void execute(String query);
   
   public int getNextID(String table_name);   
}
