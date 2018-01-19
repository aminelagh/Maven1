package dao;

import java.util.ArrayList;
import java.util.List;
import models.Diagnostic;
import util.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Transaction;


public class DiagnosticDaoHibernateImpl implements DiagnosticDao{

   HibernateUtil hibernateUtil;
   public DiagnosticDaoHibernateImpl(HibernateUtil hibernateUtil){
      this.hibernateUtil = hibernateUtil;
   }

   @Override
   public void add(Diagnostic d) {
      Session session = hibernateUtil.getSF().openSession();
      Transaction tr = session.beginTransaction();
      session.save(d);
      session.getTransaction().commit();
      session.flush();
      session.clear();
      session.close();}

   @Override
   public void delete(int id) {
      Session session = hibernateUtil.getSF().openSession();
      Transaction tr = session.beginTransaction();
      Diagnostic u = (Diagnostic)session.load(Diagnostic.class, new Integer(id));
      session.delete(u);
      session.getTransaction().commit();
      session.flush();
      session.clear();
      session.close();
   }

   @Override
   public Diagnostic get(int id) {
      Session session = hibernateUtil.getSF().openSession();
      Transaction tr = session.beginTransaction();
      Query q = session.createQuery("from Diagnostic where id = :id");
      q.setInteger("id",id);
      Diagnostic d = (Diagnostic) q.uniqueResult();
      session.flush();
      session.clear();
      session.close();
      return d;
   }

   @Override
   public void update(Diagnostic d) {
      Session session = hibernateUtil.getSF().openSession();
      Transaction tr = session.beginTransaction();
      session.update(d);
      session.getTransaction().commit();
      session.flush();
      session.clear();
      session.close();
   }

   @Override
   public ArrayList<Diagnostic> get() {
      List<Diagnostic> list = new ArrayList<Diagnostic>();
      Session session = hibernateUtil.getSF().openSession();
      Transaction tr = session.beginTransaction();
      list = session.createQuery("from Diagnostic").list();
      session.flush();
      session.clear();
      session.close();
      return (ArrayList<Diagnostic>) list;
   }

   @Override
   public ArrayList<Diagnostic> getMine(int id) {
      List<Diagnostic> list = new ArrayList<Diagnostic>();
      Session session = hibernateUtil.getSF().openSession();
      Transaction tr = session.beginTransaction();
      Query query = session.createQuery("from Diagnostic where id_patient =: id_patient");
      query.setInteger("id_patient", id);
      list = query.list();
      session.flush();
      session.clear();
      session.close();
      return (ArrayList<Diagnostic>) list;
   }

   @Override
   public void execute(String query) {
      Session session = hibernateUtil.getSF().openSession();
      SQLQuery q = session.createSQLQuery(query);
      q.executeUpdate();
      session.getTransaction().commit();
      session.flush();
      session.clear();
      session.close();
   }

   @Override
   public int getNextID() {
      List<Diagnostic> list = new ArrayList<Diagnostic>();
      Session session = hibernateUtil.getSF().openSession();
      Transaction tr = session.beginTransaction();
      Query q = session.createQuery("from Diagnostic");
      list = q.list();
      session.flush();
      session.clear();
      session.close();
      int last_id = list.get((list.size()-1)).getId_diagnostic();
      return (last_id+1);
   }


}
