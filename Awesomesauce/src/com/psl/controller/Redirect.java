package com.psl.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.psl.model.Customer;
import com.psl.service.Authentication;

/**
 * Servlet implementation class Redirect
 */
@WebServlet("/Redirect")
public class Redirect extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		Authentication authentication = new Authentication();
		Customer customer = authentication.authenticateCustomer(request.getParameter("email"), request.getParameter("password"));
		if(request.getParameter("email").equals("admin@gmail.com")&&request.getParameter("password").equals("admin1234"))
		{
			response.sendRedirect("admin.jsp");
		}
		
		else if(customer!=null)
		{	
			HttpSession session = request.getSession();
			session.setAttribute("customer", customer);
			
			response.sendRedirect("index.jsp");
		}
		else
		{
			response.sendRedirect("landing.jsp");
		}
		
	}

}
