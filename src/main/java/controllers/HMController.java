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
public class HMController {
   
   ApplicationContext context;
   Service service;
   
   public HMController(){
      System.out.println("controllers.HMController.<init>()");
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
   
   @RequestMapping(value="/addHM", method = RequestMethod.POST)
   public ModelAndView submitAddDiagnosticPatientDashboard( RedirectAttributes params, HttpServletRequest req){
      System.out.println("================== submitAddHM ==================");
      //System.out.println("form : "+req.getParameter("form"));
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd");
      String created_at = sdf.format(new Date());
           
      Historique_medical hm = new Historique_medical();
      hm.setId_patient(Integer.parseInt(req.getParameter("id_patient")));
      hm.setDescription(req.getParameter("description"));
       try{
         Date date = new Date();
         date = sdf.parse(req.getParameter("date"));
         hm.setDate(date);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      /*System.out.println("hm : "+hm.toString() );
      System.out.println("id_patient : "+hm.getId_patient());
      System.out.println("description : "+hm.getDescription());
      System.out.println("date : "+hm.getDate());
      System.out.println("date : "+req.getParameter("date"));
      System.out.println("form : "+req.getParameter("form") );*/
      
      ModelAndView mv = new ModelAndView("redirect:/patient/"+hm.getId_patient());
      String errorMessage = "";
      boolean hasError = false;
      
      try{
         hm.setId_hm(service.getNextID("historique_medical"));
         service.addHistorique_medical(hm);
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
         params.addFlashAttribute("alertSuccess", "Création de l'historique médical réussi.");
      return mv;
   }
   
   @RequestMapping(value="/patient/addHMs", method = RequestMethod.POST, params = {"form=patienDashboard"})
   public ModelAndView submitAddDiagnosticPatientDashboard2(@ModelAttribute Historique_medical hm, RedirectAttributes params, HttpServletRequest req){
      System.out.println("================== submitAddDiagnostic ==================");
      //System.out.println("form : "+req.getParameter("form"));
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd");
      String created_at = sdf.format(new Date());
      
      System.out.println("hm : "+hm.toString() );
      System.out.println("id_patient : "+hm.getId_patient());
      System.out.println("description : "+hm.getDescription());
      System.out.println("date : "+hm.getDate());
      System.out.println("date : "+req.getParameter("date") );
      System.out.println("formHM : "+req.getParameter("formHM") );
      
      ModelAndView mv = new ModelAndView("redirect:/patient/"+hm.getId_patient());
      String errorMessage = "";
      boolean hasError = false;
      
      try{
         hm.setId_hm(service.getNextID("historique_medical"));
         //service.addHistorique_medical(hm);
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
         params.addFlashAttribute("alertSuccess", "Création de l'historique médical réussi.");
      return mv;
   }
   
   
   
   
   
   
}
