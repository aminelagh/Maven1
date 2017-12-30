package dao;

import java.util.ArrayList;
import java.util.List;
import util.HibernateUtil;
import models.User;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class UserDaoHibernateImpl implements UserDao{
  
  HibernateUtil hibernateUtil;
  public UserDaoHibernateImpl(HibernateUtil hibernateUtil){
    this.hibernateUtil = hibernateUtil;
  }
  
  @Override
  public void add(User user) {
    Session session = hibernateUtil.getSF().openSession();
    Transaction tr = session.beginTransaction();
    session.save(user);
    session.getTransaction().commit();
    session.flush();
    session.close();}
  
  @Override
  public void delete(int id_user) {
    Session session = hibernateUtil.getSF().openSession();
    Transaction tr = session.beginTransaction();
    User u = (User)session.load(User.class, new Integer(id_user));
    session.delete(u);
    session.getTransaction().commit();
    session.flush();
    session.close();
  }
  
  @Override
  public User get(int id_user) {
    Session session = hibernateUtil.getSF().openSession();
    Transaction tr = session.beginTransaction();
    org.hibernate.Query q = session.createQuery("from User where id = :id");
    q.setInteger("id",id_user);
    User u = (User) q.uniqueResult();
    session.flush();
    session.close();
    return u;
  }
  
  @Override
  public void update(User user) {
    Session session = hibernateUtil.getSF().openSession();
    Transaction tr = session.beginTransaction();
    session.update(user);
    session.getTransaction().commit();
    session.flush();
    session.close();
  }
  
  @Override
  public ArrayList<User> get() {
    List<User> list = new ArrayList<User>();
    Session session = hibernateUtil.getSF().openSession();
    Transaction tr = session.beginTransaction();
    list = session.createQuery("from User").list();
    session.flush();
    session.close();
    return (ArrayList<User>) list;
  }

  
}
