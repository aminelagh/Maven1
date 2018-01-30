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
   
   //Add HM ********************************************************************
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
   
   //Submit Update HM **********************************************************
   @RequestMapping(value={"/updateHM/{id_patient}"}, method = RequestMethod.POST)
   public ModelAndView submitUpdateHMg(@ModelAttribute("id_patient") int id_patient, RedirectAttributes params, HttpServletRequest req){
      ModelAndView mv = new ModelAndView("redirect:/patient/"+id_patient );
      
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd");
      String created_at = sdf.format(new Date());
      
      Historique_medical object = new Historique_medical();
      object.setId_hm(Integer.parseInt(req.getParameter("id_hm").toString()));
      object.setId_patient(id_patient);
      object.setDescription(req.getParameter("description"));
      
      try{
         Date date = new Date();
         date = sdf.parse(req.getParameter("date"));
         object.setDate(date);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      System.out.println("===== "+object.toString());
      try{
         service.updateHistorique_medical(object);
      }catch(Exception e){
         String errorMessage = "<li>Erreur de modification del'historique medical.</li>";
         errorMessage += "<li>Cause: "+e.getCause()+"</li>";
         errorMessage += "<li>Message: "+e.getMessage()+"</li>";
         params.addFlashAttribute("alertDanger", errorMessage);
         return mv;
      }
      params.addFlashAttribute("alertSuccess", "Modification réussi.");
      return mv;
   }
      
   //Delete HM *****************************************************************
   @RequestMapping(value={"/deleteHM"}, method = RequestMethod.POST)
   public ModelAndView deleteHM(@ModelAttribute("id_hm") int id_hm, RedirectAttributes params, HttpServletRequest req){
      int id_patient = 0;
      try{
         id_patient= Integer.parseInt(req.getParameter("id_patient").toString());
         service.deleteHistorique_medical(id_hm);
         params.addFlashAttribute("alertSuccess", "Histoque medical effacé.");
      }catch(Exception e){
         String errorMessage = "Erreur de suppression de l'historique médcial. <li>Cause: "+e.getCause()+"</li><li>Message: "+e.getMessage()+"</li>";
         params.addFlashAttribute("alertDanger", errorMessage);
      }
      return new ModelAndView("redirect:patient/"+id_patient);
   }
   
}
