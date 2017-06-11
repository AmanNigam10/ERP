package com.psl.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psl.service.sendMail;

/**
 * Servlet implementation class MailDispatcher
 */
@WebServlet("/MailDispatcher")
public class MailDispatcher extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4779138315399659702L;
	
	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		sendMail mail = new sendMail();
		String toEmail = "amannigam0108@gmail.com";
		String customerName = request.getParameter("firstName");
		String customerEmail = request.getParameter("email");
		
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		String finalMessage = "Customer Name: "+customerName+"\n"+
				"Customer Email id: "+customerEmail+"\n"
				+"Message: "+message;
		
		String fromEmail = "weawesomesauce@gmail.com";
		String username = "weawesomesauce";
		String password = "gadgetfloor1234";
		
		
		mail.sendEmail(toEmail, subject, finalMessage, fromEmail, username, password);
		
		response.sendRedirect("index.jsp");
		
	}

}
