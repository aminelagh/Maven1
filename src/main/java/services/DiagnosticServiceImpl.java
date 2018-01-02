
package services;

import dao.DiagnosticDaoJDBCImpl;
import java.util.ArrayList;
import models.Diagnostic;


public class DiagnosticServiceImpl implements DiagnosticService{
   
   DiagnosticDaoJDBCImpl diagnosticDao;
   
   public DiagnosticServiceImpl(DiagnosticDaoJDBCImpl diagnosticDaoJDBCImpl) {
      this.diagnosticDao = diagnosticDaoJDBCImpl;
   }
   @Override
   public boolean add(Diagnostic p) {
      diagnosticDao.add(p);return true;
   }
   
   @Override
   public boolean update(Diagnostic p) {
      diagnosticDao.update(p);return true;
   }
   
   @Override
   public boolean delete(int id) {
      diagnosticDao.delete(id);return true;
   }
   
   @Override
   public Diagnostic get(int id) {
      return diagnosticDao.get(id);
   }
   
   @Override
   public ArrayList<Diagnostic> get() {
      return diagnosticDao.get();
   }
   
   @Override
   public ArrayList<Diagnostic> getMine(int id) {
      return diagnosticDao.getMine(id);
   }
   
}
