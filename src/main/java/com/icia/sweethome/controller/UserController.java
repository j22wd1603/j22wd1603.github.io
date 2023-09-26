
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.icia.sweethome.model.Cart;
import com.icia.sweethome.model.Community;
import com.icia.sweethome.model.Paging;
import com.icia.sweethome.model.Question;
import com.icia.sweethome.model.Response;
import com.icia.sweethome.model.Review;
import com.icia.sweethome.model.User;
import com.icia.sweethome.service.CommunityService;
import com.icia.sweethome.service.CsService;
import com.icia.sweethome.service.ShopService;
import com.icia.sweethome.service.UserService;
import com.icia.sweethome.util.CookieUtil;
import com.icia.sweethome.util.FileData;
import com.icia.sweethome.util.HttpUtil;
import com.icia.sweethome.util.JsonUtil;
import com.icia.sweethome.util.StringUtil;


@Controller("userController")
public class UserController
{
	private static Logger logger = LoggerFactory.getLogger(UserController.class);
	
	// 쿠키명
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;		//USER_ID
	
	//파일 저장 경로
	@Value("#{env['upload.save.dir']}")
	private String UPLOAD_SAVE_DIR;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private CsService csService;
	
	@Autowired
	private ShopService shopService;
	
	private static final int LIST_COUNT = 5;	//한 페이지의 게시물 수
	private static final int PAGE_COUNT = 5;	//페이징 수
	
	
	@RequestMapping(value = "/user/loginPage")
	public String login(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "/user/loginPage";
	}
	
	@RequestMapping(value = "/user/join")
	public String join(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "/user/join";
	}
	
	@RequestMapping(value = "/user/userUpdate")
	public String userUpdate(Model model, HttpServletRequest request, HttpServletResponse response) {
		return "/user/userUpdate";
	}
	
