package com.psl.service;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.psl.dao.DataManager;
import com.psl.dao.*;
import com.psl.model.Customer;
import com.psl.model.Users;

public class Authentication {

	
	
	private DataManager dao;
	
	public DataManager getDao() {
		return dao;
	}

	public void setDao(DataManager dao) {
		this.dao = dao;
	}
	
	public Authentication() {
		
		//ApplicationContext applicationContext = new ClassPathXmlApplicationContext("config.xml");
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("config.xml");
		DataManagerImpl dataManagerImpl = applicationContext.getBean("dao", DataManagerImpl.class);
		this.dao=dataManagerImpl;
	}
	
	
	public Customer authenticateCustomer(String email, String password)
	{
		
		List<Users> listOfUsers = dao.getUsers();
		List<Customer> customers = dao.getCustomers();
		for (Customer customer : customers) {
			
			System.out.println(customer.getPassword());
		}
		for (Users users : listOfUsers) {
			
			if(users.getUserName().equals(email) && users.getPassword().equals(password))
			{
				for (Customer customer : customers) {
					
					if(customer.getEmail().equals(users.getUserName()))
					{
						
						return customer;
					}
				}
				
			}
		}
		return null;
			
	}
}