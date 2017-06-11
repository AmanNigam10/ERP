package com.psl.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.psl.model.Customer;
import com.psl.service.CreatePdf;
import com.psl.service.CustomerService;

/**
 * Servlet implementation class BillGeneration
 */
@WebServlet("/BillGeneration")
public class BillGeneration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession httpSession = request.getSession();
		Customer customer = (Customer) httpSession.getAttribute("customer");
		CreatePdf createPdf = new CreatePdf();
		CustomerService customerService = new CustomerService();
		
		
		createPdf.generateBillPdf(customer);
		customerService.generateBill(customer);
		
		response.sendRedirect("index.jsp");
		
 	}
	
}


