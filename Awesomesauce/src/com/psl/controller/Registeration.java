package com.psl.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psl.dao.DataManager;
import com.psl.dao.DataManagerImpl;
import com.psl.model.Customer;
import com.psl.service.CustomerService;

/**
 * Servlet implementation class Registeration
 */
@WebServlet("/Registeration")
public class Registeration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Customer customer = new Customer();
		CustomerService custService = new CustomerService();

		customer.setFirstName(request.getParameter("firstName"));
		customer.setLastName(request.getParameter("lastName"));
		customer.setEmail(request.getParameter("email"));
		customer.setPassword(request.getParameter("confirmPassword"));
		customer.setAddress(request.getParameter("address"));
		customer.setContactNo(Long.parseLong(request.getParameter("contact")));
		customer.setSecurityQues(request.getParameter("securityQue"));
		customer.setSecurityAns(request.getParameter("securityAns"));
		
		custService.register(customer);
		
		response.sendRedirect("landing.jsp");
		
		
		
	}

}
