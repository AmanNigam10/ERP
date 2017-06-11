package com.psl.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.psl.dao.DataManager;
import com.psl.dao.DataManagerImpl;
import com.psl.model.Customer;
import com.psl.service.CustomerService;

/**
 * Servlet implementation class ChangePassword
 */
@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();
		CustomerService cust_service = new CustomerService();
		Customer customer = (Customer)httpSession.getAttribute("customer");
		String currentPassword = request.getParameter("currentPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		
		if(customer.getPassword().equals(currentPassword))
		{
			cust_service.resetPassword(customer, confirmPassword);
			response.sendRedirect("index.jsp");
		}
		else
		{
			PrintWriter printWrite1r = response.getWriter();
			printWrite1r.println("Try again");
		}
	}

}
