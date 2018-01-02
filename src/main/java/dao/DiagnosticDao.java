package dao;

import java.util.ArrayList;
import models.Diagnostic;

public interface DiagnosticDao {
   
   public void add(Diagnostic d);
   public void update(Diagnostic d);
   public void delete(int id);
   public Diagnostic get(int id);
   public ArrayList<Diagnostic> get();
   public ArrayList<Diagnostic> getMine(int id);
   
   public void execute(String query);
   public int getNextID();
   //public ArrayList<Object> get(String query);
   
}
