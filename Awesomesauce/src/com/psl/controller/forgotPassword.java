package com.psl.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class forgotPassword
 */
@WebServlet("/forgotPassword")
public class forgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				
		HttpSession httpSession = request.getSession();
		String answer = (String) httpSession.getAttribute("correctAnswer");
		String useranswer = request.getParameter("answer");
		
		if(answer.equalsIgnoreCase(useranswer))
		{
			response.sendRedirect("resetPassword.jsp");
		}
		else
		{
			response.sendRedirect("landing.jsp");
		}
		
	}

}
