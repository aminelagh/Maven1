package controllers;

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
public class DiagnosticController {
   
   ApplicationContext context;
   Service service;
   
   public DiagnosticController(){
      System.out.println("controllers.DiagnosticController.<init>()");
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
   
   //submit Add Diagnostic *****************************************************
   @RequestMapping(value="/addDiag", method = RequestMethod.POST, params = {"form=patienDashboard"})
   public ModelAndView submitAddDiagnosticPatientDashboard(@ModelAttribute Diagnostic diag, RedirectAttributes params, HttpServletRequest req){
      System.out.println("================== submitAddDiagnostic ==================");
      
      ModelAndView mv = new ModelAndView("redirect:/patient/"+diag.getId_patient());
      String errorMessage = "";
      boolean hasError = false;
      
      if(diag.getDescription().length()==0){
         hasError = true;
         errorMessage += "<li>Veuillez saisir la description du diagnostic.</li>";
      }
      try{
         if(!hasError){
            diag.setId_diagnostic(service.getNextID("diagnostic"));
            service.addDiagnostic(diag);
         }
      }catch(Exception e){
         hasError = true;
         errorMessage +=
                 "<li>Erreur de création du diagnostic.</li>"+
                 "<li>Cause: "+e.getCause()+
                 "</li>"+"<li>Message: "+e.getMessage()+"</li>";
      }
      if(hasError){
         params.addFlashAttribute("alertWarning", errorMessage);
         //mv.addObject("diag", diag);
      }
      else
         params.addFlashAttribute("alertSuccess", "Création du diagnostic réussi.");
      return mv;
   }
   
   //Submit Update Diagnostic **************************************************
   @RequestMapping(value={"/updateDiag/{id_patient}"}, method = RequestMethod.POST)
   public ModelAndView submitUpdateDiag(@ModelAttribute("id_patient") int id_patient, RedirectAttributes params, HttpServletRequest req){
      ModelAndView mv = new ModelAndView("redirect:/patient/"+id_patient );
            
      System.out.println("=== "+req.getParameter("id_diagnostic"));
      System.out.println("=== "+req.getParameter("nombre_seances"));
      Diagnostic diag = new Diagnostic();
      diag.setId_diagnostic(Integer.parseInt(req.getParameter("id_diagnostic").toString()));
      diag.setId_patient(id_patient);
      diag.setDescription(req.getParameter("description").toString());
      diag.setNombre_seances(Integer.parseInt(req.getParameter("nombre_seances").toString()));      
      System.out.println("===== "+diag.toString());
      try{
         service.updateDiagnostic(diag);
      }catch(Exception e){
         String errorMessage = "<li>Erreur de modification du diagnostic.</li>";
         errorMessage += "<li>Cause: "+e.getCause()+"</li>";
         errorMessage += "<li>Message: "+e.getMessage()+"</li>";
         params.addFlashAttribute("alertDanger", errorMessage);
         return mv;
      }
      params.addFlashAttribute("alertSuccess", "Modification réussi.");
      return mv;
   }
   
   //Delete Diagnostic *********************************************************
   @RequestMapping(value={"/deleteDiagnostic"}, method = RequestMethod.POST)
   public ModelAndView deleteDiagnostic(@ModelAttribute("id_diagnostic") int id_diagnostic, RedirectAttributes params, HttpServletRequest req){
      int id_patient = 0;
      try{
         id_patient= Integer.parseInt(req.getParameter("id_patient").toString());
         service.deleteDiagnostic(id_diagnostic);
         //delete dossier patient
         params.addFlashAttribute("alertSuccess", "Diagnostic effacé.");
      }catch(Exception e){
         String errorMessage = "Erreur de suppression du diagnostic. <li>Cause: "+e.getCause()+"</li><li>Message: "+e.getMessage()+"</li>";
         params.addFlashAttribute("alertDanger", errorMessage);
      }
      return new ModelAndView("redirect:patient/"+id_patient);
   }
   
}
