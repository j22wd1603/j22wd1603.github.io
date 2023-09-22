package com.icia.sweethome.model;

import java.io.Serializable;

public class OrderDetail implements Serializable {
   
   private static final long serialVersionUID = 1L;
   
   int orderDetailIdk;
   int orderIdk;
   int productIdk;
   int quantity;
   int productPrice;
   String reviewStatus;
   
   String productName;
   String productCode;
   String productFileExt;

   
   public OrderDetail() {
      orderDetailIdk = 0;
      orderIdk = 0;
      productIdk = 0;
      quantity = 0;
      productPrice = 0;
      reviewStatus ="N";
      productName = "";
      productCode = "";
      productFileExt = "";
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


   public String getProductFileExt() {
      return productFileExt;
   }


   public void setProductFileExt(String productFileExt) {
      this.productFileExt = productFileExt;
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

   public int getQuantity() {
      return quantity;
   }

   public void setQuantity(int quantity) {
      this.quantity = quantity;
   }

   public int getProductPrice() {
      return productPrice;
   }

   public void setProductPrice(int productPrice) {
      this.productPrice = productPrice;
   }

   public String getReviewStatus() {
      return reviewStatus;
   }

   public void setReviewStatus(String reviewStatus) {
      this.reviewStatus = reviewStatus;
   }

}