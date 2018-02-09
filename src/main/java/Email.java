import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

class Mailer{
   public static void send(String from,String password,String to,String sub,String msg){
      //Get properties object
      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", "smtp.gmail.com");
      //props.put("mail.smtp.socketFactory.port", "465");
      //props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
      props.put("mail.smtp.port", "587");//465
      //get Session
      Session session = Session.getDefaultInstance(props,
              new javax.mail.Authenticator() {
                 protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(from,password);
                 }
              });
      //compose message
      try {
         MimeMessage message = new MimeMessage(session);
         message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
         message.setSubject(sub);
         //message.setText(msg);
         message.setContent(msg,"text/html");
         //send message
         Transport.send(message);
         System.out.println("message sent successfully");
      } catch (Exception e) {
        
         System.out.println("Errrr: "+e.getCause());
         System.out.println("Errrr: "+e.getMessage());
         System.out.println("Errrr: "+e.getMessage());
          throw new RuntimeException(e);
      }
      
   }
}
public class Email{
   public static void main(String[] args) {
      //from,password,to,subject,message
      String message = "<h1>Welcome to Kine-App</h1>";
      message += "<p>Form more information you can contact me from <a href='mailto:amine.laghlabi@gmail.com'>Here</a></p>";
      Mailer.send("aminelaghlabi56@gmail.com","741cafare56","amine.laghlabi@gmail.com","kineApp",message);
   }
}   