	@RequestMapping(value="/user/cart", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> cart(HttpServletRequest request, HttpServletResponse response) {
	    Response<Object> ajaxResponse = new Response<Object>();
	    int productIdk = HttpUtil.get(request, "productIdk", 0);
	    int quantity = HttpUtil.get(request, "quantity", 0);
	    int finalPrice = HttpUtil.get(request, "finalPrice", 0);
	    String userId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
	    User user = userService.userSelect(userId);
	   
	    List<Cart> cartSelect = null;
	    int count = 0;

	    if (user != null) {
	        if (productIdk > 0 && quantity > 0 && finalPrice > 0) {
	            Cart cart = new Cart();
	            cart.setUserId(userId);
	            cart.setProductIdk(productIdk);
	            cart.setQuantity(quantity);
	            cart.setFinalPrice(finalPrice);

	            // 장바구니에 상품을 추가, 업데이트
	            cartSelect = shopService.cartSelect(cart);

	            if (cartSelect != null && cartSelect.size() > 0) {                
	                int existingQuantity = cartSelect.get(0).getQuantity();
	                int updatedQuantity = existingQuantity + quantity;
	                
	                if (updatedQuantity <= 10) 
	                {             
	                    count = shopService.cartUpdate(cart);
	                    
	                    if (count > 0) {
	                        ajaxResponse.setResponse(0, "장바구니 업데이트 성공");
	                    } 
	                    else 
	                    {
	                        ajaxResponse.setResponse(500, "장바구니 업데이트 실패");
	                    }
	                } 
	                else 
	                {
	                    // 수량 초과 시 에러 응답
	                    ajaxResponse.setResponse(408, "수량 초과 에러");
	                }
	            } 
	            else 
	            {                
	                count = shopService.cartInsert(cart);
	                
	                if (count > 0) 
	                {
	                    ajaxResponse.setResponse(0, "장바구니 추가 성공");
	                } 
	                else 
	                {
	                    ajaxResponse.setResponse(500, "장바구니 추가 실패");
	                }
	            }
	        } 
	        else 
	        {
	            ajaxResponse.setResponse(400, "매개변수 오류");
	        }
	    } 
	    else 
	    {
	        ajaxResponse.setResponse(404, "사용자를 찾을 수 없음");
	    }



	    if (logger.isDebugEnabled()) 
	    {
	        logger.debug("[ShopController]/user/cart response\n" + JsonUtil.toJsonPretty(ajaxResponse));
	    }

	    return ajaxResponse;
	}
	
	
	@RequestMapping(value = "/user/cartDelete", method = RequestMethod.POST)
	@ResponseBody
	public Response<Object> cartDelete(HttpServletRequest request) {
	    Response<Object> ajaxResponse = new Response<Object>();
	   	
	    String productIdkList = HttpUtil.get(request, "productIdk", "");
	    String userId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
	    User user = userService.userSelect(userId);
	    Cart cart = null;
	    
	    int productIdk = 0;
	    int deleteCount = 0;

	    if (user != null) {
	    	String[] productList = productIdkList.split(",");   //코드가 ,로 잘려서 (선택하게 한개 이상이면 473,250이런식으로 되니까
	    	cart = new Cart();
	    	
	    	cart.setUserId(userId);
	    	
	    	for(int i = 0; i < productList.length; i++)
	    	{
	    		productIdk = Integer.parseInt(productList[i]);
	    		cart.setProductIdk(productIdk);
	    		deleteCount += shopService.cartDelete(cart);
	    	}
	    	
            if (deleteCount == productList.length) {
                ajaxResponse.setResponse(0, "상품이 삭제되었습니다.");
            } 
            else 
            {
                ajaxResponse.setResponse(500, "상품 삭제 중 오류가 발생했습니다.");
            }
            
	    } else {
	        ajaxResponse.setResponse(404, "사용자를 찾을 수 없음");
	    }

	    if (logger.isDebugEnabled()) {
	        logger.debug("[ShopController]/user/cartDelete response\n" + JsonUtil.toJsonPretty(ajaxResponse));
	    }

	    return ajaxResponse;
	}
	
	
	@RequestMapping(value ="/user/cartPage")
	public String cartPage(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
	      
		
		//쿠키값
			String userId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			User user = userService.userSelect(userId);
			//현재 페이지
			int curPage = HttpUtil.get(request, "curPage", 1);
			int totalCount = 0;
			Paging paging = null;
			
			int productIdk = HttpUtil.get(request, "productIdk", 0);	
			//브랜드네임
			String productBrandName = HttpUtil.get(request, "productBrandName", "");
			//제품이름
			String productName = HttpUtil.get(request, "productName", "");
			String productFileExt = HttpUtil.get(request, "productFileExt", "");
			
			String productCode = HttpUtil.get(request, "productCode", "");
			int productPrice = HttpUtil.get(request, "productPrice", 0); 

			List<Cart> cartList = null;
				
			Cart cart = new Cart();
			cart.setUserId(userId);
			cart.setProductIdk(productIdk);
			cart.setProductName(productName);
			cart.setProductBrandName(productBrandName);
			cart.setProductFileExt(productFileExt);
			cart.setProductCode(productCode);
			cart.setProductPrice(productPrice);
			

			totalCount = shopService.cartListCount(cart);
			
			if(totalCount > 0)
			{
				paging = new Paging("/user/cartPage", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
				
				cart.setStartRow(paging.getStartRow());
				cart.setEndRow(paging.getEndRow());
				
				cartList = shopService.cartList(cart);
		
			}
			 model.addAttribute("cartList",cartList);
			 model.addAttribute("user",user);
			 model.addAttribute("curPage", curPage);
			 model.addAttribute("paging", paging);
			
			
			 
		    return "/user/cartPage"; 
	}
	
	@RequestMapping(value = "/user/mypageReview")
	public String myReview(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);		
		String searchValue = HttpUtil.get(request, "searchValue");
		//현재 페이지
		int curPage = HttpUtil.get(request, "curPage", 1);
		
		Paging paging = null;
		
		Review review = new Review();
		List<Review> list = null;
		int totalCount = 0;
		
		//회원정보조회
		User user = null;
		User userCnt = null;
		user = userService.userSelect(cookieUserId);
		
		userCnt = userService.myCountList(cookieUserId);

		//shop.setProductIdk(cookieProductIdk);

		review.setUserId(cookieUserId);
		
		totalCount = shopService.boardMyReviewCount(review);
		
		if(totalCount > 0)
		{
			paging = new Paging("/user/mypageReview", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
			
			review.setStartRow(paging.getStartRow());
			review.setEndRow(paging.getEndRow());
			
			list = shopService.boardMyReview(review);
		}
		
		model.addAttribute("user", user);
		model.addAttribute("userCnt", userCnt);
		model.addAttribute("list", list);
		model.addAttribute("curPage", curPage);
		model.addAttribute("paging", paging);
		
		
		return "/user/mypageReview";
	}
	
	

	

	
	@RequestMapping(value = "/user/mypageLikes")
	public String mypageLikes(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);		
		String searchValue = HttpUtil.get(request, "searchValue");
		//현재 페이지
		int curPage = HttpUtil.get(request, "curPage", 1);
		
		Paging paging = null;
		
		Community community = new Community();
		List<Community> list = null;
		int totalCount = 0;
		
		//회원정보조회
		User user = null;
		User userCnt = null;
		user = userService.userSelect(cookieUserId);
		
		userCnt = userService.myCountList(cookieUserId);

		community.setUserId(cookieUserId);
		//question.setQuestionTitle(searchValue);
		//question.setQuestionContent(searchValue);
		
		totalCount = communityService.boardMyLikesCount(community);
		
		if(totalCount > 0)
		{
			paging = new Paging("/user/mypageLikes", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
			
			community.setStartRow(paging.getStartRow());
			community.setEndRow(paging.getEndRow());
			
			list = communityService.boardMyLikes(community);
		}
		
		model.addAttribute("user", user);
		model.addAttribute("userCnt", userCnt);
		model.addAttribute("list", list);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		model.addAttribute("paging", paging);
		
		
		return "/user/mypageLikes";
	}
	
	
	@RequestMapping(value = "/user/mypageScrap")
	public String mypageScrape(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);		
		String searchValue = HttpUtil.get(request, "searchValue");
		//현재 페이지
		int curPage = HttpUtil.get(request, "curPage", 1);
		
		Paging paging = null;
		
		Community community = new Community();
		List<Community> list = null;
		int totalCount = 0;
		
		//회원정보조회
		User user = null;
		User userCnt = null;
		user = userService.userSelect(cookieUserId);
		
		userCnt = userService.myCountList(cookieUserId);

		community.setUserId(cookieUserId);

		totalCount = communityService.boardMyScrapCount(community);
		
		if(totalCount > 0)
		{
			paging = new Paging("/user/mypageMyQ", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
			
			community.setStartRow(paging.getStartRow());
			community.setEndRow(paging.getEndRow());
			
			list = communityService.boardMyScrap(community);
		}
		
		model.addAttribute("user", user);
		model.addAttribute("userCnt", userCnt);
		model.addAttribute("list", list);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		model.addAttribute("paging", paging);
		
		
		return "/user/mypageScrap";
	}
	
	//마이페이지의 내 질문
	@RequestMapping(value = "/user/mypageMyQ")
	public String mypageMyQ(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);		
		String searchValue = HttpUtil.get(request, "searchValue");
		//현재 페이지
		int curPage = HttpUtil.get(request, "curPage", 1);
		
		Paging paging = null;
		
		Question question = new Question();
		List<Question> list = null;
		int totalCount = 0;
		
		//회원정보조회
		User user = null;
		User userCnt = null;
		user = userService.userSelect(cookieUserId);
		
		userCnt = userService.myCountList(cookieUserId);

		question.setUserId(cookieUserId);
		//question.setQuestionTitle(searchValue);
		//question.setQuestionContent(searchValue);
		
		totalCount = csService.boardListCount2(question);
		
		if(totalCount > 0)
		{
			paging = new Paging("/user/mypageMyQ", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
			
			question.setStartRow(paging.getStartRow());
			question.setEndRow(paging.getEndRow());
			
			list = csService.boardList2(question);
		}
		
		model.addAttribute("user", user);
		model.addAttribute("userCnt", userCnt);
		model.addAttribute("list", list);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		model.addAttribute("paging", paging);
		
		return "/user/mypageMyQ";
		
		
	}

	
	
	
	//마이페이지의 내 게시판
	@RequestMapping(value = "/user/mypage")
	public String mypage(ModelMap model, HttpServletRequest request, HttpServletResponse response) { 
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);		
		String searchValue = HttpUtil.get(request, "searchValue");
		//현재 페이지
		int curPage = HttpUtil.get(request, "curPage", 1);
		
		Paging paging = null;
		
		Community commu = new Community();
		List<Community> list = null;
		int totalCount = 0;
		
		//회원정보조회
		User user = null;
		User userCnt = null;
		user = userService.userSelect(cookieUserId);
		
		userCnt = userService.myCountList(cookieUserId);

		commu.setUserId(cookieUserId);
		commu.setCommuTitle(searchValue);
		commu.setSearchValue(searchValue);
		
		totalCount = communityService.boardMyListCount(commu);
		
		if(totalCount > 0)
		{
			paging = new Paging("/user/mypage", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
			
			commu.setStartRow(paging.getStartRow());
			commu.setEndRow(paging.getEndRow());
			
			list = communityService.boardMyList(commu);
		}
		
		model.addAttribute("user", user);
		model.addAttribute("userCnt", userCnt);
		model.addAttribute("list", list);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		model.addAttribute("paging", paging);
		
		return "/user/mypage";
	}
	
	
	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> login(HttpServletRequest request, HttpServletResponse response)
	{
		String userId = HttpUtil.get(request, "userId");
		String userPwd = HttpUtil.get(request, "userPwd");
		Response<Object> ajaxResponse = new Response<Object>();
		
		logger.debug("==================================");
		logger.debug("userId : " + userId);
		logger.debug("==================================");
		
		if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd))
		{
			User user = userService.userSelect(userId);
			
			if(user != null)
			{
				
				if(StringUtil.equals(user.getUserPwd(), userPwd))
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
			logger.debug("[UserController] /user/login response\n" + JsonUtil.toJsonPretty(ajaxResponse));
		}
		
		return ajaxResponse;
	}
	
	//로그아웃
	@RequestMapping(value="/user/loginOut", method=RequestMethod.GET)
	public String loginOut(HttpServletRequest request, HttpServletResponse response)
	{
		if(CookieUtil.getCookie(request, AUTH_COOKIE_NAME) != null)
		{
			CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
		}
			
		return "redirect:/";		//재접속하라는 명령(URL을 다시 가리킴)
	}
	
	//회원가입
	@RequestMapping(value="/user/regForm", method=RequestMethod.GET)
	public String regForm(HttpServletRequest request, HttpServletResponse response)
	{
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		if(!StringUtil.isEmpty(cookieUserId))
		{
			CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
			
			return "redirect:/";
		}
		else
		{
			return "/user/regForm";
		}
	}
	
	//아이디 중복 체크
	@RequestMapping(value="/user/idCheck", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> idCheck(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		String userId = HttpUtil.get(request, "userId");
				
		if(!StringUtil.isEmpty(userId))
		{
			if(userService.userSelect(userId) == null)
			{
				//사용가능한 아이디
				ajaxResponse.setResponse(0, "Suceess");
			}
			else
			{
				ajaxResponse.setResponse(100, "Deplicate ID");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request");
		}
		
		if(logger.isDebugEnabled())
		{
			logger.debug("[UserDao]/user/idCheck response\n" + JsonUtil.toJsonPretty(ajaxResponse));
		}
		
		return ajaxResponse;
	}
	
	//회원 등록
	@RequestMapping(value="/user/regProc", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> regProc(MultipartHttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String userId = HttpUtil.get(request, "userId");
		String userPwd = HttpUtil.get(request, "userPwd");
		String userName = HttpUtil.get(request, "userName");
		String userEmail = HttpUtil.get(request, "userEmail");
	    String userPhone = HttpUtil.get(request, "userPhone");  
	    String userAddress = HttpUtil.get(request, "userAddress");
	    String userNickname = HttpUtil.get(request, "userNickname");
	    
	    FileData fileData = HttpUtil.getFile(request, "profilePicture", UPLOAD_SAVE_DIR + "\\profile", userId);
	    
		
		if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd) && 
					!StringUtil.isEmpty(userName) && !StringUtil.isEmpty(userEmail)&& !StringUtil.isEmpty(userPhone) && !StringUtil.isEmpty(userAddress))
		{
			if(userService.userSelect(userId) == null)
			{	//중복아이디가 없을 경우 정상적으로 등록
				User user = new User();
				
				user.setUserId(userId);
				user.setUserPwd(userPwd);
				user.setUserName(userName);
				user.setUserEmail(userEmail);
				user.setUserPhone(userPhone); 
				user.setUserAddress(userAddress); 
				user.setUserNickname(userNickname);
				user.setUserStatus("Y");
				
				if(fileData != null && fileData.getFileSize() > 0)
				{
					user.setImageFileExists("Y");
					user.setImageFileExt(fileData.getFileExt());
				}
				else
				{
					user.setImageFileExists("N");
				}
				
				if(userService.userInsert(user) > 0)
				{
					ajaxResponse.setResponse(0, "Success");
				}
				else
				{
					ajaxResponse.setResponse(500, "Internal Server Error");
				}
			}
			else
			{
				ajaxResponse.setResponse(100, "Duplicate ID");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request");
		}
		
		if(logger.isDebugEnabled())
		{
			logger.debug("[UserDao]/user/regProc response\n" + JsonUtil.toJsonPretty(ajaxResponse));
		}
		
		return ajaxResponse;
	}
	

	//회원정보수정 화면
	   @RequestMapping(value="/user/userUpdate", method=RequestMethod.GET)
	   public String updateForm(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	   {
	      String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
	      
	      User user = userService.userSelect(cookieUserId);
	      
	      model.addAttribute("user", user);    //첫번째 인수는 jsp에서 사용할 이름
	      
	      return "/user/userUpdate";
	   }
	
	//회원정보 수정(ajax통신용)0914 찬혁
    @RequestMapping(value="/user/updateProc", method=RequestMethod.POST)
    @ResponseBody
    public Response<Object> updateProc(MultipartHttpServletRequest request, HttpServletResponse response)
    {
       String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
       String userId = HttpUtil.get(request, "userId");
       String userPwd = HttpUtil.get(request, "userPwd");
       String userName = HttpUtil.get(request, "userName");
       String userEmail = HttpUtil.get(request, "userEmail");
        String userPhone = HttpUtil.get(request, "userPhone");  
        String userAddress = HttpUtil.get(request, "userAddress");
        String userNickname = HttpUtil.get(request, "userNickname");
       
        FileData fileData = HttpUtil.getFile(request, "profilePicture", UPLOAD_SAVE_DIR + "\\profile", userId);

       Response<Object> ajaxResponse = new Response<Object>();
       
       if(!StringUtil.isEmpty(cookieUserId))
       {
          User user = userService.userSelect(cookieUserId);
          
          if(user != null)
          {
             if(!StringUtil.isEmpty(userPwd) && !StringUtil.isEmpty(userName) &&
                                  !StringUtil.isEmpty(userEmail) && !StringUtil.isEmpty(userPhone) && !StringUtil.isEmpty(userAddress) )
             {
                user.setUserPwd(userPwd);
                user.setUserName(userName);
                user.setUserEmail(userEmail);
                user.setUserPhone(userPhone); 
                user.setUserAddress(userAddress); 
                user.setUserNickname(userNickname);
                
                if(fileData != null && fileData.getFileSize() > 0)
             {
                user.setImageFileExists("Y");
                user.setImageFileExt(fileData.getFileExt());
             }
                if(userService.userUpdate(user) > 0)
                {
                   ajaxResponse.setResponse(0, "success");
                }
                else
                {
                   ajaxResponse.setResponse(500, "Internal Server error");
                }
             }
             else
             {
                //입력 파라미디가 올바르지 않을 경우
                ajaxResponse.setResponse(400, "Bad Request");
             }
          }
          else
          {
             //사용자정보 없을 경우
             CookieUtil.deleteCookie(request, response, "/", AUTH_COOKIE_NAME);
             ajaxResponse.setResponse(404, "Not Found");
          }
       }
       else
       {
          ajaxResponse.setResponse(400, "Bad Request");
       }
       
       if(logger.isDebugEnabled())
       {
          logger.debug("[UserController]/user/updateProc response\n" + JsonUtil.toJsonPretty(ajaxResponse));
       }
       
       return ajaxResponse;
    }
	//마이페이지에 있는 내 스크랩 삭제 0913 윤하나 
	@RequestMapping(value="/user/myScrapDelete", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> myScrapDelete(HttpServletRequest request, HttpServletResponse response)
	{
		int commuIdk = HttpUtil.get(request, "commuIdk", 0);
		Response<Object> ajaxResponse = new Response<Object>();
		
		logger.debug("==================================");
		logger.debug("commuIdk : " + commuIdk);
		logger.debug("==================================");
		
		if(!StringUtil.isEmpty(commuIdk))
		{
			int check = communityService.boardMyScrapSearch(commuIdk);
			
			if(check > 0)
			{
			
				if(communityService.boardMyScrapDelete(commuIdk) > 0)
				{
					ajaxResponse.setResponse(0, "Success");
				}
				else
				{
					ajaxResponse.setResponse(-1, "Passwords do not match"); 
				}
			}
			else
			{
				logger.debug("해당 스크랩 정보가 존재하지 않음. ");
				ajaxResponse.setResponse(404, "Not Found"); 
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request"); 
		}
		
		if(logger.isDebugEnabled())
		{
			logger.debug("[UserController] /user/myScrapDelete response\n" + JsonUtil.toJsonPretty(ajaxResponse));
		}
		
		return ajaxResponse;
	}
	
	//마이페이지에 있는 내 스크랩 선택삭제 0920 윤하나 
		@RequestMapping(value="/user/myScrapSelectDelete", method=RequestMethod.POST)
		@ResponseBody
		public Response<Object> myScrapSelectDelete(HttpServletRequest request) {
			
		
			
			Response<Object> ajaxResponse = new Response<Object>();
			String myScrapSelectDelete = HttpUtil.get(request, "valueArr", "");
			int count = 0;
			
			if(myScrapSelectDelete != null)
			{
			String[] result = myScrapSelectDelete.split(",");
			
			if(result.length > 0)
			{
	 			for(int i = 0; i < result.length; i++)
	 			{
	 				logger.debug("i : [" + i + "] -> : " + result[i]);
	 				count = communityService.myScrapSelectDelete(Integer.parseInt(result[i]));
	 			}
	 			
	 			if(count > 0)
	 			{
	 				ajaxResponse.setResponse(0, "success");
	 			}
	 			else
	 			{
	 				ajaxResponse.setResponse(500, "server error");
	 			}
			}
			else
			{
				ajaxResponse.setResponse(403, "bad Request");
			}
			
			}
			else
			{
				ajaxResponse.setResponse(400, "bad Request");
			}
			
			return ajaxResponse;
		}

	}