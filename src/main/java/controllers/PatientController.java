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
import services.Service;
import services.ServiceImpl;

@Controller
@RequestMapping(value = "/patient")
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
   
   @RequestMapping(value={"","/index"}, method = RequestMethod.GET)
   public ModelAndView test1(ModelMap model){
      return new ModelAndView("patient/index");
   }
   
   
   
   
   @RequestMapping(value={"/update"}, method = RequestMethod.POST)
   public ModelAndView submitUpdatePatient(@ModelAttribute Patient patient,ModelMap model, HttpServletRequest request){
      ModelAndView mv = new ModelAndView();//"redirect:"+patient.getId_patient());
      mv.clear();
      model.clear();
      mv.setViewName("redirect:"+patient.getId_patient());
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
         model.clear();
         hasError = true;
         errorMessage += "<li>Erreur de modification des informations du patient.</li>";
         errorMessage += "<li>Cause: "+e.getCause()+"</li>";
         errorMessage += "<li>Message: "+e.getMessage()+"</li>";
      }
      if(hasError)
         model.addAttribute("errorMessage", errorMessage);
      model.addAttribute("errorMessage", "zadad");
      return mv;
   }
   
   
   @RequestMapping(value={"/add"}, method = RequestMethod.GET)
   public ModelAndView addPatient(ModelMap model, HttpServletRequest req){
      ModelAndView mv = new ModelAndView("patient/addPatient");
      model.addAttribute("pageTitle", "Création d'un nouveau patient");
      model.addAttribute("alertInfo", "Création dun nouveau patient");
      //req.setAttribute("alertInfo", "Création d'un nouveau patient req");
      //mv.addObject("alertInfo", "Création d'un nouveau patient req");
      return mv;
   }
   @RequestMapping(value={"/add"}, method = RequestMethod.POST)
   public ModelAndView submitAddPatient(@ModelAttribute Patient patient,ModelMap model, HttpServletRequest request){
      
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
         model.addAttribute("errorMessage", errorMessage);
         model.addAttribute("alertWarning", errorMessage);
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
   
   @RequestMapping(value={"/delete"}, method = RequestMethod.POST)
   public ModelAndView deletePatient(@ModelAttribute Patient patient,@ModelAttribute("id_patient") int id_patient, ModelMap model){
      service.deletePatient(id_patient);
      model.clear();
      return new ModelAndView("redirect:list");
   }
   
   @RequestMapping(value={"/list"}, method = RequestMethod.GET)
   public ModelAndView listPatient(ModelMap model){
      
      model.addAttribute("pageTitle", "Liste des patients");
      model.addAttribute("patients", service.getPatients(0));
      model.addAttribute("alertInfo","Liste des patients: "+service.getPatients(0).size()+" patient(s)");
      return new ModelAndView("patient/listPatients");
   }
   
   @RequestMapping(value={"/{id_patient}"}, method = RequestMethod.GET, params={"id_patient"})
   public ModelAndView patient(@ModelAttribute("id_patient") int id_patient, HttpServletRequest request){
      Patient p = null;
      p = service.getPatient(id_patient);
      if(p==null){
         return new ModelAndView("redirect:list");
         //return new ModelAndView("patient/addPatient");
      }
      else{
         ArrayList<Diagnostic> diags = new ArrayList<>();
         diags = service.getDiagnostics(id_patient);
         
         ModelAndView mv = new ModelAndView();
         mv.setViewName("patient/patient");
         mv.addObject("patient", p);
         mv.addObject("pageTitle",p.getNom()+" "+p.getPrenom());
         mv.addObject("diags", diags);
         return mv;
      }
   }
   
   @RequestMapping(value = "/**")
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
