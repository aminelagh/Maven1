package util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class HibernateUtil {
  
  private SessionFactory sf;
  
  public HibernateUtil(){
    sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
    /*try{
      // Create the SessionFactory from hibernate.cfg.xml
      Configuration configuration = new Configuration();
      configuration.configure("hibernate.cfg.xml");
      System.out.println("Hibernate Configuration loaded");
      
      
      sf = configuration.buildSessionFactory();
      
      //return sessionFactory;
      
    }
    catch(Exception e){e.printStackTrace();}*/
  }
  
  public SessionFactory getSF(){
    /*SessionFactory sessionFactory = null;
    try{
      // Create the SessionFactory from hibernate.cfg.xml
      Configuration configuration = new Configuration();
      configuration.configure("hibernate.cfg.xml");
      System.out.println("Hibernate Configuration loaded");
      
      
      sessionFactory = configuration.buildSessionFactory();
      
      //return sessionFactory;
      
    }
    catch(Exception e){e.printStackTrace();}
    //return sf;*/
    return sf;
  }

  
}
