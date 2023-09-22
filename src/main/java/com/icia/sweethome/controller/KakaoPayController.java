package com.icia.sweethome.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.icia.sweethome.model.KakaoPayApprove;
import com.icia.sweethome.model.KakaoPayOrder;
import com.icia.sweethome.model.KakaoPayReady;
import com.icia.sweethome.model.Order;
import com.icia.sweethome.model.Pay;
import com.icia.sweethome.model.Response;
import com.icia.sweethome.model.Shop;
import com.icia.sweethome.service.KakaoPayService;
import com.icia.sweethome.service.SellerService;
import com.icia.sweethome.util.CookieUtil;
import com.icia.sweethome.util.HttpUtil;
import com.icia.sweethome.util.StringUtil;

@Controller("kakaoPayController")
public class KakaoPayController 
{
	private static Logger logger = LoggerFactory.getLogger(KakaoPayController.class);
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Autowired
	private SellerService sellerService;
	
	//쿠키명
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;
	
	@RequestMapping(value="/kakao/payPopUp", method=RequestMethod.POST)
	public String payPopUp(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		String pcUrl = HttpUtil.get(request, "pcUrl", "");
		String orderId = HttpUtil.get(request, "orderId", "");
		String tId = HttpUtil.get(request, "tId", "");
		String userId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		model.addAttribute("pcUrl", pcUrl);
		model.addAttribute("orderId", orderId);
		model.addAttribute("tId", tId);
		model.addAttribute("userId", userId);
		
		return "/kakao/payPopUp";
	}
			
	@RequestMapping(value="/kakao/payReady", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> payReady(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		Order order = null;
		String orderId = HttpUtil.get(request, "orderId", "");
		if(StringUtil.isNumber(orderId)) {
			order = sellerService.orderSelect(Integer.parseInt(orderId));
		}
		else {
			ajaxResponse.setResponse(-999, "orderId is not number ", null);
			return ajaxResponse;
		}
		String userId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		String itemCode = HttpUtil.get(request, "productIdk", "");
		logger.debug("itemCode : "+itemCode);
		Shop product = null;
		
		if(StringUtil.isNumber(itemCode)) {
			product = sellerService.productSelect(Integer.parseInt(itemCode));
		}
		else {
			ajaxResponse.setResponse(-998, "productIdk is not number ", null);
			return ajaxResponse;
		}
		String itemName = "";
		if(product != null) {
			itemName = product.getProductName();
		}
		int quantity = HttpUtil.get(request, "quantity", (int)0);
		int totalAmount =0;
		if(order != null) {
			totalAmount = order.getActualPrice();
		}
		int taxFreeAmount = HttpUtil.get(request, "taxFreeAmount", (int)0);
		int vatAmount = HttpUtil.get(request, "vatAmount", (int)0);
		
		KakaoPayOrder kakaoPayOrder = new KakaoPayOrder();
		
		kakaoPayOrder.setPartnerOrderId(orderId);
		kakaoPayOrder.setPartnerUserId(userId);
		kakaoPayOrder.setItemCode(itemCode);
		kakaoPayOrder.setItemName(itemName);
		kakaoPayOrder.setQuantity(quantity);
		kakaoPayOrder.setTotalAmount(totalAmount);
		kakaoPayOrder.setTaxFreeAmount(taxFreeAmount);
		kakaoPayOrder.setVatAmount(vatAmount);
		
		KakaoPayReady kakaoPayReady = kakaoPayService.kakaoPayReady(kakaoPayOrder);
		
		if(kakaoPayReady != null)
		{

			logger.debug("[KakaoPayController] payReady : " + kakaoPayReady);
			
			
			
			kakaoPayOrder.settId(kakaoPayReady.getTid());
			
			JsonObject json = new JsonObject();
			
			json.addProperty("orderId", orderId);
			json.addProperty("tId", kakaoPayReady.getTid());
			json.addProperty("appUrl", kakaoPayReady.getNext_redirect_app_url());
			json.addProperty("mobileUrl", kakaoPayReady.getNext_redirect_mobile_url());
			json.addProperty("pcUrl", kakaoPayReady.getNext_redirect_pc_url());
			
			ajaxResponse.setResponse(0, "success", json);
		}
		else
		{
			ajaxResponse.setResponse(-1, "fail", null);
		}

		
		return ajaxResponse;
	}
		
	@RequestMapping(value="/kakao/paySuccess")
	public String paySuccess(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		
		String pgToken = HttpUtil.get(request, "pg_token", "");
		
		model.addAttribute("pgToken", pgToken);
		
		return "/kakao/paySuccess";
	}
			
	@RequestMapping(value="/kakao/payResult")
	public String payResult(ModelMap model, HttpServletRequest request, HttpServletResponse response)
	{
		KakaoPayApprove kakaoPayApprove = null;
		
		String tId = HttpUtil.get(request, "tId", "");
		String orderId = HttpUtil.get(request, "orderId", "");
		String userId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String pgToken = HttpUtil.get(request, "pgToken", "");

		if(StringUtil.isNumber(orderId)) {	
			KakaoPayOrder kakaoPayOrder = new KakaoPayOrder();
			
			kakaoPayOrder.setPartnerOrderId(orderId);
			kakaoPayOrder.setPartnerUserId(userId);
			kakaoPayOrder.settId(tId);
			kakaoPayOrder.setPgToken(pgToken);

			if(sellerService.orderPayUpdate(Integer.parseInt(orderId)) > 0) {
				kakaoPayApprove = kakaoPayService.kakaoPayApprove(kakaoPayOrder);
				Pay pay = new Pay();
				pay.setAid(kakaoPayApprove.getAid());
				pay.setTid(kakaoPayApprove.getTid());
				pay.setCid(kakaoPayApprove.getCid());
				pay.setOrderIdk(Integer.parseInt(orderId));
				pay.setUserId(userId);
				pay.setPayMethodType(kakaoPayApprove.getPayment_method_type());
				pay.setApprovedDate(kakaoPayApprove.getApproved_at());
				
				sellerService.payInsert(pay);
			}
		}		
		
		model.addAttribute("kakaoPayApprove", kakaoPayApprove);
		
		return "/kakao/payResult";
	}
			
	//결제 취소시
	@RequestMapping(value="/kakao/payCancel")
	public String payCancel(HttpServletRequest request, HttpServletResponse response)
	{
		return "/kakao/payCancel";
	}
	
	//결제 실패시		
	@RequestMapping(value="/kakao/payFail")
	public String payFail(HttpServletRequest request, HttpServletResponse response)
	{
		return "/kakao/payFail";
	}			
			
	
}
