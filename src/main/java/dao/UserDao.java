package dao;

import java.util.ArrayList;
import models.User;

public interface UserDao {
  
  public void add(User user);
  public void update(User user);  
  public void delete(int id_user);
  public User get(int id_user);
  public ArrayList<User> get();
  
  
  
}
