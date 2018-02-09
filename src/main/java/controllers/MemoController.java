package controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import models.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import services.Service;
import services.ServiceImpl;

@Controller
public class MemoController {
   
   ApplicationContext context;
   ServiceImpl service;
   
   public MemoController(){
      System.out.println("controllers.MemoController.<init>()");
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
   
   //Mes memos *****************************************************************
   @RequestMapping(value={"/memo"}, method = RequestMethod.GET)
   public ModelAndView mesMemos(ModelMap model, HttpServletRequest req, RedirectAttributes params){
      int id_user = Integer.parseInt(req.getSession().getAttribute("id_user").toString());
      ArrayList<Memo> memos = service.getMemosOfUser(id_user);
      /*try{
         service.getMemos(id_user);
      }catch(Exception e){
         params.addFlashAttribute("alertDanger","Erreur de recuperation de la liste des notes de la BD.<li>Message: "+e.getMessage()+"</li>");
      }*/
      
      model.addAttribute("pageTitle", "Mes notes");
      model.addAttribute("memos", memos);
      return new ModelAndView("user_memo");
   }
   
   //Add Memo ******************************************************************
   @RequestMapping(value="/addMemo", method = RequestMethod.POST)
   public ModelAndView submitAddMemo( RedirectAttributes params, HttpServletRequest req){
      
      Memo object = new Memo();
      object.setId_user(Integer.parseInt(req.getSession().getAttribute("id_user").toString()));
      object.setId_memo(service.getNextID("memo"));
      object.setDescription(req.getParameter("description"));
      object.setEtat("nouveau");
      
      
      ModelAndView mv;
      if(!req.getParameter("form").isEmpty() && req.getParameter("form").toString().equals("memo"))
         mv = new ModelAndView("redirect:/memo" );
      else if(!req.getParameter("form").isEmpty() && req.getParameter("form").toString().equals("home"))
         mv = new ModelAndView("redirect:/home" );
      else if(!req.getParameter("form").isEmpty() && req.getParameter("form").toString().equals("patient")){
         int id_patient = Integer.parseInt(req.getParameter("id_patient"));
         mv = new ModelAndView("redirect:/patient/"+id_patient );
      }
      else
         mv = new ModelAndView("redirect:/home" );
      
      try{
         service.addMemo(object);
      }catch(Exception e){
         String errorMessage =
                 "<li>Erreur de création du rendez-vous.</li>"+
                 "<li>Cause: "+e.getCause()+
                 "</li>"+"<li>Message: "+e.getMessage()+"</li>";
         params.addFlashAttribute("alertWarning", errorMessage);
         return mv;
      }
      params.addFlashAttribute("alertSuccess", "Création du rendez-vous.");
      return mv;
   }
   
   //Submit Update Memo ********************************************************
   @RequestMapping(value={"/updateMemo"}, method = RequestMethod.POST)
   public ModelAndView submitUpdateMemo2(RedirectAttributes params, HttpServletRequest req){
      
      Memo object = new Memo();
      object.setId_memo(Integer.parseInt(req.getParameter("id_memo")));
      object.setId_user(Integer.parseInt(req.getSession().getAttribute("id_user").toString()));
      object.setDescription(req.getParameter("description"));
      
      object.setEtat("nouveau");
      
      ModelAndView mv ;
      if(!req.getParameter("form").isEmpty() && req.getParameter("form").equals("agenda"))
         mv = new ModelAndView("redirect:/agenda");
      else if(!req.getParameter("form").isEmpty() && req.getParameter("form").equals("memo"))
         mv = new ModelAndView("redirect:/memo");
      else if(!req.getParameter("form").isEmpty() && req.getParameter("form").equals("patientDashboard"))
         mv = new ModelAndView("redirect:/patient/"+Integer.parseInt(req.getParameter("id_patient")));
      else
         mv = new ModelAndView("redirect:/home");
      
      
      try{
         service.updateMemo(object);
      }catch(Exception e){
         String errorMessage = "<li>Erreur de modification de la note.</li>"
                 + "<li>Cause: "+e.getCause()+"</li>"
                 + "<li>Message: "+e.getMessage()+"</li>";
         params.addFlashAttribute("alertDanger", errorMessage);
         return mv;
      }
      params.addFlashAttribute("alertSuccess", "Modification réussi.");
      return mv;
   }
   
   //Delete Memo ***************************************************************
   @RequestMapping(value={"/deleteMemo"}, method = RequestMethod.POST)
   public ModelAndView deleteMemo(RedirectAttributes params,HttpServletRequest req){
      int id_memo = Integer.parseInt(req.getParameter("id_memo"));
      try{
         service.deleteMemo(id_memo);
         //delete dossier patient
         params.addFlashAttribute("alertSuccess", "Note effacée.");
      }catch(Exception e){
         String errorMessage = "Erreur de suppression de la note. <li>Cause: "+e.getCause()+"</li><li>Message: "+e.getMessage()+"</li>";
         params.addFlashAttribute("alertDanger", errorMessage);
      }
      ModelAndView mv;
      if(!req.getParameter("form").isEmpty() && req.getParameter("form").toString().equals("agenda"))
         mv = new ModelAndView("redirect:/agenda" );
      else if(!req.getParameter("form").isEmpty() && req.getParameter("form").toString().equals("memo"))
         mv = new ModelAndView("redirect:/memo" );
      else if(!req.getParameter("form").isEmpty() && req.getParameter("form").toString().equals("patientDashboard"))
         mv = new ModelAndView("redirect:/patient/"+Integer.parseInt(req.getParameter("id_patient")) );
      else mv = new ModelAndView("redirect:/home");
      return mv;
   }
   
}
