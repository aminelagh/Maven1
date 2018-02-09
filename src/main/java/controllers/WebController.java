package controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import models.*;
import models.User;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;
import services.Service;
import services.ServiceImpl;

@Controller
public class WebController {
   
   ApplicationContext context;
   Service service;
   
   public WebController(){
      System.out.println("controllers.WebController.<init>()");
      try{
         context = new ClassPathXmlApplicationContext("Beans.xml");
         service = (ServiceImpl)context.getBean("beanService");
      }
      catch(Exception e){
         String errorMessage = "";
         errorMessage = errorMessage + "<li>Erreur de connexion avec la base de données ! veuillez réessayer ultérieurement.</li>";
         errorMessage = errorMessage + "<li>Cause: "+e.getCause()+"</li>";
         errorMessage = errorMessage + "<li>Message: "+e.getMessage()+"</li>";
         System.out.println(errorMessage);
      }
   }
   
   
   @RequestMapping(value={"/home"}, method = RequestMethod.GET)
   public ModelAndView home(ModelMap model, HttpServletRequest request){
      try{
         User u = service.getUser(1);
         request.getSession().setAttribute("id_user", u.getId_user());
         request.getSession().setAttribute("nom", u.getNom());
         request.getSession().setAttribute("prenom", u.getPrenom());
         request.getSession().setAttribute("email", u.getEmail());
      }
      catch(Exception e){}
      ArrayList<Memo> memos = service.getMemosOfUser(1);
      model.addAttribute("pageTitle", "Kiné-App");
      model.addAttribute("memos", memos);
      
      //RDV du jour et de la semaine
      int id_user = Integer.parseInt(request.getSession().getAttribute("id_user").toString());
      ArrayList<Agenda> agendas = service.getAgendasOfUser(id_user);
      ArrayList<Patient> patients = service.getPatients(id_user);
      
      Map<Integer, Patient> mapPatients = new HashMap<Integer, Patient>();
      for (Patient patient : patients) {
         mapPatients.put(patient.getId_patient(), patient);
      }
      
      for(int i=1;i<4;i++)
         System.out.println("patient: "+i+" ==> "+mapPatients.get(i).toString());
      
      model.addAttribute("pageTitle", "Mon agenda");
      model.addAttribute("agendas", agendas);
      model.addAttribute("patients", patients);
      model.addAttribute("mapPatients", mapPatients);
      // /RDV j / smaine
      
      
      
      return new ModelAndView("home");
   }
   
   @RequestMapping(value={"/","/index"}, method = RequestMethod.GET)
   public ModelAndView test1(ModelMap model, HttpServletRequest request){
      
      return new ModelAndView("redirect:/home");
   }
   
   
   
   
   
   
   
   
   
   @RequestMapping(value={"/logout"}, method = RequestMethod.GET)
   public ModelAndView logout(ModelMap model, HttpServletRequest request){
      
      request.getSession().invalidate();
      model.addAttribute("pageTitle", "Kiné-App");
      return new ModelAndView("home");
   }
   
   @RequestMapping(value={"/login"}, method = RequestMethod.GET)
   public ModelAndView login(ModelMap model){
      System.err.println("WebController().login !!!!!!: ");
      return new ModelAndView("login");
   }
   
   @RequestMapping(value={"/login"}, method = RequestMethod.POST)
   public ModelAndView submitLogin(ModelMap model,HttpServletRequest request,HttpSession session){
      
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      String errorMessage = "";
      boolean hasError = false;
      if(username.equals("amine"))
      {
         if(password.equals("123"))
         {
            session.setAttribute("username", username);
            session.setAttribute("role", "admin");
            return new ModelAndView("redirect: /ad");
         }
         else{
            hasError = true;
            errorMessage = "Wrong password!!! Try Again.";
            
         }
      }else{
         hasError = true;
         errorMessage = "Username: "+username+" doesn't exist !!!";
      }
      if(hasError==true)
      {model.addAttribute("hasError",hasError);
      model.addAttribute("errorMessage",errorMessage);}
      return new ModelAndView("login");
   }
   
   
   
   /*@RequestMapping(value="/logout", method = RequestMethod.GET)
   public ModelAndView logout(ModelMap model,HttpSession session){
   if(session.getAttribute("username")==null){
   model.addAttribute("message", "You are not logged-in !! so no need to logout");
   return new ModelAndView("redirect:login");
   }
   else{
   session.invalidate();
   model.addAttribute("message", "You are logged-out !! see u soon");
   return new ModelAndView("index");
   }
   }*/
}
