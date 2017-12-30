package services;

import java.util.ArrayList;
import models.Patient;

public interface PatientService {
  
  public boolean add(Patient p);
  public boolean update(Patient p);
  public boolean delete(int id);
  public Patient get(int id);
  public ArrayList<Patient> get();
  public ArrayList<Patient> getMine(int id_user);
  
}
