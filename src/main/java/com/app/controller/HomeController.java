package com.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.user.Visitor;
import com.app.service.admin.AdminService;

@Controller
public class HomeController {

	@Autowired
	AdminService adminService;	
	
	@RequestMapping("/")
	public String home(HttpServletRequest request, Visitor visitor) {
		String userId = request.getSession().getId();
		String pageUrl = "/";
		
		visitor.setUserId(userId);
		visitor.setPageUrl(pageUrl);
		
		adminService.saveVisitor(visitor);
		return "home";
	}
	
	

}