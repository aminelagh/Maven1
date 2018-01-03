package models;

import java.util.Date;


public class Patient {
   
   int id_patient,id_user;
   String nom, prenom, dob,cin, adresse;
   boolean fumeur;
   Date created_at;
   
   //constructeurs
   public Patient() {
   }
   
   public Patient(String nom, String prenom, String dob) {
      this.nom = nom;
      this.prenom = prenom;
      this.dob = dob;
   }
   
   
   public Patient(int id_patient, String nom, String prenom, String dob) {
      this.id_patient = id_patient;
      this.nom = nom;
      this.prenom = prenom;
      this.dob = dob;
   }
   
   public Patient( String nom, String prenom, String dob, String cin, String adresse, boolean fumeur) {
      
      this.nom = nom;
      this.prenom = prenom;
      this.dob = dob;
      this.cin = cin;
      this.adresse = adresse;
      this.fumeur = fumeur;
   }
   public Patient( int id_user, String nom, String prenom, String dob, String cin, String adresse, boolean fumeur) {
      this.id_user = id_user;
      this.nom = nom;
      this.prenom = prenom;
      this.dob = dob;
      this.cin = cin;
      this.adresse = adresse;
      this.fumeur = fumeur;
   }
   
   public Patient(int id_patient, int id_user, String nom, String prenom, String dob, String cin, String adresse, boolean fumeur) {
      this.id_patient = id_patient;
      this.id_user = id_user;
      this.nom = nom;
      this.prenom = prenom;
      this.dob = dob;
      this.cin = cin;
      this.adresse = adresse;
      this.fumeur = fumeur;
   }
   
   public Patient(int id_patient, int id_user, String nom, String prenom, String dob, boolean fumeur) {
      this.id_patient = id_patient;
      this.id_user = id_user;
      this.nom = nom;
      this.prenom = prenom;
      this.dob = dob;
      this.fumeur = fumeur;
   }

   public Patient(int id_patient, int id_user, String nom, String prenom, String dob, String cin, String adresse, boolean fumeur, Date created_at) {
      this.id_patient = id_patient;
      this.id_user = id_user;
      this.nom = nom;
      this.prenom = prenom;
      this.dob = dob;
      this.cin = cin;
      this.adresse = adresse;
      this.fumeur = fumeur;
      this.created_at = created_at;
   }

   
   /*
   public Patient(int id_patient, int id_user, String nom, String prenom, String dob, String cin, String adresse, boolean fumeur, Date created_at) {
      this.id_patient = id_patient;
      this.id_user = id_user;
      this.nom = nom;
      this.prenom = prenom;
      this.dob = dob;
      this.cin = cin;
      this.adresse = adresse;
      this.fumeur = fumeur;
      this.created_at = created_at;
   }*/

   public Date getCreated_at() {
      return created_at;
   }

   public void setCreated_at(Date created_at) {
      this.created_at = created_at;
   }
     
   
   public String getCin() {
      return cin;
   }
   
   public void setCin(String cin) {
      this.cin = cin;
   }
   
   public String getAdresse() {
      return adresse;
   }
   
   //getters & setters
   public void setAdresse(String adresse) {
      this.adresse = adresse;
   }
   
   public int getId_patient() {
      return id_patient;
   }
   
   public void setId_patient(int id_patient) {
      this.id_patient = id_patient;
   }
   
   public int getId_user() {
      return id_user;
   }
   
   public void setId_user(int id_user) {
      this.id_user = id_user;
   }
   
   public String getNom() {
      return nom;
   }
   
   public void setNom(String nom) {
      this.nom = nom;
   }
   
   public String getPrenom() {
      return prenom;
   }
   
   public void setPrenom(String prenom) {
      this.prenom = prenom;
   }
   
   public String getDob() {
      return dob;
   }
   
   public void setDob(String dob) {
      this.dob = dob;
   }
   
   public boolean isFumeur() {
      return fumeur;
   }
   
   public void setFumeur(boolean fumeur) {
      this.fumeur = fumeur;
   }

   @Override
   public String toString() {
      return "Patient{" + "id_patient=" + id_patient + ", id_user=" + id_user + ", nom=" + nom + ", prenom=" + prenom + ", dob=" + dob + ", cin=" + cin + ", adresse=" + adresse + ", fumeur=" + fumeur + ", created_at=" + created_at + '}';
   }


   

}
