package com.psl.model;

import java.sql.Date;

public class Bill {

	long billID;
	//@Email
	private String email;
	
	private double amount;
	private Date date;
	
	public long getBillID() {
		return billID;
	}


	public void setBillID(long billID) {
		this.billID = billID;
	}
	
	
	public Bill() {
		// TODO Auto-generated constructor stub
	}
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
}
