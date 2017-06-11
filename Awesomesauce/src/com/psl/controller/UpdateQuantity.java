package com.psl.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.psl.dao.DataManager;
import com.psl.dao.DataManagerImpl;
import com.psl.model.Product;

/**
 * Servlet implementation class UpdateQuantity
 */
@WebServlet("/UpdateQuantity")
public class UpdateQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		DataManager dataManager = new DataManagerImpl();
		String pname=request.getParameter("pname");
		String quantity=request.getParameter("quantity");
		Product product = dataManager.getProductbyProductName(pname);
		
		dataManager.updateQuantity(product, Integer.parseInt(quantity));
		
		response.sendRedirect("admin.jsp");
	}

}
