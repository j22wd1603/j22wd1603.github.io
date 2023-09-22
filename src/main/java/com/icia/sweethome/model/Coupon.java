package com.icia.sweethome.model;

import java.io.Serializable;

public class Coupon implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	String redemCode;
	int couponDiscount;
	String couponContent;
	String couponStatus;
	
	//coupon use
	String userId;
	int orderIdk;
	int couponDiscountPrice;
	String useDate;
	
	public Coupon(){
		redemCode = "";
		couponDiscount = 0;
		couponContent = "";
		couponStatus = "N";
		
		userId = "";
		orderIdk = 0;
		couponDiscountPrice = 0;
		useDate = "";
	}

	public String getRedemCode() {
		return redemCode;
	}

	public void setRedemCode(String redemCode) {
		this.redemCode = redemCode;
	}

	public int getCouponDiscount() {
		return couponDiscount;
	}

	public void setCouponDiscount(int couponDiscount) {
		this.couponDiscount = couponDiscount;
	}

	public String getCouponContent() {
		return couponContent;
	}

	public void setCouponContent(String couponContent) {
		this.couponContent = couponContent;
	}

	public String getCouponStatus() {
		return couponStatus;
	}

	public void setCouponStatus(String couponStatus) {
		this.couponStatus = couponStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getOrderIdk() {
		return orderIdk;
	}

	public void setOrderIdk(int orderIdk) {
		this.orderIdk = orderIdk;
	}

	public int getCouponDiscountPrice() {
		return couponDiscountPrice;
	}

	public void setCouponDiscountPrice(int couponDiscountPrice) {
		this.couponDiscountPrice = couponDiscountPrice;
	}

	public String getUseDate() {
		return useDate;
	}

	public void setUseDate(String useDate) {
		this.useDate = useDate;
	}

}
