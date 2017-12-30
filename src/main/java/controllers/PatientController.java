package controllers;

import dao.PatientDaoHibernateImpl;
import java.sql.Connection;
import java.sql.DriverManager;
import models.Patient;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import services.PatientService;
import services.PatientServiceImpl;
import dao.PatientDaoHibernateImpl;
import java.util.ArrayList;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;
import util.HibernateUtil;

@Controller
@RequestMapping(value = "/patient")
public class PatientController {
   
   
   ApplicationContext context;// = new ClassPathXmlApplicationContext("Beans.xml");
   PatientService patientService;// = (PatientServiceImpl)context.getBean("beanPatientServiceHibernate");
   
   
   public PatientController(){
      System.out.println("controllers.ClientController.<init>()");
      try{
         context = new ClassPathXmlApplicationContext("Beans.xml");
         patientService = (PatientServiceImpl)context.getBean("beanPatientServiceHibernate");
      }
      catch(Exception e){e.printStackTrace();}
      
   }
   
   public ModelAndView redirectTo(String view){
      return new ModelAndView(view);
   }
   
   @RequestMapping(value={"/","/index"}, method = RequestMethod.GET)
   public ModelAndView test1(ModelMap model){
      return new ModelAndView("patient/index");
   }
   
   @RequestMapping(value={"/add"}, method = RequestMethod.GET)
   public ModelAndView addPatient(ModelMap model){
      model.addAttribute("pageTitle", "Création d'un nouveau patient");
      return new ModelAndView("patient/addPatient");
   }
   
   @RequestMapping(value={"/add"}, method = RequestMethod.POST)
   public ModelAndView submitAddPatient(@ModelAttribute Patient patient, ModelMap model){
      if(patient.getNom().isEmpty()){
         model.addAttribute("errorMessage", "nom is empty, please fill it.");
         model.addAttribute("patient", patient);
         //return new ModelAndView("redirect: /patient/add");
      }else{
         model.addAttribute("pageTitle", "Création d'un nouveau patient");
         model.addAttribute("successMessage", "Creation du patient "+patient.getNom()+" "+patient.getPrenom()+" reussi.");
         model.addAttribute("patient", null);
         try{
            patientService.add(patient);
         }catch(Exception e){model.addAttribute("errorMessage", "Erreur de création du patient. <br>"+e.getMessage());}
      }
      return new ModelAndView("patient/addPatient");
   }
   
   @RequestMapping(value={"/delete"}, method = RequestMethod.POST)
   public ModelAndView deletePatient(@ModelAttribute Patient patient,@ModelAttribute("id_patient") int id_patient, ModelMap model){
      patientService.delete(id_patient);
      model.clear();
      return new ModelAndView("redirect:list");
   }
   
   @RequestMapping(value={"/list"}, method = RequestMethod.GET)
   public ModelAndView listPatient(ModelMap model){
      try{
         context = new ClassPathXmlApplicationContext("Beans.xml");
         patientService = (PatientServiceImpl)context.getBean("beanPatientServiceHibernate");
      }
      catch(Exception e){e.printStackTrace();
      
      model.addAttribute("errorMessage", "Erreur de connexion avec la base de données ! veuillez réessayer ultérieurement.<hr> "+e.getMessage());
      return new ModelAndView("errorPages/errorPage");
      }
      
      model.addAttribute("pageTitle", "Liste des patients");
      model.addAttribute("patients", patientService.get());
      return new ModelAndView("patient/listPatients");
      
   }
   
   
   
   
   
   
   
   
   /*
   @RequestMapping(value={"/delete"}, method = RequestMethod.POST)
   public RedirectView deletePatient(@ModelAttribute Patient patient,@ModelAttribute("id_patient") int id_patient, ModelMap model,RedirectAttributes attributes){
   //patientService.delete(id_patient);
   model.addAttribute("successMessage", "Patient Deleted");
   return new RedirectView("./list");
   //return new ModelAndView("redirect:list");
   }
   */
   
}
