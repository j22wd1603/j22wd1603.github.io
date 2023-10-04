package com.icia.sweethome.model;

import java.io.Serializable;

public class Review implements Serializable
{      
   private static final long serialVersionUID = 1L;

   private int reviewIdk;
   private int productIdk;
   private int orderIdk;
   private String userId;
   private String reviewContent;
   private String regDate;
   private String productName;
   private int rating;
   
   private int startRow;
   private int endRow;
   
   public Review() 
   {
      reviewIdk=0;
      productIdk =0;
      orderIdk=0;
      userId="";
      reviewContent="";
      regDate="";
      productName = "";
      rating = 0;
      startRow = 0;
      endRow = 0;
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

public String getProductName() {
	   return productName;
   }
	
   public void setProductName(String productName) {
	   this.productName = productName;
   }

	public int getReviewIdk() {
      return reviewIdk;
   }

   public void setReviewIdk(int reviewIdk) {
      this.reviewIdk = reviewIdk;
   }

   public int getProductIdk() {
      return productIdk;
   }

   public void setProductIdk(int productIdk) {
      this.productIdk = productIdk;
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

   public String getReviewContent() {
      return reviewContent;
   }

   public void setReviewContent(String reviewContent) {
      this.reviewContent = reviewContent;
   }

   public String getRegDate() {
      return regDate;
   }

   public void setRegDate(String regDate) {
      this.regDate = regDate;
   }
	
	public int getRating() {
		return rating;
	}
	
	public void setRating(int rating) {
		this.rating = rating;
	}
   
   
   
}