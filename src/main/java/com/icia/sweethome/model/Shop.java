package com.icia.sweethome.model;

import java.io.Serializable;

public class Shop implements Serializable
{		
	
	private static final long serialVersionUID = 1L;
	
	
	private int productIdk;
	private String shopTabCode;
	private String shopDetailTabCode;
	private String productCode;
	private String sellerId;
	private String productName;
	private int productPrice;
	private String productBrandName;
	private String productDescription;
	private String productFileExt;
	private String productStatus;
	private String regDate;
	private int productViews;
	
	private int quantity;
	private int finalPrice;
	private String cartRegDate;
	
	private String orderBy;
	
	private int startRow;
	private int endRow;
	
	private String shopTabName; //A 가구, B 가전, C 잡화
	private String shopDetailTabName;
	
	private String searchType;		//검색타입 1이름, 2 제목 3. 내용 
	private String searchValue;			//검색값

	public Shop()
	{
		productIdk =0;
		shopTabCode ="";
		shopDetailTabCode ="";
		productCode ="";
		sellerId ="";
		productName="";
		productPrice=0;
		productBrandName ="";
		productDescription ="";					
		productFileExt="";
		productStatus="Y";
		regDate="";
		productViews = 0;
		
		quantity = 0;
		finalPrice = 0;
		cartRegDate="";
		
		startRow = 0;
		endRow = 0;
		
		shopTabName = "";
		shopDetailTabName = "";
		
		searchType = "";
		searchValue="";
		
		orderBy = "";
		
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

	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public int getProductIdk() {
		return productIdk;
	}

	public void setProductIdk(int productIdk) {
		this.productIdk = productIdk;
	}

	public String getShopTabCode() {
		return shopTabCode;
	}

	public void setShopTabCode(String shopTabCode) {
		this.shopTabCode = shopTabCode;
	}

	public String getShopDetailTabCode() {
		return shopDetailTabCode;
	}

	public void setShopDetailTabCode(String shopDetailTabCode) {
		this.shopDetailTabCode = shopDetailTabCode;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
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

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getProductViews() {
		return productViews;
	}

	public void setProductViews(int productViews) {
		this.productViews = productViews;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
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

	public String getShopTabName() {
		return shopTabName;
	}

	public void setShopTabName(String shopTabName) {
		this.shopTabName = shopTabName;
	}

	public String getShopDetailTabName() {
		return shopDetailTabName;
	}

	public void setShopDetailTabName(String shopDetailTabName) {
		this.shopDetailTabName = shopDetailTabName;
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