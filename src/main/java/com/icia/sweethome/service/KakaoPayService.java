package com.icia.sweethome.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.icia.sweethome.model.KakaoPayApprove;
import com.icia.sweethome.model.KakaoPayOrder;
import com.icia.sweethome.model.KakaoPayReady;

@Service("kakaoPayService")
public class KakaoPayService 
{
	private static Logger logger = LoggerFactory.getLogger(KakaoPayService.class);
	
	//카카오페이 호스트
	@Value("#{env['kakao.pay.host']}")
	private String KAKAO_PAY_HOST;
	
	//카카오페이 관리자 키
	@Value("#{env['kakao.pay.admin.key']}")
	private String KAKAO_PAY_ADMIN_KEY;
	
	//카카오페이 가맹점 코드, 10자
	@Value("#{env['kakao.pay.cid']}")
	private String KAKAO_PAY_CID;
	
	//카카오페이 결제 URL
	@Value("#{env['kakao.pay.ready.url']}")
	private String KAKAO_PAY_READY_URL;
	
	//카카오페이 결제 요청 URL
	@Value("#{env['kakao.pay.approve.url']}")
	private String KAKAO_PAY_APPROVE_URL;
	
	//카카오페이 결제 성공 URL
	@Value("#{env['kakao.pay.success.url']}")	
	private String KAKAO_PAY_SUCCESS_URL;
	
	//카카오페이 결제 취소 URL
	@Value("#{env['kakao.pay.cancel.url']}")
	private String KAKAO_PAY_CANCEL_URL;
	
	//카카오페이 결제 실패 URL
	@Value("#{env['kakao.pay.fail.url']}")
	private String KAKAO_PAY_FAIL_URL;
	
	
	//결제 준비
	public KakaoPayReady kakaoPayReady(KakaoPayOrder kakaoPayOrder)
	{
		KakaoPayReady kakaoPayReady = null;
		
		if(kakaoPayOrder != null)
		{
			RestTemplate restTemplate = new RestTemplate();
			
			//서버로 요청할 header
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", "KakaoAK " + KAKAO_PAY_ADMIN_KEY);
			headers.add("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
			MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
			params.add("cid", KAKAO_PAY_CID);	
			params.add("partner_order_id", kakaoPayOrder.getPartnerOrderId());
			params.add("partner_user_id", kakaoPayOrder.getPartnerUserId());
			params.add("item_name", kakaoPayOrder.getItemName());
			params.add("item_code", kakaoPayOrder.getItemCode());
			params.add("quantity", String.valueOf(kakaoPayOrder.getQuantity()));
			params.add("total_amount", String.valueOf(kakaoPayOrder.getTotalAmount()));
			params.add("tax_free_amount", String.valueOf(kakaoPayOrder.getTaxFreeAmount()));
			params.add("approval_url", KAKAO_PAY_SUCCESS_URL);	//결제 성공시
			params.add("cancel_url", KAKAO_PAY_CANCEL_URL);		//결제 취소시
			params.add("fail_url", KAKAO_PAY_FAIL_URL);			//결세 실패시

			HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers); 
			
			try
			{
				kakaoPayReady = restTemplate.postForObject(new URI(KAKAO_PAY_HOST + KAKAO_PAY_READY_URL), body, KakaoPayReady.class);
				
			}
			catch(RestClientException e)
			{
				logger.error("[KakaoPayService] kakaoPayReady RestClientException", e);
			}
			catch(URISyntaxException e)
			{
				logger.error("[KakaoPayService] kakaoPayReady URISyntaxException", e);
			}
		}
		else
		{
			logger.error("[KakaoPayService] kakaoPayReady kakaoPayOrder is null");
		}
		
		return kakaoPayReady;		
	}
	
	public KakaoPayApprove kakaoPayApprove(KakaoPayOrder kakaoPayOrder)
	{
		KakaoPayApprove kakaoPayApprove= null;
		
		if(kakaoPayOrder != null)
		{
			RestTemplate restTemplate = new RestTemplate();
			
			//서버로 요청할 header
			HttpHeaders headers = new HttpHeaders();
			headers.add("Authorization", "KakaoAK " + KAKAO_PAY_ADMIN_KEY);
			headers.add("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
			
			//서버로 요청할 body
			MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
			params.add("cid", KAKAO_PAY_CID);	
			params.add("tid", kakaoPayOrder.gettId());	
			params.add("partner_order_id", kakaoPayOrder.getPartnerOrderId());	
			params.add("partner_user_id", kakaoPayOrder.getPartnerUserId());	
			params.add("pg_token", kakaoPayOrder.getPgToken());
			
			HttpEntity<MultiValueMap<String,String>> body = new HttpEntity<MultiValueMap<String,String>>(params, headers); 
			
			try
			{
				kakaoPayApprove = restTemplate.postForObject(new URI(KAKAO_PAY_HOST + KAKAO_PAY_APPROVE_URL), body, KakaoPayApprove.class);
				
			}
			catch(RestClientException e)
			{
				logger.error("[KakaoPayService] kakaoPayApprove RestClientException", e);
			}
			catch(URISyntaxException e)
			{
				logger.error("[KakaoPayService] kakaoPayApprove URISyntaxException", e);
			}
		}
		else
		{
			logger.error("[KakaoPayService] kakaoPayApprove kakaoPayOrder is null");
		}
		
		return kakaoPayApprove;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
