package services;

import java.util.ArrayList;
import models.User;

public interface UserService {
  
  public boolean addUser(User user);
  public boolean updateUser(User user);
  public boolean deleteUser(int id_user);
  public User getUser(int id_user);
  public ArrayList<User> getUsers();
  
}
