package com.icia.sweethome.model;

import java.io.Serializable;

public class OrderComplete implements Serializable
{

	private static final long serialVersionUID = 1L;
	
	private int productIdk; 
	private String productCode; 
	private String productName; 
	private int productPrice; 
	private String productBrandName;
	private String productDescription;
	private String productFileExt;
	private String productStatus;
	private int quantity; 
	private int orderDetailIdk; 
	private int orderIdk; 
	private String reviewStatus;
	
	//private Order order;
	//private List<OrderDetail> orderList;
	//private Pay pay;
	
	
	
	 OrderComplete()
	 {
		 productIdk = 0; 
		 productCode = ""; 
	     productName = "";
         productPrice = 0;  
         productBrandName = "";
         productDescription = "";
         productFileExt = "";
         productStatus = "";
         quantity = 0;  
         orderDetailIdk = 0;  
         orderIdk = 0;
         reviewStatus = ""; 
	 }


	public int getProductIdk() {
		return productIdk;
	}


	public void setProductIdk(int productIdk) {
		this.productIdk = productIdk;
	}


	public String getProductCode() {
		return productCode;
	}


	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public String getProductBrandName() {
		return productBrandName;
	}


	public void setProductBrandName(String productBrandName) {
		this.productBrandName = productBrandName;
	}


	public String getProductDescription() {
		return productDescription;
	}


	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}


	public String getProductFileExt() {
		return productFileExt;
	}


	public void setProductFileExt(String productFileExt) {
		this.productFileExt = productFileExt;
	}


	public String getProductStatus() {
		return productStatus;
	}


	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public int getOrderDetailIdk() {
		return orderDetailIdk;
	}


	public void setOrderDetailIdk(int orderDetailIdk) {
		this.orderDetailIdk = orderDetailIdk;
	}


	public int getOrderIdk() {
		return orderIdk;
	}


	public void setOrderIdk(int orderIdk) {
		this.orderIdk = orderIdk;
	}


	public String getReviewStatus() {
		return reviewStatus;
	}


	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
	 
}
