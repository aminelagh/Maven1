package models;

public class Utilisateur {
  
  private int id_user;
  private String nom,prenom,email,password;
  
  public Utilisateur() {
  }
  
  public Utilisateur(String email, String password) {
    this.email = email;
    this.password = password;
  }
  
  public Utilisateur(String nom, String prenom, String email, String password) {
    this.nom = nom;
    this.prenom = prenom;
    this.email = email;
    this.password = password;
  }
  public Utilisateur(int id_user, String nom, String prenom, String email, String password) {
    this.id_user = id_user;
    this.nom = nom;
    this.prenom = prenom;
    this.email = email;
    this.password = password;
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
