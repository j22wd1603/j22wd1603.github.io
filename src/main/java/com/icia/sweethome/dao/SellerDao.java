package com.icia.sweethome.dao;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.sweethome.model.Coupon;
import com.icia.sweethome.model.Delivery;
import com.icia.sweethome.model.DeliveryDetail;
import com.icia.sweethome.model.Order;
import com.icia.sweethome.model.OrderComplete;
import com.icia.sweethome.model.OrderDetail;
import com.icia.sweethome.model.Pay;
import com.icia.sweethome.model.Seller;
import com.icia.sweethome.model.Shop;

@Repository("sellerDao")
public interface SellerDao {
	
	public Seller sellerSelect(String sellerId);
	public List<Shop> detailTabSelect(String tabCode);
	public List<Shop> tabSelect(String tabCode);
	
	public List<Shop> productList(Shop product);
	public int productListCount(Shop product);
	public int productCodeSelect();
	public int productInsert(Shop product);
	public int productStatusUpdate(Shop product);
	public Shop productSelect(int productIdk);
	public int productUpdate(Shop product);
	
	public int orderSeqSelect();
	public int orderInsert(Order order);
	public int orderDetailInsert(OrderDetail orderDetail);
	public Order orderSelect(int orderIdk);
	public int orderPayUpdate(int orderIdk);
	public int payInsert(Pay pay);
	
	public Coupon couponSelect(String redemCode);
	public int couponUseInsert(Coupon coupon);
	public List<String> noUseCoupon(String userId);
	
	public int deliveryListCount(Delivery delivery);
	public List<Delivery> deliveryList(Delivery delivery);
	public List<DeliveryDetail> deliveryDetailSelect(DeliveryDetail deliveryDetia);
	
    public List<OrderComplete> orderComplete(int orderIdk);
    public Pay orderPaySelect(int orderIdk);
    
    public int deliveryStatusUpdate(Order order);
	
}





