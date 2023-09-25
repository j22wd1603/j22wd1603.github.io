package com.icia.sweethome.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("AdminUserController")
public class AdminUserController {
	
	private static Logger logger = LoggerFactory.getLogger(AdminUserController .class);
	
	
    //쿠키명
    @Value("#{env['auth.cookie.name']}")
    private String AUTH_COOKIE_NAME;	   	

	
	@RequestMapping(value = "/admin/adminUser")
	public String adminUser(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		
		return "/admin/adminUser";
	}	
	
	
}
