package models;

import java.util.Date;

public class Imagerie {
   
   private int id_imagerie,id_prescription;
   private String filename;
   private Date created_at;

   public Imagerie() {}
   
   //Getters & Setters
   public int getId_imagerie() {
      return id_imagerie;
   }

   public void setId_imagerie(int id_imagerie) {
      this.id_imagerie = id_imagerie;
   }

   public int getId_prescription() {
      return id_prescription;
   }

   public void setId_prescription(int id_prescription) {
      this.id_prescription = id_prescription;
   }

   public String getFilename() {
      return filename;
   }

   public void setFilename(String filename) {
      this.filename = filename;
   }

   public Date getCreated_at() {
      return created_at;
   }

   public void setCreated_at(Date created_at) {
      this.created_at = created_at;
   }

   @Override
   public String toString() {
      return "Imagerie{" + "id_imagerie=" + id_imagerie + ", id_prescription=" + id_prescription + ", filename=" + filename + ", created_at=" + created_at + '}';
   }   
}
