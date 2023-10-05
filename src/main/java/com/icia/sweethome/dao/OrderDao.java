package com.icia.sweethome.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.sweethome.model.Order;
import com.icia.sweethome.model.OrderDetail;
import com.icia.sweethome.model.Review;
import com.icia.sweethome.model.Shop;

@Repository("orderDao")
public interface OrderDao {

	public List<Order> orderInfoSelect(String userId);
	
	public List<Order> orderList(Order order);
	
	public int orderListCount(Order order);
	
	public int orderInfoCount(Order order);
	
	public List<OrderDetail> orderDetailSelect(int orderIdk);
	
	public Order orderMySelect(int orderIdk);
	
	//리뷰
	public OrderDetail orderDetailSearch(OrderDetail orderDetail);
	
}


