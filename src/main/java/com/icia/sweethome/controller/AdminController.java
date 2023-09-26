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

import com.icia.sweethome.model.Admin;
import com.icia.sweethome.model.Community;
import com.icia.sweethome.model.Paging;
import com.icia.sweethome.model.Response;
import com.icia.sweethome.model.Shop;
import com.icia.sweethome.model.User;
import com.icia.sweethome.service.AdminService;
import com.icia.sweethome.service.CommunityService;
import com.icia.sweethome.service.ShopService;
import com.icia.sweethome.service.UserService;
import com.icia.sweethome.util.CookieUtil;
import com.icia.sweethome.util.HttpUtil;
import com.icia.sweethome.util.JsonUtil;
import com.icia.sweethome.util.StringUtil;

@Controller("adminController")
public class AdminController {
	
	private static Logger logger = LoggerFactory.getLogger(AdminController .class);
	
	@Autowired
	private AdminService adminService;
	
    //쿠키명
    @Value("#{env['auth.cookie.name']}")
    private String AUTH_COOKIE_NAME;	   	
    
	@Autowired
	private CommunityService communityService;

	@Autowired
    private ShopService shopService;
	
	
	//관리자 메인페이지
	@RequestMapping(value = "/admin/adminIndex", method=RequestMethod.GET)
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


		return "/admin/adminIndex";
	}        
    
    
	//관리자 로그인 페이지
	@RequestMapping(value = "/admin/main")
	public String main(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		
		return "/admin/main";
	}
	
	
	@RequestMapping(value="/admin/login", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> login(HttpServletRequest request, HttpServletResponse response)
	{
		String userId = HttpUtil.get(request, "userId");
		String userPwd = HttpUtil.get(request, "userPwd");
		Response<Object> ajaxResponse = new Response<Object>();

		if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd))
		{
			Admin admin = adminService.adminSelect(userId);
			
			if(admin != null)
			{
				
				if(StringUtil.equals(admin.getAdminPwd(), userPwd))
				{
					CookieUtil.addCookie(response, "/", -1, AUTH_COOKIE_NAME, CookieUtil.stringToHex(userId));
					
					ajaxResponse.setResponse(0, "Success"); // 로그인 성공
				}
				else
				{
					ajaxResponse.setResponse(-1, "Passwords do not match"); // 비밀번호 불일치
				}
			}
			else
			{
				
				ajaxResponse.setResponse(404, "Not Found"); // 사용자 정보 없음 (Not Found)
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request"); // 파라미터가 올바르지 않음 (Bad Request)
		}
		
		if(logger.isDebugEnabled())
		{
			logger.debug("[AdminController] /admin/login response\n" + JsonUtil.toJsonPretty(ajaxResponse));
		}
		
		return ajaxResponse;
	}	
	

//유저
//=====================================================================================================================
	
	
		@RequestMapping(value = "/admin/adminUser")
		public String adminUser(Model model, HttpServletRequest request, HttpServletResponse response) {
			
			
			return "/admin/adminUser";
		}		

	
//쇼핑몰
//=====================================================================================================================
		
		@RequestMapping(value = "/admin/adminShop")
		public String adminShop(Model model, HttpServletRequest request, HttpServletResponse response) {
			
			
			return "/admin/adminShop";
		}		
	
	
//판매자
//=====================================================================================================================
		
		@RequestMapping(value = "/admin/adminSeller")
		public String adminSeller(Model model, HttpServletRequest request, HttpServletResponse response) {
			
			
			return "/admin/adminSeller";
		}			
	
//커뮤니티
//=====================================================================================================================
		
		@RequestMapping(value = "/admin/adminCommunity")
		public String adminCommunity(Model model, HttpServletRequest request, HttpServletResponse response) {
			
		    //쿠키 값
		    String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);

			
			return "/admin/adminCommunity";
		}			
	
	
//고객센터
//=====================================================================================================================
	

		@RequestMapping(value = "/admin/adminCs")
		public String adminCs(Model model, HttpServletRequest request, HttpServletResponse response) {
			
			
			return "/admin/adminCs";
		}
		
		
		
	
		
		

		
			
		
		
		
		

		
	}
	
	
	
	//==================================================================



	
	
	//==================================================================

	
	
	
	

