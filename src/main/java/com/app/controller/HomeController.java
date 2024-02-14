package com.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.RecipeSearchCondition;
import com.app.dto.product.Product;
import com.app.dto.product.ProductSearchCondition;
import com.app.service.postRecipe.PostRecipeService;
import com.app.service.product.ProductService;


@Controller
public class HomeController {

	
	@Autowired
	PostRecipeService postRecipeService;

	@Autowired
	ProductService productSerive;
	
	@RequestMapping("/")
	public String home(Model model, RecipeSearchCondition recipeSearchCondition,
			ProductSearchCondition productSearchCondition
			
			) {

//return "/WEB-INF/views/home.jsp";
//return "/WEB-INF/views/mainpage.jsp";

//--ViewResolver 설정 이후
		
//		테스트용(MJ)
		List<PostRecipe> recipeList = postRecipeService.findRecipeListBySearchCondition(recipeSearchCondition);
		 List<Product> productList = productSerive.findProductListBySearchCondition(productSearchCondition);
		model.addAttribute("recipeList", recipeList);
		 model.addAttribute("productList", productList);
		return "main";
		
		
		
	}
	
	

}