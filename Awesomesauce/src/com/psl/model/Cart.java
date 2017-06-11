package com.psl.model;

import java.io.Serializable;

//import org.hibernate.validator.constraints.Email;

public class Cart implements Serializable {

	//@Email
	private String email;
	
	private int productId;
	private String productName;
	private int quantityPurchased;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getQuantityPurchased() {
		return quantityPurchased;
	}
	public void setQuantityPurchased(int quantityPurchased) {
		this.quantityPurchased = quantityPurchased;
	}
	
	
	
}
