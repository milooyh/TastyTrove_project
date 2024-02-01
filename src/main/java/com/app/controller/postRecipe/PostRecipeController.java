package com.app.controller.postRecipe;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.app.dto.postRecipe.PostRecipe;
import com.app.service.postRecipe.PostRecipeService;

@Controller
public class PostRecipeController {
	
	@Autowired
	PostRecipeService postRecipeService;
	
	
	@RequestMapping("/recipe/post")
	public String post() {
		
		return "postRecipe/post";
	}
	
	@PostMapping("/recipe/post")
	public String saveRecipePostProcess(@ModelAttribute PostRecipe recipe) {
		
		
		int result = postRecipeService.saveRecipePost(recipe);

		
		if(result > 0) { //저장이 성공
			return "redirect:/";  //main 요청 경로
		} else { //저장 실패
			return "postRecipe/post"; //view 파일경로
		}
	}
	
	//-------------------------------테스트---------------------------------------------------
	private String realPath = "D:\\fileStorage"; //이미지 저장 루트 / 로컬장소
	@RequestMapping(value = "/recipe/post", produces="application/json; charset=utf8")
	@RequestBody
	public String uploadRecipeImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request) {
		//JSON 객체 생성
		Jsonobject
	}
	
	
	//-------------------------------테스트---------------------------------------------------
	
	

}
