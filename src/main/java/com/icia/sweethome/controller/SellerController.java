package com.icia.sweethome.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;
import com.icia.sweethome.model.Coupon;
import com.icia.sweethome.model.Delivery;
import com.icia.sweethome.model.DeliveryDetail;
import com.icia.sweethome.model.Order;
import com.icia.sweethome.model.OrderComplete;
import com.icia.sweethome.model.OrderDetail;
import com.icia.sweethome.model.Paging;
import com.icia.sweethome.model.Pay;
import com.icia.sweethome.model.Response;
import com.icia.sweethome.model.Seller;
import com.icia.sweethome.model.Shop;
import com.icia.sweethome.model.User;
import com.icia.sweethome.service.SellerService;
import com.icia.sweethome.service.UserService;
import com.icia.sweethome.util.CookieUtil;
import com.icia.sweethome.util.FileData;
import com.icia.sweethome.util.FileUtil;
import com.icia.sweethome.util.HttpUtil;
import com.icia.sweethome.util.StringUtil;

@Controller("sellerController")
public class SellerController {
	
	private static Logger logger = LoggerFactory.getLogger(SellerController .class);
	
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;	
	
	//파일 저장 경로
	@Value("#{env['upload.save.dir']}")
	private String UPLOAD_SAVE_DIR;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private UserService userService;
	
	private static final int LIST_COUNT = 8;		//한페이지의 게시물 수
	private static final int PAGE_COUNT = 5;
	
	public void loginChack(HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그인이 필요합니다');");
        out.println("location.href = '/user/loginPage'; </script>");
        out.flush();
	}
	public String productCodeChange(int code) {
		String ICode = Integer.toString(code);
		String SCode = "";
		if(ICode.length() > 4) {
			return SCode;
		}
		
		for(int i=0;i < 4-ICode.length();i++) {
			SCode = SCode + "0";
		}
		SCode = SCode+ICode;
		
		return SCode; 
	}
	
