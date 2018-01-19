package services;

import java.util.ArrayList;
import models.*;


public interface Service {
   
   public boolean addDiagnostic(Diagnostic object);
   public boolean addHistorique_medical(Historique_medical object);
   public boolean addImagerie(Imagerie object);
   public boolean addPatient(Patient object);
   public boolean addPrescription(Prescription object);
   public boolean addUser(User object);
   
   
   public boolean updateDiagnostic(Diagnostic object);
   public boolean updateHistorique_medical(Historique_medical object);
   public boolean updateImagerie(Imagerie object);
   public boolean updatePatient(Patient object);
   public boolean updatePrescription(Prescription object);
   public boolean updateUser(User object);
   
   
   public boolean deleteDiagnostic(int id);
   public boolean deleteHistorique_medical(int id);
   public boolean deleteImagerie(int id);
   public boolean deletePatient(int id);
   public boolean deletePrescription(int id);
   public boolean deleteUser(int id);
   
   
   public Diagnostic getDiagnostic(int id);
   public Historique_medical getHistorique_medical(int id);
   public Imagerie getImagerie(int id);
   public Patient getPatient(int id);
   public Prescription getPrescription(int id);
   public User getUser(int id);
   
   
   public ArrayList<Diagnostic> getDiagnostics(int id_patient);
   public ArrayList<Historique_medical> getHistorique_medicals(int id_patient);
   public ArrayList<Imagerie> getImageries(int id);
   public ArrayList<Patient> getPatients(int id_user);
   public ArrayList<Prescription> getPrescriptions(int id_patient);
   public ArrayList<User> getUsers();
   
   public int getNextID(String table);
}
