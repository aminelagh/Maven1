package controllers;

import java.util.ArrayList;
import java.util.List;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import services.Service;
import services.ServiceImpl;

@Controller
//@RequestMapping(value = "/patient")
public class PatientController {
   
   ApplicationContext context;
   Service service;
   
   public PatientController(){
      System.out.println("controllers.ClientController.<init>()");
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
   
   /*@RequestMapping(value={"/patient","/patient/index"}, method = RequestMethod.GET)
   public ModelAndView test1(ModelMap model){return new ModelAndView("patient/index");}*/
   
   @RequestMapping(value={"/updatePatient"}, method = RequestMethod.POST)
   public ModelAndView submitUpdatePatient(@ModelAttribute Patient patient, RedirectAttributes params){
      
      ModelAndView mv = new ModelAndView("redirect:/patient/"+patient.getId_patient()); //"redirect:"+patient.getId_patient());
      String errorMessage = "";
      boolean hasError = false;
      
      if(patient.getNom().length()==0){
         hasError = true;
         errorMessage += "<li>Veuillez saisir le nom du patient.</li>";
      }
      try{
         if(!hasError)
            service.updatePatient(patient);
      }catch(Exception e){
         //model.clear();
         hasError = true;
         errorMessage += "<li>Erreur de modification des informations du patient.</li>";
         errorMessage += "<li>Cause: "+e.getCause()+"</li>";
         errorMessage += "<li>Message: "+e.getMessage()+"</li>";
      }
      if(hasError)
         params.addFlashAttribute("alertWarning", errorMessage);
      else
         params.addFlashAttribute("alertSuccess", "Modification réussi.");
      return mv; //this.patient(patient.getId_patient(), request);
   }
   
   @RequestMapping(value={"/deletePatient"}, method = RequestMethod.POST)
   public ModelAndView deletePatient(@ModelAttribute Patient patient,@ModelAttribute("id_patient") int id_patient, RedirectAttributes params){
      try{
         service.deletePatient(id_patient);
         //delete dossier patient
         params.addFlashAttribute("alertSuccess", "Patient effacé.");
      }catch(Exception e){
         String errorMessage = "Erreur de suppression du dossier du patient. <li>Cause: "+e.getCause()+"</li><li>Message: "+e.getMessage()+"</li>";
         params.addFlashAttribute("alertDanger", errorMessage);
      }
      return new ModelAndView("redirect:patients");
   }
   
   //Liste des patients ********************************************************
   @RequestMapping(value={"/patients"}, method = RequestMethod.GET)
   public ModelAndView listPatient(ModelMap model, HttpServletRequest req){
      int id_user = 1;//Integer.parseInt(req.getSession().getAttribute("id_user").toString());
      model.addAttribute("pageTitle", "Liste des patients");
      model.addAttribute("patients", service.getPatients(id_user));
      
      return new ModelAndView("patient/listPatients");
   }
   
   @RequestMapping(value={"/patient/{id_patient}"}, method = RequestMethod.GET)
   public ModelAndView patient(@ModelAttribute("id_patient") int id_patient, HttpServletRequest req,RedirectAttributes params){
      Patient p = null;
      int id_user = Integer.parseInt(req.getSession().getAttribute("id_user").toString() );
      p = service.getPatient(id_patient);
      if(p==null){
         return new ModelAndView("redirect:patients");
      }
      else{
         ArrayList<Diagnostic> diags = new ArrayList<>();
         diags = service.getDiagnostics(id_patient);
         ArrayList<Historique_medical> HMs = service.getHistorique_medicals(id_patient);
         ArrayList<Diagnostic> diagnostics = service.getDiagnostics(id_patient);
         ArrayList<Prescription> prescriptions = service.getPrescriptions(id_patient);
         ArrayList<Imagerie> imageries = service.getImageriesOfPatient(id_patient);
         //List<Diagnostic> sub = diagnostics.subList(0, 5);
         
         ModelAndView mv = new ModelAndView();
         mv.setViewName("patient/patient");
         mv.addObject("patient", p);
         mv.addObject("pageTitle",p.getNom()+" "+p.getPrenom());
         
         mv.addObject("diagnostics", diagnostics);
         mv.addObject("prescriptions", prescriptions);
         mv.addObject("imageries", imageries);
         mv.addObject("HMs", HMs);
         
         return mv;
      }
   }
   
   @RequestMapping(value="/addPatient", method = RequestMethod.POST)
   public ModelAndView submitAddPatient(ModelMap model, HttpServletRequest request,RedirectAttributes params){
      
      try{
         int id_patient = service.getNextID("patient");
         Patient patient = new Patient();
         patient.setId_patient(id_patient);
         patient.setId_user(Integer.parseInt(request.getSession().getAttribute("id_user").toString()));
         patient.setNom(request.getParameter("nom"));
         patient.setPrenom(request.getParameter("prenom"));
         patient.setDob(request.getParameter("dob"));
         patient.setCin(request.getParameter("cin"));
         patient.setAdresse(request.getParameter("adresse"));
         service.addPatient(patient);
         params.addFlashAttribute("alertSuccess", "Création du patient "+patient.getNom()+" "+patient.getPrenom()+" reussi.");
      }catch(Exception e){
         params.addFlashAttribute("alertDanger", "Erreur de création du patient. <li>"+e.getMessage()+"</li>" );
      }
      return new ModelAndView("redirect:patients");
   }
   /*
   
   @RequestMapping(value = "/**")
   public String errorPage1(ModelMap model){
   model.addAttribute("pageTitle", "Erreur - KinéApp");
   model.addAttribute("errorMessage", "URL requested doesn't exist !!");
   return "errorPages/errorPage";
   }*/
   
   
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