	@RequestMapping(value = "/shop/orderPage", method = RequestMethod.POST)
	   public String orderPage(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
	       String userId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
	       User user = userService.userSelect(userId);
	       
	       if (userId == null || user == null) {
	           loginChack(response);
	           return "redirect:/";
	       }

	       // 선택한 상품의 productIdk와 quantity
	       String[] productIdks = request.getParameterValues("bbsProductIdk");
	       String[] quantities = request.getParameterValues("bbsQuantity");
	       
	       List<Shop> productList = new ArrayList<Shop>();

	       //productList에 추가합니다.
	       if (productIdks != null && quantities != null) {
	           for (int i = 0; i < productIdks.length; i++) {
	               int productIdk = Integer.parseInt(productIdks[i]);
	               int quantity = Integer.parseInt(quantities[i]);
	               
	               Shop product = sellerService.productSelect(productIdk);
	               product.setQuantity(quantity);
	               
	               productList.add(product);
	           }
	       }
	       
	       List<String> couponList = sellerService.noUseCoupon(userId);

	       model.addAttribute("productList", productList);
	       model.addAttribute("user", user);
	       model.addAttribute("couponList", couponList);

	       return "/shop/orderPage";
	   }


	
		 @RequestMapping(value = "/shop/orderComplete", method = { RequestMethod.GET, RequestMethod.POST })
			public String orderComplete(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException{
				
				String userId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
				User user = userService.userSelect(userId);
				if(userId == null || user==null) {
					loginChack(response);
					return "redirect:/";
				}
				int orderIdk =0;
				
				try {
					orderIdk = (int) request.getSession().getAttribute("orderIdk");
				} catch (Exception e) {
					return "redirect:/";
				}
			    
				
				Order order = null;
				Pay pay = null;
				List<OrderComplete> orderComplete = null;
			    
				pay = sellerService.orderPaySelect(orderIdk);			//결제정보
				order = sellerService.orderSelect(orderIdk);		 	//주문 정보
				orderComplete = sellerService.orderComplete(orderIdk);	//주문 상품정보
				
				
				model.addAttribute("orderComplete",orderComplete);
				model.addAttribute("order", order);
				model.addAttribute("user", user);
				model.addAttribute("pay", pay);
				
				request.getSession().invalidate();
				
				return "/shop/orderComplete";
			}
	
		 @RequestMapping(value ="/shop/order", method = RequestMethod.POST)
		 @ResponseBody
		 public Response<Object> order(HttpServletRequest request, HttpServletResponse response) {
		     
		     Response<Object> ajaxResponse = new Response<Object>();
		     
		     int orderIdk = sellerService.orderSeqSelect();
		     String userId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		     
		     String redemCode = HttpUtil.get(request, "redemCode", "");
		     String deliveryAddress = HttpUtil.get(request, "deliveryAddress", "");
		     String deliveryPhone = HttpUtil.get(request, "deliveryPhone", "");
		     String deliveryName = HttpUtil.get(request, "deliveryName", "");
		     String deliveryContent = HttpUtil.get(request, "deliveryContent", "");
		     
		     int couponDiscountPrice = 0;
		     int totalPrice = 0;
		     
		     Order order = new Order();
		     
		     order.setOrderIdk(orderIdk);
		     order.setUserId(userId);     
		     order.setDeliveryAddress(deliveryAddress);
		     order.setDeliveryPhone(deliveryPhone);
		     order.setDeliveryName(deliveryName);
		     order.setDeliveryContent(deliveryContent);
		     
		     List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		     
		     String[] productIds = request.getParameterValues("productIdk[]");
		     String[] quantities = request.getParameterValues("quantity[]");
		     
		     for (int i = 0; i < productIds.length; i++) {
		         int productIdk = Integer.parseInt(productIds[i]);
		         int quantity = Integer.parseInt(quantities[i]);
		         
		         OrderDetail orderDetail = new OrderDetail();
		         Shop product = sellerService.productSelect(productIdk);
		         int productPrice = product.getProductPrice();
		         
		         orderDetail.setOrderIdk(orderIdk);
		         orderDetail.setProductIdk(productIdk);
		         orderDetail.setQuantity(quantity);
		         orderDetail.setProductPrice(productPrice);
		         
		         orderDetails.add(orderDetail);
		         
		         totalPrice += quantity * productPrice;
		     }
		     order.setTotalPrice(totalPrice);
		     order.setOrderDetailList(orderDetails);
		     
		     if (redemCode != null && !redemCode.isEmpty()) {
		         order.setRedemCode(redemCode);
		         
		         Coupon coupon = sellerService.couponSelect(redemCode);
		         if (coupon != null) {
		             int discount = coupon.getCouponDiscount();
		             
		             if (discount > 0) {
		                 couponDiscountPrice = (totalPrice * discount) / 100;
		             }
		             
		             coupon.setUserId(userId);
		             coupon.setOrderIdk(orderIdk);
		             coupon.setCouponDiscountPrice(couponDiscountPrice);
		             
		             order.setCouponDiscountPrice(couponDiscountPrice);
		             order.setCoupon(coupon);
		         }
		     }
		     
		     int actualPrice = totalPrice - couponDiscountPrice;
		     order.setActualPrice(actualPrice);
		     
		     try {
		         if (sellerService.orderInsert(order) > 0) {
		             JsonObject json = new JsonObject();
		             json.addProperty("orderIdk", orderIdk);
		             
		             ajaxResponse.setResponse(0, "success", json);
		             request.getSession().setAttribute("orderIdk", orderIdk);
		         } else {
		             ajaxResponse.setResponse(-1, "fail");
		         }
		     } catch (Exception e) {
		         logger.error("[sellerController] order Exception", e);
		         ajaxResponse.setResponse(500, "internal server error");
		     }
		     
		     return ajaxResponse;
		 }
	@RequestMapping(value ="/shop/fnCoupon", method = RequestMethod.POST)
	@ResponseBody
	public Response<Object> fnCoupon(HttpServletRequest request, HttpServletResponse response) {
		Response<Object> ajaxResponse = new Response<Object>();
		
		String redemCode = HttpUtil.get(request, "redemCode","");
		Coupon coupon = sellerService.couponSelect(redemCode);
		int discount = 0;
		if(coupon != null) {
			discount=coupon.getCouponDiscount();
		}
		
		JsonObject json = new JsonObject();
		json.addProperty("redemCode", redemCode);
		json.addProperty("discount", discount);
		
		ajaxResponse.setResponse(0, "success",json);
		
		return ajaxResponse;
	}
	
	//------------------------------------------------------
	
	@RequestMapping(value = "/seller/write")
	public String write(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute(name = "sellerId", required = false) String sellerId) throws IOException {
		
		if(sellerId == null) {
			loginChack(response);
			return "redirect:/";
		}
		
		Seller seller = sellerService.sellerSelect(sellerId);
		String tabCode = seller.getShopTabCode();
		List<Shop> tab = sellerService.tabSelect(tabCode);
		List<Shop> detailTab = sellerService.detailTabSelect(tabCode);
		
		
		model.addAttribute("seller",seller);
		model.addAttribute("tab",tab);
		model.addAttribute("detailTab",detailTab);
		
		return "/seller/write";
	}
	
	@RequestMapping(value="/seller/writeProc", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> writeProc(MultipartHttpServletRequest request, HttpServletResponse response, @SessionAttribute(name = "sellerId", required = false) String sellerId)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String tabCode = HttpUtil.get(request, "tabCode");
		String detailTabCode = HttpUtil.get(request, "detailTabCode");
		String productName = HttpUtil.get(request, "productName");
		int productPrice = HttpUtil.get(request, "productPrice",0);
		String productBrandName = HttpUtil.get(request, "productBrandName");
		String productCode = productCodeChange(sellerService.productCodeSelect());
		String productDescription = HttpUtil.get(request, "productDescription","");
		
		FileData bigFileData = HttpUtil.getFile(request, "bigFile", UPLOAD_SAVE_DIR + "\\product\\big", productCode);
	    FileData smallFileData = HttpUtil.getFile(request, "smallFile", UPLOAD_SAVE_DIR + "\\product\\small", productCode);
	    
		
		if(!StringUtil.isEmpty(tabCode) && !StringUtil.isEmpty(detailTabCode) && !StringUtil.isEmpty(productName)&& !StringUtil.isEmpty(productBrandName) && productPrice != 0 && !StringUtil.equals(productCode,"")
				&& bigFileData != null && bigFileData.getFileSize() > 0 && smallFileData != null && smallFileData.getFileSize() > 0)
		{
			
			if(sellerService.sellerSelect(sellerId) != null)
			{					
				Shop product = new Shop();
				
				product.setShopTabCode(tabCode);
				product.setShopDetailTabCode(detailTabCode);
				product.setProductCode(productCode);
				product.setProductPrice(productPrice);
				product.setSellerId(sellerId);
				product.setProductName(productName);
				product.setProductBrandName(productBrandName);
				product.setProductDescription(productDescription);

				if(StringUtil.equals(bigFileData.getFileExt(), smallFileData.getFileExt())) {
					product.setProductFileExt(bigFileData.getFileExt());
				}
				else {
					ajaxResponse.setResponse(-1, "FileExt not equals");
					return ajaxResponse;
				}
				
				if(sellerService.productInsert(product) > 0)
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
				ajaxResponse.setResponse(100, "not Seller ID");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request");
		}
		
		return ajaxResponse;
	}
	
	@RequestMapping(value="/seller/update", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> update(MultipartHttpServletRequest request, HttpServletResponse response, @SessionAttribute(name = "sellerId", required = false) String sellerId)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		int productIdk = HttpUtil.get(request, "productIdk", 0);
		Shop product = sellerService.productSelect(productIdk);
		
		if(product == null) {
			ajaxResponse.setResponse(-2, "Not Found product");
			return ajaxResponse;
		}
		
		String tabCode = HttpUtil.get(request, "tabCode");
		String detailTabCode = HttpUtil.get(request, "detailTabCode");
		String productName = HttpUtil.get(request, "productName");
		int productPrice = HttpUtil.get(request, "productPrice",0);
		String productBrandName = HttpUtil.get(request, "productBrandName");
		String productCode = product.getProductCode();
		String productDescription = HttpUtil.get(request, "productDescription","");
		String bigImg = HttpUtil.get(request, "bigImg");
		String smallImg = HttpUtil.get(request, "smallImg");
		
		FileData bigFileData = null;
		FileData smallFileData = null;
		
		
		if(StringUtil.equals(bigImg, "Y") && StringUtil.equals(smallImg, "Y")) {
			
			FileUtil.deleteFile(UPLOAD_SAVE_DIR + FileUtil.getFileSeparator() +"big" + FileUtil.getFileSeparator() + productCode+"."+product.getProductFileExt());
			FileUtil.deleteFile(UPLOAD_SAVE_DIR + FileUtil.getFileSeparator() +"small" + FileUtil.getFileSeparator() + productCode+"."+product.getProductFileExt());
			
			bigFileData = HttpUtil.getFile(request, "bigFile", UPLOAD_SAVE_DIR + "\\product\\big", productCode);
			smallFileData = HttpUtil.getFile(request, "smallFile", UPLOAD_SAVE_DIR + "\\product\\small", productCode);
		}
		
		if(!StringUtil.isEmpty(tabCode) && !StringUtil.isEmpty(detailTabCode) && !StringUtil.isEmpty(productName)&& !StringUtil.isEmpty(productBrandName) && productPrice != 0 && !StringUtil.equals(productCode,""))
		{
			
			if(sellerService.sellerSelect(sellerId) != null)
			{					
				product.setShopTabCode(tabCode);
				product.setShopDetailTabCode(detailTabCode);
				product.setProductName(productName);
				product.setProductPrice(productPrice);
				product.setProductBrandName(productBrandName);
				product.setProductDescription(productDescription);
				product.setProductFileExt(product.getProductFileExt());
				
				if(bigFileData != null && smallFileData != null) {
					if(StringUtil.equals(bigFileData.getFileExt(), smallFileData.getFileExt())) {
						product.setProductFileExt(bigFileData.getFileExt());
					}
					else {
						ajaxResponse.setResponse(-1, "FileExt not equals");
						return ajaxResponse;
					}
				}
				
				if(sellerService.productUpdate(product) > 0)
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
				ajaxResponse.setResponse(100, "not Seller ID");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "Bad Request");
		}
		
		return ajaxResponse;
	}
	
	@RequestMapping(value="/seller/delete", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> delete(HttpServletRequest request, HttpServletResponse response, @SessionAttribute(name = "sellerId", required = false) String sellerId)
	{
		Response<Object> ajaxResponse = new Response<Object>();

		int productIdk = HttpUtil.get(request, "productIdk", 0);
		String status = HttpUtil.get(request, "status","");
		
		if(productIdk!=0 && !StringUtil.equals(status, "")) {
			Shop param = new Shop();
			
			param.setProductIdk(productIdk);
			param.setProductStatus(status);
			
			if(sellerService.productStatusUpdate(param)>0){
				ajaxResponse.setResponse(0, "Success");
			}
			else {
				ajaxResponse.setResponse(-1, "SQL Fail");
			}
		}
		else {
			ajaxResponse.setResponse(404, "Not Found");
		}
		
		return ajaxResponse;
	}
	
	@RequestMapping(value = "/seller/main")
	public String main(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute(name = "sellerId", required = false) String sellerId) throws IOException {
		
				if(sellerId == null) {
					loginChack(response);
					return "redirect:/";
				}

				Seller seller = sellerService.sellerSelect(sellerId);
				String shopTabCode = "";
				
				if(seller != null) {
					shopTabCode = seller.getShopTabCode();
				}
				
				String tabCode = shopTabCode;
				List<Shop> tab = sellerService.tabSelect(tabCode);
				List<Shop> detailTab = sellerService.detailTabSelect(tabCode); //가입한 판매자관리 상세탭
				
				String detailTabCode = HttpUtil.get(request, "detailTabCode",""); //판매자가 검색한 상세탭
				String status = HttpUtil.get(request, "status","");
				String searchType = HttpUtil.get(request, "searchType","");
				String searchValue = HttpUtil.get(request, "searchValue","");

				int curPage = HttpUtil.get(request, "curPage", 1);

				int totalCount = 0;

				Paging paging = null;

				List<Shop> list = null;
				
				Shop param = new Shop();

				param.setSellerId(sellerId);
				param.setProductStatus(status);
				param.setShopTabCode(tabCode);
				param.setShopDetailTabCode(detailTabCode);
				
				if(!StringUtil.isEmpty(searchType) && !StringUtil.isEmpty(searchValue))
				{
					if(StringUtil.equals(searchType, "1"))
					{
						param.setProductName(searchValue);
					}
					else if(StringUtil.equals(searchType, "2"))
					{
						param.setProductBrandName(searchValue);
					}
					else
					{
						searchType = "";
						searchValue = "";
					}
				}
				else
				{
					searchType = "";
					searchValue = "";
				}
				
				
				totalCount= sellerService.productListCount(param);
				
				if(totalCount > 0)
				{
					paging = new Paging("/seller/main", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
					
					param.setStartRow(paging.getStartRow());
					param.setEndRow(paging.getEndRow());

					
					list = sellerService.productList(param);
					
				}
				
				model.addAttribute("list", list);
				model.addAttribute("searchType", searchType);
				model.addAttribute("searchValue", searchValue);
				model.addAttribute("detailTabCode", detailTabCode);
				model.addAttribute("status", status);
				model.addAttribute("curPage", curPage);
				model.addAttribute("paging", paging);
				model.addAttribute("seller", seller);
				model.addAttribute("detailTab", detailTab);
				model.addAttribute("tab", tab);
				model.addAttribute("tabCode", tabCode);
		
		return "/seller/main";
	}
	
	@RequestMapping(value = "/seller/delivery")
	public String delivery(Model model, HttpServletRequest request, HttpServletResponse response, @SessionAttribute(name = "sellerId", required = false) String sellerId) throws IOException {
		
		if(sellerId == null) {
			loginChack(response);
			return "redirect:/";
		}

		Seller seller = sellerService.sellerSelect(sellerId);
		String status = HttpUtil.get(request, "status","");
		String searchType = HttpUtil.get(request, "searchType","");
		String searchValue = HttpUtil.get(request, "searchValue","");

		
		int curPage = HttpUtil.get(request, "curPage", 1);
		
		Paging paging = null;
		int totalCount =0;
		List<Delivery> list = null;
		
		
		Delivery param = new Delivery();
		param.setSellerId(sellerId);
		param.setDeliveryStatus(status);
		
		if(!StringUtil.isEmpty(searchType) && !StringUtil.isEmpty(searchValue))
		{
			if(StringUtil.equals(searchType, "1"))
			{
				param.setProductName(searchValue);
			}
			else if(StringUtil.equals(searchType, "2"))
			{
				param.setProductBrandName(searchValue);
			}
			else
			{
				searchType = "";
				searchValue = "";
			}
		}
		else
		{
			searchType = "";
			searchValue = "";
		}
		
		totalCount= sellerService.deliveryListCount(param);
		
		if(totalCount > 0)
		{
			paging = new Paging("/seller/delivery", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
			
			param.setStartRow(paging.getStartRow());
			param.setEndRow(paging.getEndRow());

			
			list = sellerService.deliveryList(param);
			if(list != null) {
				for(int i = 0;i<list.size();i++) {
					DeliveryDetail detail = new DeliveryDetail();
					
					detail.setOrderIdk(list.get(i).getOrderIdk());
					
					List<DeliveryDetail> DetailList = sellerService.deliveryDetailSelect(detail);
					
					list.get(i).setDeliveryList(DetailList);
				}
			}
			
		}
		
		model.addAttribute("list", list);
		model.addAttribute("curPage", curPage);
		model.addAttribute("paging", paging);
		model.addAttribute("status", status);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);

		
		return "/seller/delivery";
	}
	
	@RequestMapping(value="/seller/login", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> login(HttpServletRequest request, HttpServletResponse response)
	{
		String sellerId = HttpUtil.get(request, "sellerId");
		String sellerPwd = HttpUtil.get(request, "sellerPwd");
		Response<Object> ajaxResponse = new Response<Object>();
				
		if(!StringUtil.isEmpty(sellerId) && !StringUtil.isEmpty(sellerPwd))
		{
			Seller seller = sellerService.sellerSelect(sellerId);
			
			if(seller != null)
			{
				if(StringUtil.equals(seller.getSellerPwd(), sellerPwd))
				{
					request.getSession().invalidate();
					HttpSession session = request.getSession(true);
					session.setAttribute("sellerId", seller.getSellerId());
					session.setMaxInactiveInterval(3600); //1800 = 30분
					
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
		

		
		return ajaxResponse;
	}
	
	@RequestMapping(value="/seller/logout")
    public String logout(HttpServletRequest request, Model model) {

        HttpSession session = request.getSession(false);  // Session이 없으면 null return
        if(session != null) {
            session.invalidate();
        }
        
        return "redirect:/";
    }
	
	@RequestMapping(value ="/seller/deliveryStatus", method = RequestMethod.POST)
	@ResponseBody
	public Response<Object> deliveryStatus(HttpServletRequest request, HttpServletResponse response) {
		Response<Object> ajaxResponse = new Response<Object>();
		
		int orderIdk = HttpUtil.get(request, "orderIdk",0);
		String status = HttpUtil.get(request, "status");
		
		if(!StringUtil.isEmpty(status) && !(orderIdk ==0)) {
			Order param = new Order();
			
			param.setOrderIdk(orderIdk);
			param.setDeliveryStatus(status);
			
			if(sellerService.deliveryStatusUpdate(param) > 0) {
				ajaxResponse.setResponse(0, "Success");
			}else {
				ajaxResponse.setResponse(-1, "SQL Fail");
			}
		}
		else {
			ajaxResponse.setResponse(400, "Bad Request");
		}
		
		return ajaxResponse;
	}

}
