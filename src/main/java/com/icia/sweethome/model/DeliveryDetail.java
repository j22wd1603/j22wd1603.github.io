package com.icia.sweethome.model;

import java.io.Serializable;

public class DeliveryDetail implements Serializable {

	private static final long serialVersionUID = 1L;
	
    private int orderDetailIdk;
    private int orderIdk;
    private int productIdk;
    private String productName;
    private String productBrandName;
    private int productPrice;
    private int quantity;
    private String productCode;
    private String productFileExt;
    
    public DeliveryDetail() {
        orderDetailIdk = 0;
        orderIdk = 0;
        productIdk = 0;
        productName = "";
        productBrandName = "";
        productPrice = 0;
        quantity = 0;
        productCode = "";
        productFileExt = "";
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


	public int getProductIdk() {
		return productIdk;
	}


	public void setProductIdk(int productIdk) {
		this.productIdk = productIdk;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getProductBrandName() {
		return productBrandName;
	}


	public void setProductBrandName(String productBrandName) {
		this.productBrandName = productBrandName;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
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

}
