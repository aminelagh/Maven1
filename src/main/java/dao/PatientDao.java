package dao;

import java.util.ArrayList;
import models.Patient;

public interface PatientDao {
   public void add(Patient patient);
   public void update(Patient user);
   public void delete(int id_patient);
   public Patient get(int id_user);
   public ArrayList<Patient> get();
   public ArrayList<Patient> getMine(int id_user);
   
   public void execute(String query);
   public int getNextID();
   //public ArrayList<Object> get(String query);
   
}
