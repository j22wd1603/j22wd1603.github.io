package com.icia.sweethome.model;

import java.io.Serializable;
import java.util.List;

public class Order implements Serializable {

	private static final long serialVersionUID = 1L;
	
	int orderIdk;
	String userId;
	String redemCode;
	String payStatus;
	String deliveryStatus;
	String deliveryName;
	String deliveryAddress;
	String deliveryPhone;
	String deliveryContent;
	int totalPrice;
	int couponDiscountPrice;
	int actualPrice;
	String orderDate;
	
	private int startRow;
	private int endRow;
	
	Coupon coupon;
	private List<OrderDetail> orderDetailList ;
	
	public Order() {
		
		orderIdk = 0;
		userId = "";
		redemCode = "";
		payStatus = "N";
		deliveryName = "";
		deliveryStatus = "N";
		deliveryAddress = "";
		deliveryPhone = "";
		deliveryContent = "";
		totalPrice = 0;
		couponDiscountPrice = 0;
		actualPrice = 0;
		orderDate = "";
		startRow = 0;
		endRow = 0;
		
		coupon = null;
		orderDetailList = null;
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


	public int getOrderIdk() {
		return orderIdk;
	}

	public void setOrderIdk(int orderIdk) {
		this.orderIdk = orderIdk;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRedemCode() {
		return redemCode;
	}

	public void orderDetailIdk(String redemCode) {
		this.redemCode = redemCode;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getDeliveryName() {
		return deliveryName;
	}

	public void setDeliveryName(String deliveryName) {
		this.deliveryName = deliveryName;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public String getDeliveryPhone() {
		return deliveryPhone;
	}

	public void setDeliveryPhone(String deliveryPhone) {
		this.deliveryPhone = deliveryPhone;
	}

	public String getDeliveryContent() {
		return deliveryContent;
	}

	public void setDeliveryContent(String deliveryContent) {
		this.deliveryContent = deliveryContent;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getCouponDiscountPrice() {
		return couponDiscountPrice;
	}

	public void setCouponDiscountPrice(int couponDiscountPrice) {
		this.couponDiscountPrice = couponDiscountPrice;
	}

	public int getActualPrice() {
		return actualPrice;
	}

	public void setActualPrice(int actualPrice) {
		this.actualPrice = actualPrice;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public Coupon getCoupon() {
		return coupon;
	}

	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}

	public List<OrderDetail> getOrderDetailList() {
		return orderDetailList;
	}

	public void setOrderDetailList(List<OrderDetail> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}

	public void setRedemCode(String redemCode2) {
		// TODO Auto-generated method stub
		
	}

	public void setProductBrandName(String productBrandName) {
		// TODO Auto-generated method stub
		
	}

}
