package controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import models.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
   
   //Mes rdv *******************************************************************
   @RequestMapping(value={"/agenda"}, method = RequestMethod.GET)
   public ModelAndView mesRDV(ModelMap model, HttpServletRequest req){
      int id_user = Integer.parseInt(req.getSession().getAttribute("id_user").toString());
      ArrayList<Agenda> agendas = service.getAgendasOfUser(id_user);
      ArrayList<Patient> patients = service.getPatients(id_user);
      
      model.addAttribute("pageTitle", "Mon agenda");
      model.addAttribute("agendas", agendas);
      model.addAttribute("patients", patients);
      return new ModelAndView("user_agenda");
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
      
      String errorMessage = "";
      
      ModelAndView mv;
      if(!req.getParameter("form").isEmpty() && req.getParameter("form").toString().equals("agenda"))
         mv = new ModelAndView("redirect:/agenda" );
      else
         mv = new ModelAndView("redirect:/patient/"+id_patient );
      
      
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
   
   //Submit Update Agenda ******************************************************
   @RequestMapping(value={"/updateAgenda/{id_patient}"}, method = RequestMethod.POST)
   public ModelAndView submitUpdateHMg(@ModelAttribute("id_patient") int id_patient, RedirectAttributes params, HttpServletRequest req){
      ModelAndView mv = new ModelAndView("redirect:/patient/"+id_patient );
      
      if(!req.getParameter("form").isEmpty() && req.getParameter("form").equals("agenda"))
         mv = new ModelAndView("redirect:/agenda");
      else
         mv = new ModelAndView("redirect:/patient/"+id_patient );
      
      Agenda object = new Agenda();
      object.setId_agenda(Integer.parseInt(req.getParameter("id_agenda")));
      object.setId_user(Integer.parseInt(req.getSession().getAttribute("id_user").toString()));
      object.setId_patient(id_patient);
      object.setDescription(req.getParameter("description"));
      object.setEtat(req.getParameter("etat"));
      
      object.setDate_debut(req.getParameter("date_debut"));
      object.setDate_fin(req.getParameter("date_fin"));
      object.setHeure_debut(req.getParameter("heure_debut"));
      object.setHeure_fin(req.getParameter("heure_fin"));
      
      try{
         service.updateAgenda(object);
      }catch(Exception e){
         String errorMessage = "<li>Erreur de modification du rendez-vous.</li>"
                 + "<li>Cause: "+e.getCause()+"</li>"
                 + "<li>Message: "+e.getMessage()+"</li>";
         params.addFlashAttribute("alertDanger", errorMessage);
         return mv;
      }
      params.addFlashAttribute("alertSuccess", "Modification réussi.");
      //params.addFlashAttribute("alertSuccess", "+ "+object.toString());
      return mv;
   }
   
   
   //Submit Update Agenda ******************************************************
   @RequestMapping(value={"/updateAgenda"}, method = RequestMethod.POST)
   public ModelAndView submitUpdateHMg2(RedirectAttributes params, HttpServletRequest req){
      
      Agenda object = new Agenda();
      object.setId_agenda(Integer.parseInt(req.getParameter("id_agenda")));
      object.setId_patient(Integer.parseInt(req.getParameter("id_patient")));
      object.setId_user(Integer.parseInt(req.getSession().getAttribute("id_user").toString()));
      object.setDescription(req.getParameter("description"));
      object.setEtat(req.getParameter("etat"));
      
      object.setDate_debut(req.getParameter("date_debut"));
      object.setDate_fin(req.getParameter("date_fin"));
      object.setHeure_debut(req.getParameter("heure_debut"));
      object.setHeure_fin(req.getParameter("heure_fin"));
      
      ModelAndView mv ;      
      if(!req.getParameter("form").isEmpty() && req.getParameter("form").equals("agenda"))
         mv = new ModelAndView("redirect:/agenda");
      else
         mv = new ModelAndView("redirect:/patient/"+object.getId_patient() );
      
      
      try{
         service.updateAgenda(object);
      }catch(Exception e){
         String errorMessage = "<li>Erreur de modification du rendez-vous.</li>"
                 + "<li>Cause: "+e.getCause()+"</li>"
                 + "<li>Message: "+e.getMessage()+"</li>";
         params.addFlashAttribute("alertDanger", errorMessage);
         return mv;
      }
      params.addFlashAttribute("alertSuccess", "Modification réussi.");
      return mv;
   }
}
