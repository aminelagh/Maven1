package controllers;


import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
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
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.springframework.web.bind.annotation.ModelAttribute;
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
      
      //Si file exist
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
   
   //Submit Update HM **********************************************************
   @RequestMapping(value={"/updatePrescription/{id_patient}"}, method = RequestMethod.POST)
   public ModelAndView submitUpdatePrescription(@ModelAttribute("id_patient") int id_patient, RedirectAttributes params, HttpServletRequest req){
      ModelAndView mv = new ModelAndView("redirect:/patient/"+id_patient );
      
      SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd");
      String created_at = sdf.format(new Date());
      
      Prescription object = new Prescription();
      object.setId_prescription(Integer.parseInt(req.getParameter("id_prescription").toString()));
      object.setId_patient(id_patient);
      object.setDescription(req.getParameter("description"));
      
      try{
         Date date = new Date();
         date = sdf.parse(req.getParameter("date"));
         object.setDate(date);
      } catch (Exception e) {
         e.printStackTrace();
      }
      try{
         service.updatePrescription(object);
      }catch(Exception e){
         String errorMessage = "<li>Erreur de modification de la prescription.</li>";
         errorMessage += "<li>Cause: "+e.getCause()+"</li>";
         errorMessage += "<li>Message: "+e.getMessage()+"</li>";
         params.addFlashAttribute("alertDanger", errorMessage);
         return mv;
      }
      params.addFlashAttribute("alertSuccess", "Modification réussi.");
      return mv;
   }
   
   //Delete Prescription *******************************************************
   @RequestMapping(value={"/deletePrescription"}, method = RequestMethod.POST)
   public ModelAndView deletePrescription(@ModelAttribute("id_prescription") int id_prescription, RedirectAttributes params, HttpServletRequest req){
      int id_patient = 0;
      try{
         id_patient= Integer.parseInt(req.getParameter("id_patient").toString());
         service.deletePrescription(id_prescription);
         params.addFlashAttribute("alertSuccess", "Prescription effacée.");
      }catch(Exception e){
         String errorMessage = "Erreur de suppression de la Prescription. <li>Cause: "+e.getCause()+"</li><li>Message: "+e.getMessage()+"</li>";
         params.addFlashAttribute("alertDanger", errorMessage);
      }
      return new ModelAndView("redirect:patient/"+id_patient);
   }
}
