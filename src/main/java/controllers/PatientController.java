package controllers;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
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
   
   @RequestMapping(value={"/addPatient"}, method = RequestMethod.GET)
   public ModelAndView addPatient(ModelMap model, HttpServletRequest req){
      ModelAndView mv = new ModelAndView("patient/addPatient");
      model.addAttribute("pageTitle", "Création d'un nouveau patient");
      model.addAttribute("alertInfo", "Création dun nouveau patient");
      //req.setAttribute("alertInfo", "Création d'un nouveau patient req");
      //mv.addObject("alertInfo", "Création d'un nouveau patient req");
      return mv;
   }
   
   @RequestMapping(value={"/addPatient"}, method = RequestMethod.POST)
   public ModelAndView submitAddPatient(@ModelAttribute Patient patient,ModelMap model, HttpServletRequest request,RedirectAttributes params){
      
      Diagnostic diag = new Diagnostic();
      String errorMessage = "";
      boolean hasError = false;
      boolean withDiag = false;
      
      if(request.getParameter("withDiagnostic")!=null && request.getParameter("withDiagnostic").equals("on")){
         withDiag = true;
         if(!request.getParameter("nombre_seances").isEmpty())
            diag.setNombre_seances(Integer.parseInt(request.getParameter("nombre_seances")));
         if(!request.getParameter("description").isEmpty())
            diag.setDescription(request.getParameter("description") );
      }
      
      //si nom empty
      if(patient.getNom().isEmpty()){
         errorMessage = errorMessage + "<li>Le champ Nom est necessaire pour valider la création d'un nouveau patient.</li>";
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
         params.addFlashAttribute("alertWarning", errorMessage);
         return new ModelAndView("patient/addPatient");
      }
      else{
         model.addAttribute("pageTitle", "Création d'un nouveau patient");
         model.addAttribute("successMessage", "Creation du patient "+patient.getNom()+" "+patient.getPrenom()+" reussi.");
         model.addAttribute("patient", null);
         model.addAttribute("diagnostic", null);
         int id_patient = service.getNextID("patient");
         patient.setId_patient(id_patient);
         patient.setId_user(0);
         //patient.setCreated_at(null);
         
         try{
            service.addPatient(patient);
            if(withDiag)
            {
               diag.setId_patient(id_patient);
               diag.setDescription(request.getParameter("description"));
               diag.setNombre_seances(Integer.parseInt(request.getParameter("nombre_seances")));
               service.addDiagnostic(diag);
            }
         }catch(Exception e){
            model.addAttribute("alertDanger", "Erreur de création du patient. <br>"+e.getMessage()+" - "+e.getCause());
         }
      }
      model.addAttribute("alertSuccess", "Création du patient reussi.");
      return new ModelAndView("patient/addPatient");
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
   public ModelAndView listPatient(ModelMap model){
      
      model.addAttribute("pageTitle", "Liste des patients");
      model.addAttribute("patients", service.getPatients(0));
      for (Patient patient : service.getPatients(0)) {
         System.err.println(patient.toString());
      }
      model.addAttribute("alertInfo","Liste des patients: "+service.getPatients(0).size()+" patient(s)");
      return new ModelAndView("patient/listPatients");
   }
   
   @RequestMapping(value={"/patient/{id_patient}"}, method = RequestMethod.GET)
   public ModelAndView patient(@ModelAttribute("id_patient") int id_patient, HttpServletRequest req,RedirectAttributes params){
      Patient p = null;
      p = service.getPatient(id_patient);
      if(p==null){
         return new ModelAndView("redirect:list");
         //return new ModelAndView("patient/addPatient");
      }
      else{
         ArrayList<Diagnostic> diags = new ArrayList<>();
         diags = service.getDiagnostics(id_patient);
         ArrayList<Historique_medical> HMs = new ArrayList<>();
         HMs = service.getHistorique_medicals(id_patient);
         
         ModelAndView mv = new ModelAndView();
         mv.setViewName("patient/patient");
         mv.addObject("patient", p);
         mv.addObject("pageTitle",p.getNom()+" "+p.getPrenom());
         mv.addObject("diags", service.getDiagnosticsTopX(id_patient,5));
         //mv.addObject("diagsNumber", diags.size());
         mv.addObject("HMs", service.getHistorique_medicalsTopX(id_patient,10));
         mv.addObject("prescriptions", service.getPrescriptions(id_patient) );
         return mv;
      }
   }
   
   
   
   @RequestMapping(value = "/patient/**")
   public String errorPage1(ModelMap model){
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
