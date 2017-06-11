package com.psl.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.psl.model.Customer;

public class sendMail {

	public boolean sendEmail(String toEmail ,String subject ,String message ,String fromEmail,String username,String password)
    {
    	Properties properties = System.getProperties();
    	
    	properties.put("mail.smtp.starttls.enable", "true");
    	properties.put("mail.smtp.host", "smtp.gmail.com");
    	properties.put("mail.smtp.auth", "true");
    	properties.put("mail.smtp.port", "465");
    	properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    	properties.put("mail.smtp.socketFactory.port", "465");
    	properties.put("mail.smtp.socketFactory.fallback","false");
    	
    	Session mailSession = Session.getDefaultInstance(properties,null);
    	mailSession.setDebug(true);
    	
    	Message mailMessage = new MimeMessage(mailSession);
    	
    	try {
			mailMessage.setFrom(new InternetAddress(fromEmail));
			mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));			
			mailMessage.setSubject(subject);
			
			Transport transport = mailSession.getTransport("smtp");
			transport.connect("smtp.gmail.com", username, password);
			
			//Add Message Body
			BodyPart messageBodyPart = new MimeBodyPart();  
		    messageBodyPart.setText(message);  
			Multipart multipart = new MimeMultipart();  
		    multipart.addBodyPart(messageBodyPart);  
		    mailMessage.setContent(multipart);
		    
		    //Send
			transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
			transport.close();
			return true;
			
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return false;

    }
	
	public boolean sendEmailwithPdf(String toEmail ,String subject ,String message ,String fromEmail,
			String username,String password,Customer customer, String path)
    {
		SimpleDateFormat dateFormat = new SimpleDateFormat("ddMMyyyyHHmm");
		Calendar cal = Calendar.getInstance();
		String date = dateFormat.format(cal.getTime());
    	Properties properties = System.getProperties();
    	
    	properties.put("mail.smtp.starttls.enable", "true");
    	properties.put("mail.smtp.host", "smtp.gmail.com");
    	properties.put("mail.smtp.auth", "true");
    	properties.put("mail.smtp.port", "465");
    	properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    	properties.put("mail.smtp.socketFactory.port", "465");
    	properties.put("mail.smtp.socketFactory.fallback","false");
    	
    	Session mailSession = Session.getDefaultInstance(properties,null);
    	mailSession.setDebug(true);
    	
    	Message mailMessage = new MimeMessage(mailSession);
    	
    	try {
			mailMessage.setFrom(new InternetAddress(fromEmail));
			mailMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));			
			mailMessage.setSubject(subject);
			
			Transport transport = mailSession.getTransport("smtp");
			transport.connect("smtp.gmail.com", username, password);
			
			    
		        
			BodyPart messageBodyPart1 = new MimeBodyPart();  
		    messageBodyPart1.setText(message);  
			      
		    //4) create new MimeBodyPart object and set DataHandler object to this object      
		    MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
			  
		    String filename = path;//change accordingly  
			DataSource source = new FileDataSource(filename+customer.getFirstName()+"_"+customer.getLastName()+"_"+date+".pdf");  
			messageBodyPart2.setDataHandler(new DataHandler(source));  
			messageBodyPart2.setFileName(customer.getFirstName()+"_"+date+".pdf");  
				     
				     
			//5) create Multipart object and add MimeBodyPart objects to this object      
		    Multipart multipart = new MimeMultipart();  
		    multipart.addBodyPart(messageBodyPart1);
		    multipart.addBodyPart(messageBodyPart2);
				  
		    //6) set the multiplart object to the message object  
		    mailMessage.setContent(multipart);  
				     
		    //7) send message  
			transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
			transport.close();
			return true;
			
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return false;

    }
	/*public static void main(String[] args) {
		
		System.out.println(new sendMail().sendEmail("abhishek_ingale@persistent.com", "Hello AwesomeSauce", "How you guys are doing?", "weawesomesauce@gmail.com", "weawesomesauce", "gadgetfloor1234"));
	}
	*/
	/*;supriya_jadhav@persistent.com;pratik_abhyankar@persistent.com;raseeka_barsawade@persistent.com;abhishek_ingale@persistent.com*/
}


