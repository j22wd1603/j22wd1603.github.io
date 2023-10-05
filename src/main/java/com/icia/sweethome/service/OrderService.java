package com.icia.sweethome.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.icia.sweethome.dao.OrderDao;
import com.icia.sweethome.model.Order;
import com.icia.sweethome.model.OrderDetail;
import com.icia.sweethome.model.Review;
import com.icia.sweethome.model.Shop;

@Service("orderService")
public class OrderService {
	private static Logger logger = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	private OrderDao orderDao;
	
	public List<Order> orderInfoSelect(String userId)
	{
		List<Order> list = null;
      
		try
		{
			list = orderDao.orderInfoSelect(userId);
		}
		catch(Exception e)
		{
			logger.error("[OrderService] orderInfoSelect Exception", e);
		}
      
		return list;
   }
	
	
	public List<Order> orderList(Order order) {
	    List<Order> list = null;
	    
	    try {
	        list = orderDao.orderList(order);
	        
	    }
	    catch (Exception e) {
	        logger.error("[orderService] orderList Exception", e);
	    }
	    
	    return list;
	}
	
	
	//마이페이지의 내 주문내역 조회 0919 윤하나
	public int orderInfoCount(Order order)
	{
		int count = 0;
		
		try
		{
			count = orderDao.orderInfoCount(order);
		}
		catch(Exception e)
		{
			logger.error("[orderService] orderInfoCount Exception", e);
		}
		
		return count;
	}
	
	
	public List<OrderDetail> orderDetailSelect(int orderIdk)
	{
		List<OrderDetail> list = null;
      
		try
		{
			list = orderDao.orderDetailSelect(orderIdk);
		}
		catch(Exception e)
		{
			logger.error("[OrderService] orderDetailSelect Exception", e);
		}
      
		return list;
   }
	
	

	
	
	public Order orderMySelect(int orderIdk)
	{
		Order info = null;
		
		try
		{
			info = orderDao.orderMySelect(orderIdk);
		}
		catch(Exception e)
		{
			logger.error("[OrderService] orderMySelect Exception", e);
		}
		
		return info;
	}
	
	public OrderDetail orderDetailSearch(OrderDetail orderDetail)
	{
		OrderDetail search = null;
      
		try
		{
			search = orderDao.orderDetailSearch(orderDetail);
		}
		catch(Exception e)
		{
			logger.error("[OrderService] orderDetailSearch Exception", e);
		}
      
		return search;
   }
	
}

