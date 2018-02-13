package models;

import java.util.Date;

public class Rdv {
   private int id_rdv, id_user, id_patient;
   private String description, etat;
   private Date date_debut, date_fin, created_at;
   
   public Rdv(){}

   public int getId_rdv() {
      return id_rdv;
   }

   public void setId_rdv(int id_rdv) {
      this.id_rdv = id_rdv;
   }

   public int getId_user() {
      return id_user;
   }

   public void setId_user(int id_user) {
      this.id_user = id_user;
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

   public String getEtat() {
      return etat;
   }

   public void setEtat(String etat) {
      this.etat = etat;
   }

   public Date getDate_debut() {
      return date_debut;
   }

   public void setDate_debut(Date date_debut) {
      this.date_debut = date_debut;
   }

   public Date getDate_fin() {
      return date_fin;
   }

   public void setDate_fin(Date date_fin) {
      this.date_fin = date_fin;
   }

   public Date getCreated_at() {
      return created_at;
   }

   public void setCreated_at(Date created_at) {
      this.created_at = created_at;
   }

   @Override
   public String toString() {
      return "Rdv{" + "id_rdv=" + id_rdv + ", id_user=" + id_user + ", id_patient=" + id_patient + ", description=" + description + ", etat=" + etat + ", date_debut=" + date_debut + ", date_fin=" + date_fin + ", created_at=" + created_at + '}';
   }
   
   
}
