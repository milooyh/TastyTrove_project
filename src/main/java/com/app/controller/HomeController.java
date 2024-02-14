package com.app.controller;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.user.Visitor;
import com.app.service.admin.AdminService;
import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.RecipeSearchCondition;
import com.app.service.postRecipe.PostRecipeService;

@Controller
public class HomeController {

	@Autowired
	AdminService adminService;

	@Autowired
	PostRecipeService postRecipeService;


	@RequestMapping("/")
	public String home(Model model, RecipeSearchCondition recipeSearchCondition, HttpServletRequest request,
			Visitor visitor) {

//return "/WEB-INF/views/home.jsp";
//return "/WEB-INF/views/mainpage.jsp";

//--ViewResolver 설정 이후

//		테스트용(MJ)
		List<PostRecipe> recipeList = postRecipeService.findRecipeListBySearchCondition2(recipeSearchCondition);
		model.addAttribute("recipeList", recipeList);
		
//		방문자수 카운트
		String userId = request.getSession().getId();
		String pageUrl = "/";

		visitor.setUserId(userId);
		visitor.setPageUrl(pageUrl);

		adminService.saveVisitor(visitor);

		return "main";

	}

}