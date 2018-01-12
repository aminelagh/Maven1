package models;

import java.util.Date;

public class Prescription {
   
   private int id_prescription, id_patient;
   private String description;
   private Date date, created_at;
   
   //Constructors
   public Prescription() {}
   
   public Prescription(int id_prescription, int id_patient, String description, Date date) {
      this.id_prescription = id_prescription;
      this.id_patient = id_patient;
      this.description = description;
      this.date = date;
   }
   
   public Prescription(String description, Date date, Date created_at) {
      this.description = description;
      this.date = date;
      this.created_at = created_at;
   }

   public Prescription( int id_patient, String description, Date date, Date created_at) {
      this.id_patient = id_patient;
      this.description = description;
      this.date = date;
      this.created_at = created_at;
   }
   
   public Prescription(int id_prescription, int id_patient, String description, Date date, Date created_at) {
      this.id_prescription = id_prescription;
      this.id_patient = id_patient;
      this.description = description;
      this.date = date;
      this.created_at = created_at;
   }
   
   //Getters & Setters
   public int getId_prescription() {
      return id_prescription;
   }

   public void setId_prescription(int id_prescription) {
      this.id_prescription = id_prescription;
   }

   public int getId_patient() {
      return id_patient;
   }

   public void setId_patient(int id_patient) {
      this.id_patient = id_patient;
   }

   public String getDescription() {
      return description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

   public Date getDate() {
      return date;
   }

   public void setDate(Date date) {
      this.date = date;
   }

   public Date getCreated_at() {
      return created_at;
   }

   public void setCreated_at(Date created_at) {
      this.created_at = created_at;
   }

   //toString
   @Override
   public String toString() {
      return "Prescription{" + "id_prescription=" + id_prescription + ", id_patient=" + id_patient + ", description=" + description + ", date=" + date + ", created_at=" + created_at + '}';
   }
}
