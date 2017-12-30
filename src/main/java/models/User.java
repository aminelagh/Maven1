package models;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class User {
   
   private int id_user,id_role;
   private String nom,prenom;
   private String email,password;
  // private Date created_at;
   //private Set<UserRole> userRole = new HashSet<UserRole>(0);
   
   //Constructors
   public User() {
   }

   public int getId_user() {
      return id_user;
   }

   public void setId_user(int id_user) {
      this.id_user = id_user;
   }

   public int getId_role() {
      return id_role;
   }

   public void setId_role(int id_role) {
      this.id_role = id_role;
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

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }


   
   

   
   
   
}