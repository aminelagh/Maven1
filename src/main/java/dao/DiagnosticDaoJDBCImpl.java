package dao;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import util.JDBCUtil;
import models.Diagnostic;

public class DiagnosticDaoJDBCImpl implements DiagnosticDao{
   
   JDBCUtil jdbc;
   public DiagnosticDaoJDBCImpl(JDBCUtil jDBCUtil){
      this.jdbc = jDBCUtil;
   }
   
   @Override
   public void add(Diagnostic p) {
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
      String created_at = sdf.format(new Date());
      String query = "INSERT INTO diagnostics VALUES(NULL,"+p.getId_patient()+",'"+p.getDescription()+"','"+p.getNombre_seances()+"','"+created_at+"');";
      jdbc.execute(query);
   }
   
   @Override
   public void delete(int id) {
      String query = "DELETE FROM diagnostics WHERE id_diagnostic="+id+" ;";
      jdbc.execute(query);
   }
   
   @Override
   public Diagnostic get(int id) {
      Diagnostic d = null;
      try{
         String query = "SELECT * FROM diagnostics where id_diagnostic = "+id;
         ResultSet rs = jdbc.getSelection(query);
         if(rs.next())
            d = new Diagnostic(rs.getInt("id_diagnostic"), rs.getInt("id_patient"), rs.getString("description"), rs.getInt("nombre_seances"),rs.getDate("created_at") );
      }catch(Exception e){
         System.out.println("Erreur: "+e.getCause()+" \n "+e.getMessage());
      }
      return d;
   }
   
   @Override
   public void update(Diagnostic p) {
      String query = "UPDATE diagnostics SET id_patient="+p.getId_patient()+", description='"+p.getDescription()+"', nombre_seances="+p.getNombre_seances()+" WHERE id_diagnostic="+p.getId_diagnostic()+" ; ";
      jdbc.execute(query);
   }
   
   @Override
   public ArrayList<Diagnostic> get() {
      ArrayList<Diagnostic> diags = new ArrayList<>();
      try{
         String query = "SELECT * FROM diagnostics;";
         ResultSet rs = jdbc.getSelection(query);
         while(rs.next()){
            Diagnostic d = new Diagnostic(rs.getInt("id_diagnostic"), rs.getInt("id_patient"), rs.getString("description"), rs.getInt("nombre_seances"),rs.getDate("created_at") );
            diags.add(d);
         }
         
      }catch(Exception e){
         System.out.println("Erreur: "+e.getCause()+" \n "+e.getMessage());
      }
      return diags;
   }
   
   @Override
   public ArrayList<Diagnostic> getMine(int id_patient) {
      ArrayList<Diagnostic> diags = new ArrayList<>();
      try{
         String query = "SELECT * FROM diagnostics WHERE id_patient="+id_patient+" ; ";
         ResultSet rs = jdbc.getSelection(query);
         while(rs.next()){
            Diagnostic d = new Diagnostic(rs.getInt("id_diagnostic"), rs.getInt("id_patient"), rs.getString("description"), rs.getInt("nombre_seances"),rs.getDate("created_at") );
            diags.add(d);
         }
         
      }catch(Exception e){
         System.out.println("Erreur: "+e.getCause()+" \n "+e.getMessage());
      }
      return diags;
   }
   
   @Override
   public void execute(String query) {
      jdbc.execute(query);
   }
   
   @Override
   public int getNextID() {
      int nextid=1;
      try{
         String query = "SELECT id_diagnostic FROM diagnostics order by id_diagnostic desc limit 1";
         ResultSet rs = jdbc.getSelection(query);
         if(rs.next())
            nextid = rs.getInt(1)+1;
      }catch(Exception e){
         System.out.println("Erreur: "+e.getCause()+" \n "+e.getMessage());
      }
      return nextid;
   }   
   
}