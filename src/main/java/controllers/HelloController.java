package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {
  
  /*@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
  public ModelAndView welcomePage() {
    
    ModelAndView model = new ModelAndView();
    model.addObject("title", "Spring Security Hello World");
    model.addObject("message", "This is welcome page!");
    model.setViewName("welcome");
    return model;
  }
  
  @RequestMapping(value = "/user**", method = RequestMethod.GET)
  public ModelAndView userPage() {
    
    ModelAndView model = new ModelAndView();
    model.addObject("title", "User protected page");
    model.addObject("message", "This is protected page!");
    model.setViewName("user-page");
    return model;
  }
  
  @RequestMapping(value = "/admin**", method = RequestMethod.GET)
  public ModelAndView adminPage() {
    
    ModelAndView model = new ModelAndView();
    model.addObject("title", "Admin protected page");
    model.addObject("message", "This is protected page!");
    model.setViewName("admin-page");
    return model;
  }
  
  
  //Spring Security see this :
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public ModelAndView login(
          @RequestParam(value = "error", required = false) String error,
          @RequestParam(value = "logout", required = false) String logout) {
    
    ModelAndView model = new ModelAndView();
    if (error != null) {
      model.addObject("error", "Invalid username and password!");
    }
    
    if (logout != null) {
      model.addObject("msg", "You've been logged out successfully.");
    }
    model.setViewName("login");    
    return model;    
  }*/
}