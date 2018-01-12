package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import models.*;

public interface Dao {
   
   public void addDiagnostic(Diagnostic dig);
   public void addHistorique_medical(Historique_medical hm);
   public void addImagerie(Imagerie im);
   public void addPatient(Patient pa);
   public void addPrescription(Prescription pr);
   
   public void updateDiagnostic(Diagnostic dig);
   public void updateHistorique_medical(Historique_medical hm);
   public void updateImagerie(Imagerie im);
   public void updatePatient(Patient pa);
   public void updatePrescription(Prescription pr);
   
   public void deleteDiagnostic(int dig);
   public void deleteHistorique_medical(int hm);
   public void deleteImagerie(int im);
   public void deletePatient(int pa);
   public void deletePrescription(int pr);
   
   public Diagnostic getDiagnostic(int id_dig);
   public Historique_medical getHistorique_medical(int id_hm);
   public Imagerie getImagerie(int id_im);
   public Patient getPatient(int id_pa);
   public Prescription getPrescription(int id_pr);
   
   public ArrayList<Diagnostic> getDiagnosticsOfPatient(int id_patient);
   public ArrayList<Historique_medical> getHistorique_medicalOfPatient(int id_patient);
   public ArrayList<Imagerie> getImageriesOfPrescription(int id_prescription);
   public ArrayList<Patient> getPatientsOfUser(int id_user);
   public ArrayList<Prescription> getPrescriptionsOfPatient(int id_patient);
      
   public ResultSet getData(String query);
   public void execute(String query);
   
   public int getNextID(String table_name);   
}
