package com.icia.sweethome.model;

import java.io.Serializable;
import java.util.List;

public class Delivery implements Serializable {

	private static final long serialVersionUID = 1L;
	
    private int orderIdk;
    private String redemCode;
    private String userId;
    private String userName;
    private String userEmail;
    private String userPhone;
    private String userAddress;
    private String imageFileExists;
    private String imageFileExt;
    private String deliveryName;
    private String deliveryAddress;
    private String deliveryPhone;
    private String deliveryContent;
    private int totalPrice;
    private int couponDiscountPrice;
    private int actualPrice;
    private String payMethodType;
    private String payStatus;
    private String deliveryStatus;
    private String approvedDate;
    private String orderDate;
    
    private String sellerId;
    private String productName;
    private String productBrandName;
	
	private List<DeliveryDetail> deliveryList;
	private Coupon coupon;
	
	private int startRow;
	private int endRow;
	
	private String searchType;
	private String searchValue;
    
    public Delivery() {
    	orderIdk = 0;
        redemCode = "";
        userId = "";
        userName = "";
        userEmail = "";
        userPhone = "";
        userAddress = "";
        imageFileExists = "";
        imageFileExt = "";
        deliveryName = "";
        deliveryAddress = "";
        deliveryPhone = "";
        deliveryContent = "";
        totalPrice = 0;
        couponDiscountPrice = 0;
        actualPrice = 0;
        payMethodType = "";
        payStatus = "";
        deliveryStatus = "";
        approvedDate = "";
        orderDate = "";
        
        sellerId = "";
        productName ="";
        productBrandName ="";

    	deliveryList=null;
    	coupon=null;
    	
		startRow = 0;
		endRow = 0;
		
		searchType="";
		searchValue="";
    }

	public int getOrderIdk() {
		return orderIdk;
	}

	public void setOrderIdk(int orderIdk) {
		this.orderIdk = orderIdk;
	}

	public String getRedemCode() {
		return redemCode;
	}

	public void setRedemCode(String redemCode) {
		this.redemCode = redemCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getImageFileExists() {
		return imageFileExists;
	}

	public void setImageFileExists(String imageFileExists) {
		this.imageFileExists = imageFileExists;
	}

	public String getImageFileExt() {
		return imageFileExt;
	}

	public void setImageFileExt(String imageFileExt) {
		this.imageFileExt = imageFileExt;
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

	public String getPayMethodType() {
		return payMethodType;
	}

	public void setPayMethodType(String payMethodType) {
		this.payMethodType = payMethodType;
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

	public String getApprovedDate() {
		return approvedDate;
	}

	public void setApprovedDate(String approvedDate) {
		this.approvedDate = approvedDate;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
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

	public List<DeliveryDetail> getDeliveryList() {
		return deliveryList;
	}

	public void setDeliveryList(List<DeliveryDetail> deliveryList) {
		this.deliveryList = deliveryList;
	}

	public Coupon getCoupon() {
		return coupon;
	}

	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
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

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

}
