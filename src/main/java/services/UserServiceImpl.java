package services;

import dao.UserDaoHibernateImpl;
import java.util.ArrayList;
import models.User;


public class UserServiceImpl implements UserService{
  
  UserDaoHibernateImpl userDao;
  
  public UserServiceImpl(UserDaoHibernateImpl userDao){
    this.userDao = userDao;
  }
  
  @Override
  public boolean addUser(User user) {
    userDao.add(user);
    return true;
  }
  
  @Override
  public boolean updateUser(User user) {
    userDao.update(user);return true;
  }
  
  @Override
  public boolean deleteUser(int id_user) {
    userDao.delete(id_user);return true;
  }
  
  @Override
  public User getUser(int id_user) {
    return userDao.get(id_user);
  }
  
  @Override
  public ArrayList<User> getUsers() {
    return userDao.get();
  }
  
  
}
