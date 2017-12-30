package models;


public class Diagnostic {
   
   private int id_diagnostic, id_patient,nombre_seances;
   private String description;
   
   //Constructors
   public Diagnostic() {}
   
   public Diagnostic(int nombre_seances, String description) {
      this.nombre_seances = nombre_seances;
      this.description = description;
   }
   
   public Diagnostic( int id_patient, int nombre_seances, String description) {
      this.id_patient = id_patient;
      this.nombre_seances = nombre_seances;
      this.description = description;
   }
   
   public Diagnostic(int id_diagnostic, int id_patient, int nombre_seances, String description) {
      this.id_diagnostic = id_diagnostic;
      this.id_patient = id_patient;
      this.nombre_seances = nombre_seances;
      this.description = description;
   }
   
   //Getters & Setters
   public int getId_diagnostic() {
      return id_diagnostic;
   }
   
   public void setId_diagnostic(int id_diagnostic) {
      this.id_diagnostic = id_diagnostic;
   }
   
   public int getId_patient() {
      return id_patient;
   }
   
   public void setId_patient(int id_patient) {
      this.id_patient = id_patient;
   }
   
   public int getNombre_seances() {
      return nombre_seances;
   }
   
   public void setNombre_seances(int nombre_seances) {
      this.nombre_seances = nombre_seances;
   }
   
   public String getDescription() {
      return description;
   }
   
   public void setDescription(String description) {
      this.description = description;
   }
   
   @Override
   public String toString() {
      return "Diagnostic{" + "id_diagnostic=" + id_diagnostic + ", id_patient=" + id_patient + ", nombre_seances=" + nombre_seances + ", description=" + description + '}';
   }
   
   
   
   
   
}
