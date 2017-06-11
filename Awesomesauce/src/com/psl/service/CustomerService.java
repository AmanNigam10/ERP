package com.psl.service;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.psl.dao.DataManager;
import com.psl.dao.*;
import com.psl.model.Cart;
import com.psl.model.Customer;
import com.psl.model.Product;

public class CustomerService {

	private DataManager dao;
	
	public DataManager getDao() {
		return dao;
	}

	public void setDao(DataManager dao) {
		this.dao = dao;
	}

	public CustomerService() {
		
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("config.xml");
		DataManagerImpl dataManagerImpl = applicationContext.getBean("dao",DataManagerImpl.class);
		this.dao=dataManagerImpl;
	}
	
	public void register(Customer customer)
	{
		System.out.println("In customer service");
		dao.register(customer);
	}
	
	public List<Customer> getCustomers(){
		System.out.println("In customer service");
		List<Customer> list=dao.getCustomers();
		return list;
		
	}
	public String getSecurityQuestion(Customer customer) {
		return dao.getSecurityQuestion(customer);
	}
	public boolean checkSecurityAns(Customer customer, String answer) {
		return dao.checkSecurityAns(customer, answer);
	}
	public boolean resetPassword(Customer customer, String newPassword) {
		return dao.resetPassword(customer, newPassword);
	}
	
	
	public List<Product> viewProductsBySection(String section)
	{
		return dao.getProductsBySection(section);
	}
	
	public List<Product> viewProducts()
	{
		return dao.getProducts();
	}
	
	public List<Cart> getMyCart(Customer customer)
	{
		return dao.getCartDetails(customer);
	}
	
	public boolean addToMyCart(Product product, Customer customer, int quantity)
	{
		
		boolean status = false;
		Cart cart = new Cart();
		cart.setEmail(customer.getEmail());
		cart.setProductId(product.getProductId());
		cart.setProductName(product.getProdcutName());
		cart.setQuantityPurchased(quantity);
		
		status = dao.addToCart(cart);
		return status;
	}
	
	public void generateBill(Customer customer)
	{
		List<Cart> cart = dao.getCartDetails(customer);
		BufferedWriter bw =null;
		float sum=0f;		
		Calendar c = Calendar.getInstance();
    	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String date= sdf.format(c.getTime());
        
        try 
        {
			bw = new BufferedWriter(new FileWriter("Purchase_Details", true));
			bw.write(customer.getFirstName()+" "+customer.getLastName()+" "+customer.getEmail()+" "+date);
			for (Cart cart2 : cart) {
				
				bw.write("\t"+cart2.getProductName()+" "+cart2.getQuantityPurchased()+" ");
				Product product = dao.getProductbyProductName(cart2.getProductName());
				sum += product.getPrice() * cart2.getQuantityPurchased();
			}
			bw.write("Total Amount: "+sum);
			bw.write("********************************************************************************************\n\n");	
			dao.deleteCartEntry(customer);
		} 
        catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public String trackOrder(long billID)
	{
		ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
		BillService bill_service = context.getBean("bill_service",BillService.class);  
		String orderStatus = null;
		
		Date billDate = bill_service.getBill(billID);
		Calendar cal = Calendar.getInstance();
		cal.setTime(billDate);
		Calendar todaysDate = Calendar.getInstance();
		if(todaysDate.get(Calendar.DATE)==cal.get(Calendar.DATE))
		{
		
			orderStatus = "Your order will be dispatched in next 48 hours!";
		}
		else if(cal.before(todaysDate))
		{
		
			orderStatus = "Your order has been dispatched!";
		}
		else
		{
			orderStatus = "Package has been delivered.";
	
		}
		return orderStatus;
	}
}
