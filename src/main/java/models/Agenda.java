package models;

import java.util.Date;

public class Agenda {
   
   private int id_agenda, id_user, id_patient;
   private String description;
   private String date_debut,heure_debut;
   private String date_fin,heure_fin;
   private String etat;
   private Date created_at;
   
   public Agenda(){}
   
   //getters & Setters:
   public int getId_user() {
      return id_user;
   }

   public void setId_user(int id_user) {
      this.id_user = id_user;
   }   
   
   public int getId_agenda() {
      return id_agenda;
   }

   public void setId_agenda(int id_agenda) {
      this.id_agenda = id_agenda;
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

   public String getDate_debut() {
      return date_debut;
   }

   public void setDate_debut(String date_debut) {
      this.date_debut = date_debut;
   }

   public String getHeure_debut() {
      return heure_debut;
   }

   public void setHeure_debut(String heure_debut) {
      this.heure_debut = heure_debut;
   }

   public String getDate_fin() {
      return date_fin;
   }

   public void setDate_fin(String date_fin) {
      this.date_fin = date_fin;
   }

   public String getHeure_fin() {
      return heure_fin;
   }

   public void setHeure_fin(String heure_fin) {
      this.heure_fin = heure_fin;
   }

   public String getEtat() {
      return etat;
   }

   public void setEtat(String etat) {
      this.etat = etat;
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
      return "Agenda{" + "id_agenda=" + id_agenda + ", id_user=" + id_user + ", id_patient=" + id_patient + ", description=" + description + ", date_debut=" + date_debut + ", heure_debut=" + heure_debut + ", date_fin=" + date_fin + ", heure_fin=" + heure_fin + ", etat=" + etat + ", created_at=" + created_at + '}';
   }
}
