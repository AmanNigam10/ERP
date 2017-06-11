package com.psl.model;



public class Product {

	private int productId;
	private String prodcutName;
	private String section;
	private float price;
	private int quantity;
	private String image;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProdcutName() {
		return prodcutName;
	}
	public void setProdcutName(String prodcutName) {
		this.prodcutName = prodcutName;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getImage() {
		return image;
	}
	public String setImage(String image) {
		return this.image = image;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", prodcutName="
				+ prodcutName + ", section=" + section + ", price=" + price
				+ ", quantity=" + quantity + ", image=" + image + "]";
	}
	
	
	
}
