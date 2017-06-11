package com.psl.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.psl.model.Customer;

/**
 * Servlet implementation class SessionInvalidate
 */
@WebServlet("/SessionInvalidate")
public class SessionInvalidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Customer customer = (Customer) session.getAttribute("customer");
		if(customer!=null)
		{
			response.setHeader("Cache-Control","no-cache");
			response.setHeader("Cache-Control","no-store");
			response.setHeader("Pragma","no-cache");
			response.setDateHeader ("Expires", 0);
			session.invalidate();
			response.sendRedirect("landing.jsp");
		}
		else
		{
			response.sendRedirect("landing.jsp");
			
		}
	}

}
