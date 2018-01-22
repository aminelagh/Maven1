package models;

import java.util.Date;


public class Historique_medical {
   
   private int id_hm,id_patient;
   private String description;
   private Date date,created_at;
   
   //Constructor:
   public Historique_medical() {}

   public Historique_medical(String description, Date date) {
      this.description = description;
      this.date = date;
   }   
   
   public Historique_medical(int id_patient, String description, Date date) {
      this.id_patient = id_patient;
      this.description = description;
      this.date = date;
   }
   
   //Getters & Setters:
   public int getId_hm() {
      return id_hm;
   }

   public void setId_hm(int id_hm) {
      this.id_hm = id_hm;
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

   public void setDescription(String desciption) {
      this.description = desciption;
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
      return "Historique_medical{" + "id_hm=" + id_hm + ", id_patient=" + id_patient + ", description=" + description + ", date=" + date + ", created_at=" + created_at + '}';
   }   
}
