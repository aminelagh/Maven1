package controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import models.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import services.Service;
import services.ServiceImpl;

@Controller
public class AgendaController {
   
   ApplicationContext context;
   Service service;
   
   public AgendaController(){
      System.out.println("controllers.AgendaController.<init>()");
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
   
   //Add Agenda ****************************************************************
   @RequestMapping(value="/addAgenda", method = RequestMethod.POST)
   public ModelAndView submitAddAgenda( RedirectAttributes params, HttpServletRequest req){
      
      int id_patient = Integer.parseInt(req.getParameter("id_patient"));
      
      Agenda object = new Agenda();
      object.setId_user(Integer.parseInt(req.getSession().getAttribute("id_user").toString()));
      object.setId_patient(id_patient);
      object.setDescription(req.getParameter("description"));
      object.setEtat("nouveau");
      
      object.setDate_debut(req.getParameter("date_debut"));
      object.setDate_fin(req.getParameter("date_fin"));
      object.setHeure_debut(req.getParameter("heure_debut"));
      object.setHeure_fin(req.getParameter("heure_fin"));
            
      ModelAndView mv = new ModelAndView("redirect:/patient/"+object.getId_patient());
      String errorMessage = "";
      
      try{
         System.out.println("======> "+object.toString());
         service.addAgenda(object);
      }catch(Exception e){
         errorMessage +=
                 "<li>Erreur de création du rendez-vous.</li>"+
                 "<li>Cause: "+e.getCause()+
                 "</li>"+"<li>Message: "+e.getMessage()+"</li>";
         params.addFlashAttribute("alertWarning", errorMessage);
         return mv;
      }
      params.addFlashAttribute("alertSuccess", "Création du rendez-vous.");
      return mv;
   }

}
