package com.icia.sweethome.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.icia.sweethome.util.CookieUtil;

@Controller("AdminCommunityController")
public class AdminCommunityController {
	
	private static Logger logger = LoggerFactory.getLogger(AdminCommunityController .class);
	
    //쿠키명
    @Value("#{env['auth.cookie.name']}")
    private String AUTH_COOKIE_NAME;	   
	
	
	@RequestMapping(value = "/admin/adminCommunity")
	public String adminCommunity(Model model, HttpServletRequest request, HttpServletResponse response) {
		
	    //쿠키 값
	    String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
	    
	    logger.debug("cookieUserId : " + cookieUserId);
		
		
		
		
		
		return "/admin/adminCommunity";
	}

	
}
