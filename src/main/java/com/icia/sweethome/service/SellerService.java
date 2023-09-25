package com.icia.sweethome.service;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.icia.sweethome.dao.SellerDao;
import com.icia.sweethome.model.Coupon;
import com.icia.sweethome.model.Delivery;
import com.icia.sweethome.model.DeliveryDetail;
import com.icia.sweethome.model.Order;
import com.icia.sweethome.model.OrderComplete;
import com.icia.sweethome.model.OrderDetail;
import com.icia.sweethome.model.Pay;
import com.icia.sweethome.model.Seller;
import com.icia.sweethome.model.Shop;


@Service ("sellerService")
public class SellerService {
	
	private static Logger logger = LoggerFactory.getLogger(SellerService.class);
	
	@Autowired
	private SellerDao sellerDao;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public int orderInsert(Order order) {
		int count = 0;
		
		count = sellerDao.orderInsert(order);
		//현재 한건의 결제만 가능
		if(count > 0) {
			OrderDetail orderDetail = order.getOrderDetailList().get(0);
			sellerDao.orderDetailInsert(orderDetail);
		}
		
		Coupon coupon = order.getCoupon();
		
		if(coupon != null) {
			sellerDao.couponUseInsert(coupon);
		}
		
		return count;
	}
	public int orderSeqSelect() {
		return sellerDao.orderSeqSelect();
	}
	
	public Coupon couponSelect(String redemCode) {
		Coupon coupon= null;
		
		try {
			coupon = sellerDao.couponSelect(redemCode);
		}
		catch (Exception e) {
			logger.error("[SellerService] couponSelect Exception" , e);
		}
		
		return coupon;
	}
	
	public Order orderSelect(int orderIdk) {
		Order order= null;
		
		try {
			order = sellerDao.orderSelect(orderIdk);
		}
		catch (Exception e) {
			logger.error("[SellerService] orderSelect Exception" , e);
		}
		
		return order;
	}
	
	public int orderPayUpdate(int orderIdk) {
		int count = 0;
		
		try {
			count = sellerDao.orderPayUpdate(orderIdk);
		}
		catch (Exception e) {
			logger.error("[SellerService] orderPayUpdate Exception" , e);
		}
		
		return count;
	}
	
	public int payInsert(Pay pay) {
		int count = 0;
		
		try {
			count = sellerDao.payInsert(pay);
		}
		catch (Exception e) {
			logger.error("[SellerService] payInsert Exception" , e);
		}
		
		return count;
	}
	public List<OrderComplete> orderComplete(int orderIdk) {
		List<OrderComplete> list = null;
		//OrderDetail orderDetail = null;
		try
		{
			list = sellerDao.orderComplete(orderIdk);
			//orderDetail = sellerDao.reviewStatusUpdate(orderIdk);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] detailTabSelect Exception" , e);
		}
		return list;
	}
	
	public Pay orderPaySelect(int orderIdk){
		Pay pay = null;
		
		try
		{
			pay = sellerDao.orderPaySelect(orderIdk);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] productSelect Exception" , e);
		}
		return pay;
	}
	
//--------------------------------------------------------------	
	
	public Seller sellerSelect(String sellerId) {
		Seller seller = null;
		
		try
		{
			seller = sellerDao.sellerSelect(sellerId);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] sellerSelect Exception" , e);
		}
		return seller;
	}
	
	
	public Shop productSelect(int productIdk){
		Shop shop = null;
		
		try
		{
			shop = sellerDao.productSelect(productIdk);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] productSelect Exception" , e);
		}
		return shop;
	}
	
	public List<Shop> productList(Shop product) {
		List<Shop> list = null;
		
		try
		{
			list = sellerDao.productList(product);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] productList Exception" , e);
		}
		return list;
	}
	public int productListCount(Shop product) {
		int count = 0;
		
		try
		{
			count = sellerDao.productListCount(product);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] productListCount Exception" , e);
		}
		return count;
	}
	public List<String> noUseCoupon(String userId){
		List<String> list = null;
		
		try
		{
			list = sellerDao.noUseCoupon(userId);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] noUseCoupon Exception" , e);
		}
		return list;
		
	}

	public List<Shop> detailTabSelect(String tabCode) {
		List<Shop> detailTab = null;
		
		try
		{
			detailTab = sellerDao.detailTabSelect(tabCode);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] detailTabSelect Exception" , e);
		}
		return detailTab;
	}
	
	public List<Shop> tabSelect(String tabCode) {
		List<Shop> tab = null;
		
		try
		{
			tab = sellerDao.tabSelect(tabCode);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] tabSelect Exception" , e);
		}
		return tab;
	}
	
	public int productCodeSelect() {
		return sellerDao.productCodeSelect();	
	}
	
	public int productInsert(Shop product) {
		int count = 0;
		try
		{
			count = sellerDao.productInsert(product);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] productInsert Exception" , e);
		}
		return count;
	}
	
	public int productStatusUpdate(Shop product) {
		int count = 0;
		try
		{
			count = sellerDao.productStatusUpdate(product);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] productStatusUpdate Exception" , e);
		}
		return count;
	}
	
	public int productUpdate(Shop product) {
		int count = 0;
		try
		{
			count = sellerDao.productUpdate(product);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] productUpdate Exception" , e);
		}
		return count;
	}
	
	public int deliveryListCount(Delivery delivery) {
		int count = 0;
		
		try
		{
			count = sellerDao.deliveryListCount(delivery);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] deliveryListCount Exception" , e);
		}
		return count;
	}
	
	public List<Delivery> deliveryList(Delivery delivery){
		List<Delivery> list = null;
		try
		{
			list = sellerDao.deliveryList(delivery);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] deliveryList Exception" , e);
		}
		return list;
	}
	
	public List<DeliveryDetail> deliveryDetailSelect(DeliveryDetail deliveryDetia){
		List<DeliveryDetail> list = null;
		try
		{
			list = sellerDao.deliveryDetailSelect(deliveryDetia);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] deliveryList Exception" , e);
		}
		return list;
		
	}
	
	public int deliveryStatusUpdate(Order order) {
		int count = 0;
		
		try
		{
			count = sellerDao.deliveryStatusUpdate(order);
		}
		catch(Exception  e)
		{
			logger.error("[SellerService] deliveryStatusUpdate Exception" , e);
		}
		return count;
	}
}



