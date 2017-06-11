package com.psl.service;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.psl.dao.DataManager;
import com.psl.dao.DataManagerImpl;
import com.psl.model.Product;

public class ProductService {

	private DataManager dao;

	public DataManager getDao() {
		return dao;
	}

	public void setDao(DataManager dao) {
		this.dao = dao;
	}
	
	public ProductService(){
		
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("config.xml");
		DataManagerImpl dataManagerImpl = applicationContext.getBean("dao",DataManagerImpl.class);
		this.dao=dataManagerImpl;
	}
	
	
	public void addproduct(Product product)
	{
		System.out.println("In product service");
		dao.addProduct(product);
	}
	public boolean deleteProduct(String	productName) {
		return dao.deleteProduct(productName);
	}
	public List<Product> getproducts()
	{
		System.out.println("In product service");
		List<Product> list=dao.getProducts();
		return list;
		
	}
	public Product getProductbyProductName(String productName){
		System.out.println("In product service");
		
		return dao.getProductbyProductName(productName);
		
	}
	public List<Product> getProductsBySection(String section) {
		return dao.getProductsBySection(section);
		
	}
	public boolean updateQuantity(Product product, int quantity) {
		return dao.updateQuantity(product, quantity);
	}
}
