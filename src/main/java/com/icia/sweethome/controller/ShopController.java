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

import com.icia.sweethome.model.Paging;
import com.icia.sweethome.model.Review;
import com.icia.sweethome.model.Shop;
import com.icia.sweethome.model.User;
import com.icia.sweethome.service.SellerService;
import com.icia.sweethome.service.ShopService;
import com.icia.sweethome.service.UserService;
import com.icia.sweethome.util.CookieUtil;
import com.icia.sweethome.util.HttpUtil;

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
	private SellerService sellerService;

	private static final int LIST_COUNT = 12;		//한페이지의 게시물 수
	private static final int PAGE_COUNT = 5;		//페이징 수 

	//샵 메인 리스트
		@RequestMapping(value = "/shop/shop")
		public String shop(Model model, HttpServletRequest request, HttpServletResponse response) {
			
			// 검색타입
			String searchType = HttpUtil.get(request, "searchType");
			//검색내용
			String searchValue = HttpUtil.get(request, "searchValue");	
			
			String productName = HttpUtil.get(request, "productName");
			//브랜드네임
			String productBrandName = HttpUtil.get(request, "productBrandName");
			//제품이름
			String productDescription = HttpUtil.get(request, "productDescription");
			//제품내용
			//현재페이지 번호 
			int curPage = HttpUtil.get(request, "curPage", 1);
			//총조회수
			int totalCount = 0;
			//페이징
			Paging paging =null;
			
			List<Shop> list = null;
			List<Shop> listView = null;
			
			Shop shop = new Shop();
		
			
			totalCount = shopService.shopListCount(shop);
			
			if(totalCount >0)
			{
				
				paging = new Paging("/shop/shop", totalCount , LIST_COUNT, PAGE_COUNT , curPage , "curPage");
				
				shop.setStartRow(paging.getStartRow());
				shop.setEndRow(paging.getEndRow());

				list = shopService.shopList(shop);
				listView = shopService.shopListView(shop);
			}
			
			
			
			model.addAttribute("list" , list);	
			model.addAttribute("listView" , listView);	
			model.addAttribute("searchType" , searchType);
			model.addAttribute("searchValue" , searchValue);
			model.addAttribute("curPage" , curPage);
			model.addAttribute("paging" , paging);
			model.addAttribute("productBrandName",productBrandName);
			model.addAttribute("productName",productName);
			model.addAttribute("productDescription",productDescription);
	

			return "/shop/shop";
		}

		
		
		//shop product
		@RequestMapping(value="/shop/product")
		public String product(Model model, HttpServletRequest request, HttpServletResponse response) {

		      
			//카테고리
			String shopTabCode = HttpUtil.get(request, "shopTabCode", "");	//가구:A, 가전 : B, 잡화 : C
			//정렬값 조회
			String orderBy = HttpUtil.get(request, "orderBy", "");
			//상세카테고리
			String shopDetailTabCode = HttpUtil.get(request, "shopDetailTabCode", "");
			//브랜드명 검색
			String productBrandName = HttpUtil.get(request, "productBrandName", "");
			//제품 코드
			String productCode = HttpUtil.get(request, "productCode", "");
			
			int productPrice = HttpUtil.get(request, "productPrice", 0);
			
			int productStatus  =HttpUtil.get(request, "productStatus", 0);
			
			String regDate =  HttpUtil.get(request, "regDate", "");
			
			// 검색타입
			String searchType = HttpUtil.get(request, "searchType");
			//검색내용
			String searchValue = HttpUtil.get(request, "searchValue");	
			//현재페이지 번호 
			int curPage = HttpUtil.get(request, "curPage", 1);
			//총조회수
			int totalCount = 0;
			//페이징
			Paging paging =null;
			
			List<Shop> list = null;
			
			
			Shop shop = new Shop();
			
			shop.setShopTabCode(shopTabCode);
			shop.setShopDetailTabCode(shopDetailTabCode);
			shop.setProductBrandName(productBrandName);
			shop.setProductCode(productCode);
			shop.setProductPrice(productPrice);
			shop.setRegDate(regDate);
			shop.setOrderBy(orderBy);
			
			totalCount = shopService.shopListCount(shop);
			
			if(totalCount >0)
			{
				
				paging = new Paging("/shop/product", totalCount , LIST_COUNT, PAGE_COUNT , curPage , "curPage");
				
				shop.setStartRow(paging.getStartRow());
				shop.setEndRow(paging.getEndRow());
				
			
				list = shopService.shopList(shop);
				
			}
			
			model.addAttribute("list" , list);					
			model.addAttribute("shopTabCode", shopTabCode);
			model.addAttribute("shopDetailTabCode", shopDetailTabCode);
			model.addAttribute("productCode", productCode);
			model.addAttribute("searchType" , searchType);
			model.addAttribute("searchValue" , searchValue);
			model.addAttribute("curPage" , curPage);
			model.addAttribute("paging" , paging);
			model.addAttribute("productBrandName",productBrandName);
			model.addAttribute("regDate",regDate);
			model.addAttribute("productPrice",productPrice);

		    return "/shop/product";
		}
		
		
		
		@RequestMapping(value ="/shop/bestseller")
		public String bestseller(Model model, HttpServletRequest request, HttpServletResponse response) {
		
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
			
			paging = new Paging("/shop/bestseller", totalCount , LIST_COUNT, PAGE_COUNT , curPage , "curPage");
			
			shop.setStartRow(paging.getStartRow());
			shop.setEndRow(paging.getEndRow());

			listView = shopService.shopListView(shop);
			
		}
		
		model.addAttribute("listView" , listView);
		model.addAttribute("curPage" , curPage);
		model.addAttribute("paging" , paging);
		model.addAttribute("productName" , productName);



    return "/shop/bestseller";
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
		review = shopService.productReviewList(productIdk);
	
	    model.addAttribute("shop", shop);
	    model.addAttribute("review",review);
	    model.addAttribute("user",user);
	    
	    return "/shop/productDetail"; 
	}
		

	
}
