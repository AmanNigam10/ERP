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
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		DataManager dataManager = new DataManagerImpl();
		Product product = new Product();
		product.setProdcutName(request.getParameter("pname"));
		product.setSection(request.getParameter("section"));
		product.setPrice(Float.parseFloat(request.getParameter("price")));
		product.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		product.setImage(request.getParameter("imagePath"));
		dataManager.addProduct(product);
		response.sendRedirect("admin.jsp");
		
		
	}

}
