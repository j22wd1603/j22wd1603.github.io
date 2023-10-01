package com.icia.sweethome.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.icia.sweethome.model.Cart;
import com.icia.sweethome.model.OrderDetail;
import com.icia.sweethome.model.Paging;
import com.icia.sweethome.model.Response;
import com.icia.sweethome.model.Review;
import com.icia.sweethome.model.Shop;
import com.icia.sweethome.model.User;
import com.icia.sweethome.service.OrderService;
import com.icia.sweethome.service.ShopService;
import com.icia.sweethome.service.UserService;
import com.icia.sweethome.util.CookieUtil;
import com.icia.sweethome.util.HttpUtil;
import com.icia.sweethome.util.JsonUtil;
import com.icia.sweethome.util.StringUtil;



@Controller("shopController")
public class ShopController {
	
	private static Logger logger = LoggerFactory.getLogger(ShopController .class);
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;	
	
	@Autowired
	private ShopService shopService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private OrderService orderService;

	private static final int LIST_COUNT = 12;		//한페이지의 게시물 수
	private static final int PAGE_COUNT = 5;		//페이징 수 

	//샵 메인 리스트
	@RequestMapping(value = "/shop/shop")
	public String shop(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		String productName = HttpUtil.get(request, "productName","");
		
		List<Shop> list = null;
		List<Shop> listView = null;
		
		Shop shop = new Shop();
		shop.setProductName(productName);

		list = shopService.shopList(shop);
		
		Shop bestShop = new Shop();
		bestShop.setStartRow(1);
		bestShop.setEndRow(8);
		
		listView = shopService.shopListView(bestShop);
		
		model.addAttribute("list" , list);	
		model.addAttribute("listView" , listView);
		model.addAttribute("productName" , productName);

		return "/shop/shop";
	}

	
	
	//shop product
	@RequestMapping(value="/shop/product")
	public String product(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {

		//카테고리
		String shopTabCode = HttpUtil.get(request, "shopTabCode");	//가구:A, 가전 : B, 잡화 : C
		
		if(StringUtil.isEmpty(shopTabCode)) {
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('잘못된 접근입니다.');");
	        out.println("location.href = '/user/loginPage'; </script>");
			return "/";
		}
		
		//정렬값 조회
		String orderBy = HttpUtil.get(request, "orderBy", "");
		//상세카테고리
		String shopDetailTabCode = HttpUtil.get(request, "shopDetailTabCode", "");
		//브랜드명 검색
		String productBrandName = HttpUtil.get(request, "productBrandName", "");
		//제품 코드
		String productCode = HttpUtil.get(request, "productCode", "");
		
		int productPrice = HttpUtil.get(request, "productPrice", 0);

		String regDate =  HttpUtil.get(request, "regDate", "");

		List<Shop> detailList = shopService.productDetailselct(shopTabCode);
		Shop param = new Shop();
		param.setShopTabCode(shopTabCode);
		param.setShopDetailTabCode(shopDetailTabCode);
		List<String> brandList = shopService.productBrandselct(param);
		
		List<Shop> list = null;
		
		
		Shop shop = new Shop();
		
		shop.setShopTabCode(shopTabCode);
		shop.setShopDetailTabCode(shopDetailTabCode);
		shop.setProductBrandName(productBrandName);
		shop.setProductCode(productCode);
		shop.setProductPrice(productPrice);
		shop.setRegDate(regDate);
		shop.setOrderBy(orderBy);
		
		list = shopService.shopList(shop);
			
		model.addAttribute("list" , list);					
		model.addAttribute("shopTabCode", shopTabCode);
		model.addAttribute("shopDetailTabCode", shopDetailTabCode);
		model.addAttribute("detailList",detailList);
		model.addAttribute("brandList",brandList);
		model.addAttribute("productBrandName",productBrandName);
		model.addAttribute("orderBy",orderBy);

	    return "/shop/product";
	}

		@RequestMapping(value ="/shop/bestItem")
		public String bestItem(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		String productName = HttpUtil.get(request, "productName","");
		//현재페이지 번호 
		int curPage = HttpUtil.get(request, "curPage", 1);
		//총조회수
		int totalCount = 0;

		//페이징
		Paging paging =null;
		
		List<Shop> listView = null;
		
		Shop shop = new Shop();
		
		shop.setProductName(productName);
		totalCount = shopService.shopListViewCount(shop);
		
		if(totalCount > 0)
		{
			
			paging = new Paging("/shop/bestItem", totalCount , LIST_COUNT, PAGE_COUNT , curPage , "curPage");
			
			shop.setStartRow(paging.getStartRow());
			shop.setEndRow(paging.getEndRow());

			listView = shopService.shopListView(shop);
			
		}
		
		model.addAttribute("listView" , listView);
		model.addAttribute("curPage" , curPage);
		model.addAttribute("paging" , paging);
		model.addAttribute("productName" , productName);



    return "/shop/bestItem";
}
	
		
		
		
	@RequestMapping(value ="/shop/productDetail")
	public String productDetail(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
		
	      //쿠키값
		String userId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		User user = userService.userSelect(userId);
		
		int productIdk = HttpUtil.get(request, "productIdk", 0);	//받아오는것만 이렇게
		Shop shop = null;		//new Shop();
		List<Review> review = null;
			
		
		shop = shopService.productSelect(productIdk);			
		review = shopService.reviewList(productIdk);
	
	    model.addAttribute("shop", shop);
	    model.addAttribute("review",review);
	    model.addAttribute("user",user);
	    
	    return "/shop/productDetail"; 
	}
	
	@RequestMapping(value="/shop/cart", method=RequestMethod.POST)
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
	        logger.debug("[ShopController]/shop/cart response\n" + JsonUtil.toJsonPretty(ajaxResponse));
	    }

