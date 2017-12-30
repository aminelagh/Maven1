package dao;

import java.util.ArrayList;
import java.util.List;
import util.HibernateUtil;
import models.Patient;
import org.hibernate.Session;
import org.hibernate.Query;
import org.hibernate.Transaction;


public class PatientDaoHibernateImpl implements PatientDao{
  
  HibernateUtil hibernateUtil;
  public PatientDaoHibernateImpl(HibernateUtil hibernateUtil){
    this.hibernateUtil = hibernateUtil;
  }
  
  @Override
  public void add(Patient patient) {
    Session session = hibernateUtil.getSF().openSession();
    Transaction tr = session.beginTransaction();
    session.save(patient);
    session.getTransaction().commit();
    session.flush();
    session.close();}
  
  @Override
  public void delete(int id_patient) {
    Session session = hibernateUtil.getSF().openSession();
    Transaction tr = session.beginTransaction();
    Patient u = (Patient)session.load(Patient.class, new Integer(id_patient));
    session.delete(u);
    session.getTransaction().commit();
    session.flush();
    session.close();
  }
  
  @Override
  public Patient get(int id_patient) {
    Session session = hibernateUtil.getSF().openSession();
    Transaction tr = session.beginTransaction();
    Query q = session.createQuery("from Patient where id = :id");
    q.setInteger("id",id_patient);
    Patient patient = (Patient) q.uniqueResult();
    session.flush();
    session.close();
    return patient;
  }
  
  @Override
  public void update(Patient p) {
    Session session = hibernateUtil.getSF().openSession();
    Transaction tr = session.beginTransaction();
    session.update(p);
    session.getTransaction().commit();
    session.flush();
    session.close();
  }
  
  @Override
  public ArrayList<Patient> get() {
    List<Patient> list = new ArrayList<Patient>();
    Session session = hibernateUtil.getSF().openSession();
    Transaction tr = session.beginTransaction();
    list = session.createQuery("from Patient").list();
    session.flush();
    session.close();
    return (ArrayList<Patient>) list;
  }
  
  @Override
  public ArrayList<Patient> getMine(int id_user) {
    List<Patient> list = new ArrayList<Patient>();
    Session session = hibernateUtil.getSF().openSession();
    Transaction tr = session.beginTransaction();
    Query query = session.createQuery("from Patient where id_user =: id_user");
    query.setInteger("id_user", id_user);
    list = query.list();
    session.flush();
    session.close();
    return (ArrayList<Patient>) list;
  }
  
}
