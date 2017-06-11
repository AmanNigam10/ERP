package com.psl.service;

import java.util.List;

import com.psl.dao.DataManager;
import com.psl.model.Cart;
import com.psl.model.Customer;

public class CartService {
	private DataManager dao;

	public DataManager getDao() {
		return dao;
	}

	public void setDao(DataManager dao) {
		this.dao = dao;
	}
	
	
	
	public void addtoCart(Cart cart)
	{
		System.out.println("In cart services");
		dao.addToCart(cart);
	}
	public List<Cart> getCartDetails(Customer customer) {
		List<Cart> list=dao.getCartDetails(customer);
		return list;
		
	}
	public boolean deleteCartEntry(Customer customer) {
		return dao.deleteCartEntry(customer);
	}
	public boolean deleteProdcutfromCart(Customer customer, String productName)
	{
		return dao.deleteProdcutfromCart(customer,productName);
	}
	
	public boolean updateCartQuantity(Customer customer,String pname,int quantity){
		return dao.updateCartQuantity(customer, pname, quantity);
	}

}
