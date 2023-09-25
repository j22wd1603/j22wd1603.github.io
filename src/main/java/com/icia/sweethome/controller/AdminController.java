package com.icia.sweethome.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.icia.sweethome.model.Admin;
import com.icia.sweethome.model.Response;
import com.icia.sweethome.model.User;
import com.icia.sweethome.service.AdminService;
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
	
	@RequestMapping(value = "/admin/main")
	public String main(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		
		return "/admin/main";
	}
	
	
	@RequestMapping(value="/admin/login", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> login(HttpServletRequest request, HttpServletResponse response)
	{
		String userId = HttpUtil.get(request, "userId");
		String userPwd = HttpUtil.get(request, "userPwd");
		Response<Object> ajaxResponse = new Response<Object>();

		if(!StringUtil.isEmpty(userId) && !StringUtil.isEmpty(userPwd))
		{
			Admin admin = adminService.adminSelect(userId);
			
			if(admin != null)
			{
				
				if(StringUtil.equals(admin.getAdminPwd(), userPwd))
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
			logger.debug("[AdminController] /admin/login response\n" + JsonUtil.toJsonPretty(ajaxResponse));
		}
		
		return ajaxResponse;
	}	
	
	
}
