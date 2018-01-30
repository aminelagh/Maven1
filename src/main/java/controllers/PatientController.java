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
   
   //Liste des patients ********************************************************
   @RequestMapping(value={"/patients"}, method = RequestMethod.GET)
   public ModelAndView listPatient(ModelMap model, HttpServletRequest req){
      int id_user = 1;//Integer.parseInt(req.getSession().getAttribute("id_user").toString());
      model.addAttribute("pageTitle", "Mes patients");
      model.addAttribute("patients", service.getPatients(id_user));
      return new ModelAndView("patient_list");
   }
   
   //Patient DashBoard *********************************************************
   @RequestMapping(value={"/patient/{id_patient}"}, method = RequestMethod.GET)
   public ModelAndView patient(@ModelAttribute("id_patient") int id_patient, HttpServletRequest req,RedirectAttributes params){
      Patient p = null;
      int id_user = Integer.parseInt(req.getSession().getAttribute("id_user").toString() );
      p = service.getPatient(id_patient);
      if(p==null){
         params.addFlashAttribute("alertWarning","Le patient choisi n'existe pas !!");
         return new ModelAndView("redirect:/patients");
      }
      else{
         ArrayList<Diagnostic> diags = new ArrayList<>();
         diags = service.getDiagnostics(id_patient);
         ArrayList<Historique_medical> HMs = service.getHistorique_medicals(id_patient);
         ArrayList<Diagnostic> diagnostics = service.getDiagnostics(id_patient);
         ArrayList<Prescription> prescriptions = service.getPrescriptions(id_patient);
         ArrayList<Imagerie> imageries = service.getImageriesOfPatient(id_patient);
         ArrayList<Agenda> agendas = service.getAgendasOfPatient(id_patient);
         
         ModelAndView mv = new ModelAndView();
         mv.setViewName("patient_dashboard");
         mv.addObject("patient", p);
         mv.addObject("pageTitle",p.getNom()+" "+p.getPrenom());
         
         mv.addObject("diagnostics", diagnostics);
         mv.addObject("prescriptions", prescriptions);
         mv.addObject("imageries", imageries);
         mv.addObject("HMs", HMs);
         mv.addObject("agendas", agendas);
         
         return mv;
      }
   }
   
   //Submit Add Patient ********************************************************
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
   
   //Submit Update Patient *****************************************************
   @RequestMapping(value={"/updatePatient"}, method = RequestMethod.POST)
   public ModelAndView submitUpdatePatient(@ModelAttribute Patient patient, RedirectAttributes params, HttpServletRequest req){
      
      ModelAndView mv = new ModelAndView("redirect:/patient/"+patient.getId_patient()); //"redirect:"+patient.getId_patient());
      String errorMessage = "";
      boolean hasError = false;
      int id_user = Integer.parseInt(req.getSession().getAttribute("id_user").toString());
      
      if(patient.getNom().length()==0){
         hasError = true;
         errorMessage += "<li>Veuillez saisir le nom du patient.</li>";
      }
      try{
         if(!hasError){
            patient.setId_user(id_user);
            service.updatePatient(patient);
         }
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
   
   //Delete Patient ************************************************************
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
   
}
