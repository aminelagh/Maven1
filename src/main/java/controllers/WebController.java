package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;
import org.springframework.security.access.annotation.*;
import org.springframework.security.*;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class WebController {
   
   public WebController(){
      System.out.println("controllers.WebController.<init>()");
   }
   
   
   @RequestMapping(value = "/aaa/{var1}", method = RequestMethod.GET)
   public ModelAndView aa() {
      ModelAndView mv = new ModelAndView("home");
      int var1 = 5;
      mv.addObject("var1",var1);
      mv.addObject("var2", 6);
      System.out.println("\n\n\n==> "+var1);
      return mv;
   }
   
   
   
   @RequestMapping(value={"/","/index"}, method = RequestMethod.GET)
   public ModelAndView test1(ModelMap model, HttpServletRequest request){
      System.err.println("path"+request.getContextPath());
      return new ModelAndView("home");
   }
   
   
   @RequestMapping(value={"/home"}, method = RequestMethod.GET)
   public ModelAndView home(ModelMap model){
      model.addAttribute("pageTitle", "Home page");
      return new ModelAndView("home");
   }
   
   @RequestMapping(value={"/login"}, method = RequestMethod.GET)
   public ModelAndView login(ModelMap model){
      System.err.println("WebController().login !!!!!!: ");
      return new ModelAndView("login");
   }
   
   @RequestMapping(value={"/login"}, method = RequestMethod.POST)
   public ModelAndView submitLogin(
           ModelMap model,
           HttpServletRequest request,
           HttpSession session){
      
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      String errorMessage = "";
      boolean hasError = false;
      if(username.equals("amine"))
      {
         if(password.equals("123"))
         {
            session.setAttribute("username", username);
            session.setAttribute("role", "admin");
            return new ModelAndView("redirect: /ad");
         }
         else{
            hasError = true;
            errorMessage = "Wrong password!!! Try Again.";
            
         }
      }else{
         hasError = true;
         errorMessage = "Username: "+username+" doesn't exist !!!";
      }
      if(hasError==true)
      {model.addAttribute("hasError",hasError);
      model.addAttribute("errorMessage",errorMessage);}
      return new ModelAndView("login");
   }
   
   
   
   @RequestMapping(value="/logout", method = RequestMethod.GET)
   public ModelAndView logout(ModelMap model,HttpSession session){
      if(session.getAttribute("username")==null){
         model.addAttribute("message", "You are not logged-in !! so no need to logout");
         return new ModelAndView("redirect:login");
      }
      else{
         session.invalidate();
         model.addAttribute("message", "You are logged-out !! see u soon");
         return new ModelAndView("index");
      }
   }
   
   
   
   
   @RequestMapping(value={"/p1","/page1"}, method = RequestMethod.GET)
   public ModelAndView page1(ModelMap model){
      return new ModelAndView("page1");
   }
   
   @RequestMapping(value={"/p1","/page2"}, method = RequestMethod.GET)
   public ModelAndView page2(ModelMap model){
      model.addAttribute("message", "/page2 with Page1 view");
      return new ModelAndView("page1");
   }
   
   
   
}
