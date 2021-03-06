
package services;

import dao.PatientDaoHibernateImpl;
import dao.UserDaoHibernateImpl;
import java.util.ArrayList;
import models.Patient;


public class PatientServiceImpl implements PatientService{
  
  PatientDaoHibernateImpl patientDao;
  
  public PatientServiceImpl(PatientDaoHibernateImpl patientDaoHibernateImpl) {
    this.patientDao=patientDaoHibernateImpl;
  }
  @Override
  public boolean add(Patient p) {
    patientDao.add(p);return true;
  }
  
  @Override
  public boolean update(Patient p) {
    patientDao.update(p);return true;
  }
  
  @Override
  public boolean delete(int id) {
    patientDao.delete(id);return true;
  }
  
  @Override
  public Patient get(int id) {
    return patientDao.get(id);
  }
  
  @Override
  public ArrayList<Patient> get() {
    return patientDao.get();
  }
  
  @Override
  public ArrayList<Patient> getMine(int id_user) {
    return patientDao.getMine(id_user);
  }
  
}
