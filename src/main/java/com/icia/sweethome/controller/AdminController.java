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
import com.icia.sweethome.model.Comment;
import com.icia.sweethome.model.Community;
import com.icia.sweethome.model.Paging;
import com.icia.sweethome.model.Question;
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
    
    //어드민쿠키명
    @Value("#{env['auth.cookie.adminName']}")
    private String AUTH_COOKIE_ADMIN_NAME;	   	
    
	@Autowired
	private CommunityService communityService;

	@Autowired
    private ShopService shopService;
	@Autowired
	private UserService userService;
	
	
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
		String adminId = HttpUtil.get(request, "adminId");
		String adminPwd = HttpUtil.get(request, "adminPwd");
		Response<Object> ajaxResponse = new Response<Object>();

		if(!StringUtil.isEmpty(adminId) && !StringUtil.isEmpty(adminPwd))
		{
			Admin admin = adminService.adminSelect(adminId);
			
			if(admin != null)
			{
				
				if(StringUtil.equals(admin.getAdminPwd(), adminPwd))
				{
					CookieUtil.addCookie(response, "/", -1, AUTH_COOKIE_ADMIN_NAME, CookieUtil.stringToHex(adminId));
					
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
	
	//로그아웃
	@RequestMapping(value="/admin/loginOut", method=RequestMethod.GET)
	public String loginOut(HttpServletRequest request, HttpServletResponse response)
	{
		if(com.icia.sweethome.util.CookieUtil.getCookie(request,"ADMIN_ID") != null)
		{
			CookieUtil.deleteCookie(request, response, "/", "ADMIN_ID");
		}
			
		return "/admin/main";		//재접속하라는 명령(URL을 다시 가리킴)
	}	

//유저
//=====================================================================================================================
	


	
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
			
	
			return "/admin/adminCommunity";
		}
		
		
		@RequestMapping(value = "/admin/communityList")
		public String communityList(Model model, HttpServletRequest request, HttpServletResponse response) {
			
			List<Community> boardList = null; 	// 게시글 리스트 객체
			List<Comment> commentList = null; 	// 댓글 리스트 객체
			
			Community boardSearch = new Community();
			Comment commentSearch = new Comment();
			
		    String searchType = HttpUtil.get(request, "searchType", "");
		    String searchValue = HttpUtil.get(request, "searchValue", "");
		    String userSearch = HttpUtil.get(request, "userSearch", "");
		    String userValue = HttpUtil.get(request, "userValue", "");
		    String status = HttpUtil.get(request, "status", "");
		    
		    //1이면 제목으로 게시글 조회
		    if(StringUtil.equals(searchType, "1"))
		    {
		    	boardSearch.setSearchType(searchType);
			    boardSearch.setCommuTitle(searchValue);
			    boardSearch.setUserId(userValue);	
			    boardSearch.setCommuStatus(status);		
			    
	    		boardList = adminService.adminBoardSelect(boardSearch);
	    		
			    model.addAttribute("boardList", boardList);
			    
		    }
		    //2이면 내용으로 댓글 조회
		    else if(StringUtil.equals(searchType, "2"))
		    {
		    	commentSearch.setSearchType(searchType);
	    		commentSearch.setCommentContent(searchValue);
	    		commentSearch.setUserId(userValue);
	    		commentSearch.setCommentStatus(status);		
	    		
	    		commentList = adminService.adminCommentSelect(commentSearch);
	    		
			    model.addAttribute("commentList", commentList);
		    }
		    //회원아이디와 상태를 이용하여 조회 할 때
		    else
		    {
		    	boardSearch.setUserId(userValue);
			    boardSearch.setCommuStatus(status);		
	    		commentSearch.setUserId(userValue);
	    		commentSearch.setCommentStatus(status);		
	    		
	    		boardList = adminService.adminBoardSelect(boardSearch);
	    		commentList = adminService.adminCommentSelect(commentSearch);	
	    		
	    		
			    model.addAttribute("boardList", boardList);
			    model.addAttribute("commentList", commentList);	    		
		    }


			
			return "/admin/adminCommunity";
		}
		
		//게시글 상태 업데이트
		@RequestMapping(value = "/admin/boardUpdate", method = RequestMethod.POST)//회원정지
		@ResponseBody
		public Response<Object> boardUpdate(HttpServletRequest request, HttpServletResponse response) {
		    Response<Object> ajaxResponse = new Response<Object>();
		    
        	
		    int commuIdk = HttpUtil.get(request, "commuIdk", 0);
		    String commuStatus = HttpUtil.get(request, "commuStatus", "");
		    
		    if(commuIdk != 0 && "Y".equals(commuStatus) || "N".equals(commuStatus))
		    {
		    	adminService.boardStatusUpdate(commuIdk);
		    	
		        ajaxResponse.setCode(0); // 성공

		    }
		    else
		    {
		        ajaxResponse.setCode(400); // 실패
		    }
		    

		    return ajaxResponse;
		}
		
		//게시글 상태 업데이트
		@RequestMapping(value = "/admin/commentUpdate", method = RequestMethod.POST)//회원정지
		@ResponseBody
		public Response<Object> commentUpdate(HttpServletRequest request, HttpServletResponse response) {
		    Response<Object> ajaxResponse = new Response<Object>();
		    
        	
		    int commentIdk = HttpUtil.get(request, "commentIdk", 0);
		    String commentStatus = HttpUtil.get(request, "commentStatus", "");
		    
		    
		    if(commentIdk != 0 && "Y".equals(commentStatus) || "N".equals(commentStatus))
		    {
		    	adminService.commentStatusUpdate(commentIdk);
		    	
		        ajaxResponse.setCode(0); // 성공

		    }
		    else
		    {
		        ajaxResponse.setCode(400); // 실패
		    }
		    

		    return ajaxResponse;
		}	
		

		
		
		

	
	
//고객센터
//=====================================================================================================================
	

		@RequestMapping(value = "/admin/adminCs")
		public String adminCs(Model model, HttpServletRequest request, HttpServletResponse response) {

			List<User> list = null;

			User user = new User();

			list = adminService.userList(user);
			model.addAttribute("list",list);
			return "/admin/adminCs";
		}
		
		@RequestMapping(value = "/admin/userStatus", method = RequestMethod.POST)//회원정지
		@ResponseBody
		public Response<Object> status(HttpServletRequest request, HttpServletResponse response) {
		    Response<Object> ajaxResponse = new Response<Object>();

		    String userId = HttpUtil.get(request, "userId", "");
		    String userStatus = HttpUtil.get(request, "userStatus", "");
		    User user = userService.userSelect(userId);
		    if ("Y".equals(userStatus) || "N".equals(userStatus)) {
		        adminService.userStatusUpdate(user);
		        ajaxResponse.setCode(0); // 성공 코드
		    } else {
		        ajaxResponse.setCode(400); // 파라미터 값이 올바르지 않음을 나타내는 코드
		    }

		    return ajaxResponse;
		}
		@RequestMapping(value = "/admin/adminUser")
		public String adminUser(ModelMap model, HttpServletRequest request, HttpServletResponse response)
		{
			String userId = HttpUtil.get(request, "userId", "");
			Question user = new Question();
			List<Question> list = null;
			user.setUserId(userId);

			list = adminService.userQuestion(user);
		    if (list != null) {
		        System.out.println("Received list with " + list.size() + " items.");
		    } else {
		        System.out.println("Received an empty list.");
		    }
			
			model.addAttribute("list", list);
			return "/admin/adminUser";
		}
		
	
		
		

		
			
		
		
		
		

		
	}
	
	
	
	//==================================================================



	
	
	//==================================================================

	
	
	
	

