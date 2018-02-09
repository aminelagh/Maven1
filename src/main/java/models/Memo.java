package models;

import java.util.Date;

public class Memo {
   
   private int id_memo,id_user;
   private String description, etat;
   private Date created_at;
   
   public Memo(){}
   
   //Getter & Setters:
   public int getId_user() {
      return id_user;
   }

   public void setId_user(int id_user) {
      this.id_user = id_user;
   }   
   
   public int getId_memo() {
      return id_memo;
   }
   
   public void setId_memo(int id_memo) {
      this.id_memo = id_memo;
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

   public Date getCreated_at() {
      return created_at;
   }

   public void setCreated_at(Date created_at) {
      this.created_at = created_at;
   }
   
   //ToString()
   @Override
   public String toString() {
      return "Memo{" + "id_memo=" + id_memo + ", id_user=" + id_user + ", description=" + description + ", etat=" + etat + ", created_at=" + created_at + '}';
   }
      
}
