package com.icia.sweethome.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("AdminCsController")
public class AdminCsController {
	
	private static Logger logger = LoggerFactory.getLogger(AdminCsController .class);
	
    //쿠키명
    @Value("#{env['auth.cookie.name']}")
    private String AUTH_COOKIE_NAME;	   	
	
	@RequestMapping(value = "/admin/adminCs")
	public String adminCs(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		
		return "/admin/adminCs";
	}

	
}
