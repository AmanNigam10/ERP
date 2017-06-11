package com.psl.dao;

import java.sql.Date;
import java.util.List;

import com.psl.model.Bill;
import com.psl.model.Cart;
import com.psl.model.Customer;
import com.psl.model.Product;
import com.psl.model.Users;

public interface DataManager {
	
	public boolean register(Customer customer);
	public List<Product> getProducts();
	public List<Product> getProductsBySection(String section);
	public Product getProductbyProductName(String productName);
	public boolean addToCart(Cart cart);
	public List<Cart> getCartDetails(Customer customer);
	public boolean setBill(Bill bill);
	public boolean deleteCartEntry(Customer customer);
	public boolean updateCartQuantity(Customer customer,String pname,int quantity);
	
	
	public List<Customer> getCustomers();
	
		
	public String getSecurityQuestion(Customer customer);
	
	public boolean checkSecurityAns(Customer customer, String answer);
	
	public boolean resetPassword(Customer customer ,String newPassword);
	public Date getBill(long billID);
	
	//Admin
	public boolean addProduct(Product product);
	
	public boolean deleteProduct(String pname);
	public boolean updateQuantity(Product product,int quantiyty);
	public List<Users> getUsers();
	public boolean deleteProdcutfromCart(Customer customer, String productName);                    
	                        
	
	
}
