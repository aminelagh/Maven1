package util;

import java.sql.*;


public class JDBCUtil {
   
   static Connection cn = null;
   static Statement st = null;
   
   public JDBCUtil(String driver,String url,String username,String password)
   {
      try
      {
         Class.forName(driver);
         cn = DriverManager.getConnection(url, username, password);
         st = cn.createStatement();         
        
      }catch(Exception e){
         System.err.println("Error JDBCUtil.JDBCUtil(): "+e.getCause()+" \n "+e.getMessage());
      }
   }
   
   public ResultSet getSelection(String sql)
   {
      ResultSet rs = null;
      try{
         rs = st.executeQuery(sql);
      }catch(Exception e){
         System.err.println("Error JDBCUtil.getSelection():\n\t Cause: "+e.getCause()+"\n\t Message: "+e.getMessage());
      }      
      return rs;
   }
   
   public void execute(String sql)
   {
      try{
         st.execute(sql);
      } catch (Exception e) {        
         System.err.println("Error JDBCUtil.clearAll():\n\t Cause: "+e.getCause()+"\n\t Message: "+e.getMessage());
      }
   }
   
   public void clearAll() {
      try{
         cn.close();
         st.close();
      }catch(Exception e){         
         System.err.println("Error JDBCUtil.clearAll():\n\t Cause: "+e.getCause()+"\n\t Message: "+e.getMessage());
      }
   }
   
   
}
