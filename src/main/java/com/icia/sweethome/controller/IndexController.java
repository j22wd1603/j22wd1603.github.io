package com.icia.sweethome.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.icia.sweethome.model.Community;
import com.icia.sweethome.model.Paging;
import com.icia.sweethome.model.Response;
import com.icia.sweethome.model.Shop;
import com.icia.sweethome.service.CommunityService;
import com.icia.sweethome.service.IndexService;
import com.icia.sweethome.service.ShopService;
import com.icia.sweethome.service.UserService;
import com.icia.sweethome.util.CookieUtil;
import com.icia.sweethome.util.HttpUtil;
import com.icia.sweethome.util.JsonUtil;
import com.icia.sweethome.util.StringUtil;
import com.icia.sweethome.controller.IndexController;


@Controller("indexController")
public class IndexController
{
	@Autowired
	private CommunityService communityService;
	
    //어드민쿠키명
    @Value("#{env['auth.cookie.adminName']}")
    private String AUTH_COOKIE_ADMIN_NAME;	   	
	

	@Autowired
    private ShopService shopService;

	private static Logger logger = LoggerFactory.getLogger(IndexController.class);

	@RequestMapping(value = "/index", method=RequestMethod.GET)
	public String index(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		List<Community> list1 = null; 	// 마이룸 조회
		list1 = communityService.boardListByMonth("1");	//1.마이룸 2.자유게시판 3.질문게시판
		
		//현재페이지 번호 
		int curPage = HttpUtil.get(request, "curPage", 1);
		//총조회수
		int totalCount = 0;
		//페이징
		Paging paging =null;
		
		List<Shop> listView = null;
		
		Shop shop = new Shop();
		

		if(com.icia.sweethome.util.CookieUtil.getCookie(request,"ADMIN_ID") != null)
		{
			CookieUtil.deleteCookie(request, response, "/", "ADMIN_ID");
		}		
		
	
		
		totalCount = shopService.shopListCount(shop);
		
		if(totalCount >0)
		{
			
			paging = new Paging("/shop/shop", totalCount , 3, 3 , curPage , "curPage");
			
			shop.setStartRow(1);
			shop.setEndRow(3);

			listView = shopService.shopListView(shop);
		}
		
		
		
		
		
        model.addAttribute("list1", list1);
        model.addAttribute("listView",listView);


		return "/index";
	}       

}
