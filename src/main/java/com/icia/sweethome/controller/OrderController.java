package com.icia.sweethome.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.icia.sweethome.model.Order;
import com.icia.sweethome.model.OrderDetail;
import com.icia.sweethome.model.Paging;
import com.icia.sweethome.model.Review;
import com.icia.sweethome.model.Shop;
import com.icia.sweethome.model.User;
import com.icia.sweethome.service.OrderService;
import com.icia.sweethome.service.UserService;
import com.icia.sweethome.util.CookieUtil;
import com.icia.sweethome.util.HttpUtil;


@Controller("orderController")
public class OrderController {
	private static Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	
    @Autowired
    private UserService userService;	
    
	private static final int LIST_COUNT = 10;	//한 페이지의 게시물 수
	private static final int PAGE_COUNT = 5;	//페이징 수


    //쿠키명
    @Value("#{env['auth.cookie.name']}")
    private String AUTH_COOKIE_NAME;	
    
    @RequestMapping(value = "/user/myShopping")
    public String myShopping(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
    	
 
    	String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
    	
    	//현재 페이지
    	int curPage = HttpUtil.get(request, "curPage", 1);
    			
    	Paging paging = null;
    	int totalCount = 0;
 		
    	List<Order> list = null;
		Order order = new Order();

		
		User user = userService.userSelect(cookieUserId);
		
		if(user != null)
		{
			list = orderService.orderInfoSelect(cookieUserId);
		}
		else
		{
			logger.debug("====================================");
			logger.debug("로그인페이지로 이동");
			logger.debug("====================================");
			return "redirect:/user/loginPage";
		}

		order.setUserId(cookieUserId);
		
		totalCount = orderService.orderInfoCount(order);
		
		if(totalCount >0)
		{
			
			paging = new Paging("/user/myShopping", totalCount , LIST_COUNT, PAGE_COUNT , curPage , "curPage");
			
			order.setStartRow(paging.getStartRow());
			order.setEndRow(paging.getEndRow());

			list = orderService.orderList(order);
			
			for(int i=0;i<list.size();i++) {
				List<OrderDetail> param = new ArrayList<OrderDetail>();
				param = orderService.orderDetailSelect(list.get(i).getOrderIdk());
				list.get(i).setOrderDetailList(param);
			}
		}
		
		

		model.addAttribute("list" , list);	
		model.addAttribute("curPage" , curPage);
		model.addAttribute("paging" , paging);


	    return "/user/myShopping";
	}
	
	
		
		
    

    @RequestMapping(value = "/user/myShoppingDetail")
    public String myShoppingDetail(ModelMap model, HttpServletRequest request, HttpServletResponse response) {


		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);	
		

		int orderIdk = HttpUtil.get(request, "orderIdk", 0);
		
    	List<Order> list = null;
		Order order = new Order();
		
		
    	Order info = null;
    	List<OrderDetail> orderDetailList = null;
		
    	if(orderIdk > 0)
    	{
    		info = orderService.orderMySelect(orderIdk);
    		
    		if(info != null)
    		{
    			orderDetailList = orderService.orderDetailSelect(orderIdk);
    		}
    		else
    		{
    			return "redirect:/user/myShopping";
    		}
    	}
    	else
    	{
    		logger.debug("====================================");
			logger.debug("주문현황으로 이동");
			logger.debug("====================================");
			return "redirect:/user/myShopping";
    	}
    	
    	model.addAttribute("info", info);		//order 테이블 기준
    	model.addAttribute("orderDetailList", orderDetailList);
		
		return "/user/myShoppingDetail";
		
    }


	
  	  		

	
}
