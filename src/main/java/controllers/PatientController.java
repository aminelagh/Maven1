package controllers;

import javax.servlet.http.HttpServletRequest;
import models.*;
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
import services.DiagnosticService;
import services.DiagnosticServiceImpl;

@Controller
@RequestMapping(value = "/patient")
public class PatientController {
   
   
   ApplicationContext context;// = new ClassPathXmlApplicationContext("Beans.xml");
   PatientService patientService;// = (PatientServiceImpl)context.getBean("beanPatientServiceHibernate");
   DiagnosticService diagnosticService;
   
   
   public PatientController(){
      System.out.println("controllers.ClientController.<init>()");
      try{
         context = new ClassPathXmlApplicationContext("Beans.xml");
         patientService = (PatientServiceImpl)context.getBean("beanPatientServiceImpl");
         //diagnosticService = (DiagnosticServiceImpl)context.getBean("beanDiagnosticServiceImpl");
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
   public ModelAndView submitAddPatient(@ModelAttribute Patient patient,ModelMap model, HttpServletRequest request){
      //Diagnostic diag = new Diagnostic(Integer.parseInt(request.getParameter("nombre_seances")), request.getParameter("description").toString());
      //Diagnostic diag = new Diagnostic();
      //if nom is empty
      String errorMessage = "";
      boolean hasError = false;
      boolean withDiag = false;
      
      patientService.add(patient);
      return new ModelAndView("patient/addPatient");
      /*
      //avec Diag
      if(request.getParameter("withDiagnostic")!=null && request.getParameter("withDiagnostic").equals("on")){
      withDiag = true;
      if(!request.getParameter("nombre_seances").isEmpty())
      diag.setNombre_seances(Integer.parseInt(request.getParameter("nombre_seances")));
      if(!request.getParameter("description").isEmpty())
      diag.setDescription(request.getParameter("description") );
      }
      
      //si nom empty
      if(patient.getNom().isEmpty()){
      errorMessage = "<li>nom is empty, please fill it.</li>" + errorMessage;
      hasError = true;
      }
      //si description empty
      if(withDiag && request.getParameter("description").isEmpty()){
      hasError = true;
      errorMessage = "Veuillez saisir la description du diagnostic" + errorMessage;
      }
      if(hasError){
      model.addAttribute("diagnostic", diag);
      model.addAttribute("patient", patient);
      model.addAttribute("errorMessage", errorMessage);
      return new ModelAndView("patient/addPatient");
      }
      else{
      model.addAttribute("pageTitle", "Création d'un nouveau patient");
      model.addAttribute("successMessage", "Creation du patient "+patient.getNom()+" "+patient.getPrenom()+" reussi.");
      model.addAttribute("patient", null);
      model.addAttribute("diagnostic", null);
      int id_patient = patientService.getNextID2();
      patient.setId_patient(id_patient);
      patient.setId_user(0);
      //patient.setCreated_at(null);
      
      try{
      patientService.add(patient);
      if(withDiag)
      {
      diag.setId_patient(id_patient);
      diagnosticService.add(diag);
      }
      
      }catch(Exception e){
      model.addAttribute("errorMessage", "Erreur de création du patient. <br>"+e.getMessage()+" - "+e.getCause());
      }
      }
      return new ModelAndView("patient/addPatient");*/
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
         //context = new ClassPathXmlApplicationContext("Beans.xml");
         //patientService = (PatientServiceImpl)context.getBean("beanPatientServiceHibernate");
      }
      catch(Exception e){
         String errorMessage = "";
         errorMessage ="<li>Erreur de connexion avec la base de données ! veuillez réessayer ultérieurement.</li>"+errorMessage;
         errorMessage ="<li>Cause: "+e.getCause()+"</li>"+errorMessage;
         errorMessage ="<li>Message: "+e.getMessage()+"</li>"+errorMessage;
         model.addAttribute("errorMessage", errorMessage);
         model.addAttribute("pageTitle", "Erreur - KinéApp");
         return new ModelAndView("errorPages/errorPage");
      }
      
      model.addAttribute("pageTitle", "Liste des patients");
      model.addAttribute("patients", patientService.get());
      return new ModelAndView("patient/listPatients");
   }
   
   
   @RequestMapping(value = "/**")
   public String errorPage(ModelMap model){
      model.addAttribute("pageTitle", "Erreur - KinéApp");
      model.addAttribute("errorMessage", "URL requested doesn't exist !!");
      return "errorPages/errorPage";
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
