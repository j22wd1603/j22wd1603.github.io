package com.icia.sweethome.model;

import java.io.Serializable;

public class Seller implements Serializable{

	private static final long serialVersionUID = 1L;
	
	String sellerId;
	String sellerPwd;
	String sellerName;
	String sellerPhone;
	String sellerStatus;
	String regDate;
	String shopTabCode;
	String deleteDate;
	
	public Seller() {
		sellerId = "";
		sellerPwd = "";
		sellerName = "";
		sellerPhone = "";
		sellerStatus = "Y";
		regDate = "";
		shopTabCode ="";
		deleteDate = "";
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getSellerPwd() {
		return sellerPwd;
	}

	public void setSellerPwd(String sellerPwd) {
		this.sellerPwd = sellerPwd;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getSellerPhone() {
		return sellerPhone;
	}

	public void setSellerPhone(String sellerPhone) {
		this.sellerPhone = sellerPhone;
	}

	public String getSellerStatus() {
		return sellerStatus;
	}

	public void setSellerStatus(String sellerStatus) {
		this.sellerStatus = sellerStatus;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getShopTabCode() {
		return shopTabCode;
	}

	public void setShopTabCode(String shopTabCode) {
		this.shopTabCode = shopTabCode;
	}

	public String getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
}
