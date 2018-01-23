package controllers;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.StringJoiner;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import services.Service;
import services.ServiceImpl;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class PrescriptionController {
   
   ApplicationContext context;
   Service service;
   
   public PrescriptionController(){
      System.out.println("controllers.PrescriptionController.<init>()");
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
   
   /*@RequestMapping(value="/addPrescription", method = RequestMethod.POST)
   public ModelAndView submitaddPrescriptionPatientDashboard(RedirectAttributes params, HttpServletRequest req){
      System.out.println("================== submit addPrescription ==================");
      //System.out.println("form : "+req.getParameter("form"));
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd");
      String created_at = sdf.format(new Date());
      
      Prescription object = new Prescription();
      object.setId_patient(Integer.parseInt(req.getParameter("id_patient")));
      object.setDescription(req.getParameter("description"));
      try{
         Date date = new Date();
         date = sdf.parse(req.getParameter("date"));
         object.setDate(date);
      } catch (Exception e) {
         System.out.println("================== Exception addPrescription ==================\n "+e.getMessage());
      }
      
      /*System.out.println("hm : "+hm.toString() );
      System.out.println("id_patient : "+hm.getId_patient());
      System.out.println("description : "+hm.getDescription());
      System.out.println("date : "+hm.getDate());
      System.out.println("date : "+req.getParameter("date"));
      System.out.println("form : "+req.getParameter("form") );*
      
      ModelAndView mv = new ModelAndView("redirect:/patient/"+object.getId_patient());
      String errorMessage = "";
      boolean hasError = false;
      
      try{
         int id_pr = service.getNextID("prescription");
         object.setId_prescription(id_pr);
         service.addPrescription(object);
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
         params.addFlashAttribute("alertSuccess", "Création de la préscription réussi.");
      return mv;
   }
   */
   
   @RequestMapping(value="/addPrescription", method = RequestMethod.POST)
   public String handleFileUpload(@RequestParam("file") MultipartFile file, RedirectAttributes params,HttpServletRequest req){
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd");
      String created_at = sdf.format(new Date());
      
      Prescription object = new Prescription();
      int id_prescription = service.getNextID("prescription");
      object.setId_prescription(id_prescription);
      object.setId_patient(Integer.parseInt(req.getParameter("id_patient")));
      object.setDescription(req.getParameter("description"));
      try{
         Date date = new Date();
         date = sdf.parse(req.getParameter("date"));
         object.setDate(date);
      } catch (Exception e) {e.printStackTrace();}
      try{
         service.addPrescription(object);
      }catch(Exception e){
         params.addFlashAttribute("alertDanger", "Erreur de création de la préscription."+"<li>"+e.getMessage()+"</li>");
      }
      
      //Si au
      if(!file.isEmpty()){
         String uploading_path = "C://Users/amine/Desktop/uploads/";
         FileItemFactory factory = new DiskFileItemFactory();
         byte[] bytes;
         try {
            bytes = file.getBytes();
            int id_imagerie = service.getNextID("imagerie");
            
            //Get file extension
            String Str = new String(file.getOriginalFilename().toString());
            String ext = "";
            for (String retval: Str.split(Pattern.quote(".")))
               ext = retval;
            
            //File name
            String filename = "imagerie_"+id_imagerie+"."+ext;
            
            //renaming & Uploading file
            Path path = Paths.get(uploading_path + filename);
            Files.write(path, bytes);
            params.addFlashAttribute("alertSuccess","Chargement du fichier réussi.");
            
            //insert imagerie
            Imagerie im = new Imagerie();
            im.setId_imagerie(id_imagerie);
            im.setId_prescription(id_prescription);
            im.setFilename(filename);
            service.addImagerie(im);
            
         } catch (Exception ex) {
            System.out.println("Error uploading file: "+ex.getMessage() );
         }
      }      
      params.addFlashAttribute("alertSuccess","Création de la préscription réussi.");
      return "redirect:/patient/"+req.getParameter("id_patient");
   }
   
}
