package com.icia.sweethome.model;

import java.io.Serializable;


public class Cart implements Serializable
{		
	private static final long serialVersionUID = 1L;

	private String userId;
	private int productIdk;
	private int quantity;
	private String cartRegDate;
	private int finalPrice;
	
	private String productBrandName;
	private String productName;
	private String productFileExt;
	private String productCode;
	private int productPrice;
	
	private int startRow;
	private int endRow;

	
	public Cart()
	{
		userId="";
		productIdk=0;
		quantity=0;
		cartRegDate="";
		finalPrice=0;
		
		startRow = 0;
		endRow = 0;
		
		
		productBrandName = "";
		productName="";
		productFileExt = "";
		productCode="";
		productPrice = 0;
	}





	public int getProductPrice() {
		return productPrice;
	}



	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}



	public String getProductCode() {
		return productCode;
	}





	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}





	public String getProductFileExt() {
		return productFileExt;
	}



	public void setProductFileExt(String productFileExt) {
		this.productFileExt = productFileExt;
	}



	public String getProductBrandName() {
		return productBrandName;
	}



	public void setProductBrandName(String productBrandName) {
		this.productBrandName = productBrandName;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public int getStartRow() {
		return startRow;
	}


	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}


	public int getEndRow() {
		return endRow;
	}


	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getProductIdk() {
		return productIdk;
	}


	public void setProductIdk(int productIdk) {
		this.productIdk = productIdk;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public String getCartRegDate() {
		return cartRegDate;
	}


	public void setCartRegDate(String cartRegDate) {
		this.cartRegDate = cartRegDate;
	}


	public int getFinalPrice() {
		return finalPrice;
	}


	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}


	
}