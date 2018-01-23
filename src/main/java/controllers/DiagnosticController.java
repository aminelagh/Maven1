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
   /*
   @RequestMapping(value="/patient/addDiag", method = RequestMethod.POST)
   public ModelAndView submitAddDiagnostic(RedirectAttributes params, HttpServletRequest req){
      Diagnostic diag = new Diagnostic();
      diag.setId_diagnostic(service.getNextID("diagnostic"));
      diag.setId_patient(Integer.parseInt(req.getParameter("id_patient")));
      diag.setNombre_seances(Integer.parseInt(req.getParameter("nombre_seances")));
      diag.setDescription(req.getParameter("description"));
      
      System.out.println("================== submitAddDiagnostic ==================");
      System.out.println("form : "+req.getParameter("form"));
      System.out.println("diag : "+diag.toString() );
      System.out.println("id_patient : "+diag.getId_patient());
      System.out.println("description : "+diag.getDescription());
      System.out.println("nombre_seances : "+diag.getNombre_seances());
      
      ModelAndView mv = new ModelAndView("redirect:/patient/"+diag.getId_patient());
      return mv;
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
   */
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
   
   /*
   @RequestMapping(value="/patient/addDiag", params = {"description=null"})
   public ModelAndView submitAddDiagnosticEmpty(RedirectAttributes params, HttpServletRequest req){
      System.out.println("================== submitAddDiagnosticEmpty ==================");
      System.out.println("================== "+req.getParameter("id_patient") );
      
      ModelAndView mv = new ModelAndView("redirect:/patient/1");   
      params.addFlashAttribute("alertSuccess", "submitAddDiagnosticEmpty.");
      return mv;
   }*/
   
   
   
   
   
   
}