	    return ajaxResponse;
	}
	
	
	@RequestMapping(value = "/shop/cartDelete", method = RequestMethod.POST)
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
	        logger.debug("[ShopController]/shop/cartDelete response\n" + JsonUtil.toJsonPretty(ajaxResponse));
	    }

	    return ajaxResponse;
	}
	
	
	
	@RequestMapping(value ="/shop/cartPage")
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

			int LIST_COUNT = 7;
			
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
				paging = new Paging("/shop/cartPage", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
				
				cart.setStartRow(paging.getStartRow());
				cart.setEndRow(paging.getEndRow());
				
				cartList = shopService.cartList(cart);
		
			}
			
			 model.addAttribute("cartList",cartList);
			 model.addAttribute("user",user);
			 model.addAttribute("curPage", curPage);
			 model.addAttribute("paging", paging);
	
			 
		    return "/shop/cartPage"; 
	}
		
	@RequestMapping(value = "/shop/review", method = RequestMethod.POST)
	@ResponseBody
	public Response<Object> review(HttpServletRequest request) {
	    Response<Object> ajaxResponse = new Response<Object>();
	    String userId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
	    User user = userService.userSelect(userId);
	    if (user != null) {
	        String reviewContent = request.getParameter("reviewContent");
	        
	        if (reviewContent != null) {
	            Review review = new Review();
	            review.setUserId(userId);
	            review.setReviewContent(reviewContent);
	          

	            int count = shopService.reviewInsert(review);

	            if (count > 0) {
	                ajaxResponse.setResponse(0, "리뷰가 등록되었습니다.");
	            } else {
	                ajaxResponse.setResponse(500, "리뷰 등록 중 오류가 발생했습니다.");
	            }
	        } else {
	            ajaxResponse.setResponse(400, "리뷰 내용을 찾을 수 없습니다.");
	        }
	    } else {
	        ajaxResponse.setResponse(401, "사용자를 찾을 수 없습니다.");
	    }

	    if (logger.isDebugEnabled()) {
	        logger.debug("[ShopController]/shop/review response\n" + JsonUtil.toJsonPretty(ajaxResponse));
	    }

	    return ajaxResponse;
	}

	@RequestMapping(value ="/shop/reviewPage")
	public String reviewPage(ModelMap model, HttpServletRequest request, HttpServletResponse response) {
	      
		
		//쿠키값
			String userId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
			User user = userService.userSelect(userId);
		
			 
		    return "/shop/reviewPage"; 
	}
}


