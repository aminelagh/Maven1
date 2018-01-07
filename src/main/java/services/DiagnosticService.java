package services;

import java.util.ArrayList;
import models.Diagnostic;

public interface DiagnosticService {
  
  public boolean add(Diagnostic p);
  public boolean update(Diagnostic p);
  public boolean delete(int id);
  public Diagnostic get(int id);
  public ArrayList<Diagnostic> get();
  public ArrayList<Diagnostic> getMine(int id_patient);
  public ArrayList<Diagnostic> getDiagsOfPatient(int id);
  
}
