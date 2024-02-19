package com.app.controller.postRecipe;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.RecipeImageRequestFrom;
import com.app.dto.postRecipe.RecipeSearchCondition;
import com.app.dto.util.RecipeFileInfo;
import com.app.service.postRecipe.PostRecipeService;
import com.app.service.recipeFile.RecipeFileService;
import com.app.util.RecipeFileManager;

@Controller
public class PostRecipeController {

	@Autowired
	RecipeFileManager recipeFileManager;

	@Autowired
	RecipeFileService recipeFileService;

	@Autowired
	PostRecipeService postRecipeService;

	@RequestMapping("/recipe/post")
	public String post() {

		return "recipe/post";
	}
	
	
	@PostMapping("/recipe")
	public String postRecipe() {
		return "redirect:/recipe/post";
	}


	// 이미지 1장 저장
	@PostMapping("/recipe/post")
	public String saveRecipePostProcess(RecipeImageRequestFrom requestForm, @ModelAttribute PostRecipe recipe) {
		
		
		System.out.println(requestForm);


		try {
			RecipeFileInfo recipeFileInfo = recipeFileManager.storeFile(requestForm.getRecipeImage());

			int result = recipeFileService.saveRecipeFileInfo(recipeFileInfo);
			System.out.println("result" + result);

			if (result > 0) {
				RecipeFileInfo savaRecipeFileInfo = recipeFileService
						.findRecipeFileInfoByFileName(recipeFileInfo.getRecipeFileName());

				// 레시피 정보 저장
				recipe.setRecipeFileId(savaRecipeFileInfo.getRecipeFileId());
				int result2 = postRecipeService.saveRecipePost(recipe);

			}

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("catch1 발생");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("catch2 발생");
		}

		return "redirect:/recipe";

	}
	
	//레시피 수정 페이지
	@GetMapping("/recipe/modifyRecipe")
	public String modifyRecipe(@RequestParam int id, Model model) {
		
		PostRecipe recipe = postRecipeService.findRecipeInfoById(id);

		RecipeFileInfo recipeFileInfo = recipeFileService.findRecipeFileInfoByFileId(recipe.getRecipeFileId());
		
		String fullRecipeFilePath = recipeFileInfo.getRecipeFilePath() + recipeFileInfo.getRecipeFileName();
		System.out.println(recipeFileInfo.getRecipeFilePath());
		System.out.println(recipeFileInfo.getRecipeFileName());
		
		model.addAttribute("recipeId", recipe.getRecipeId());
		model.addAttribute("recipeTitle", recipe.getRecipeTitle());
		model.addAttribute("memberId", recipe.getMemberId());
		model.addAttribute("recipeContent", recipe.getRecipeContent());
		model.addAttribute("recipeType", recipe.getRecipeType());
		model.addAttribute("boardDate", recipe.getBoardDate());
		model.addAttribute("recipeFileId", recipe.getRecipeFileId());
		model.addAttribute("fullRecipeFilePath", fullRecipeFilePath);

		return "recipe/modifyRecipe";
	}
	
	//수정 레시피 저장
	@PostMapping("/recipe/modifyRecipe")
	public String modifyRecipeProcess(PostRecipe postRecipe, @RequestParam int id, Model model, RecipeImageRequestFrom requestForm) {
		
		postRecipe.setRecipeId(id);
		
		System.out.println(postRecipe);
		System.out.println(requestForm);
		
		try {
			
			if(requestForm.getRecipeImage().getSize() != 0) {
				System.out.println("파일도 수정한다.");
				
				int recipeId = postRecipe.getRecipeId();
				
				System.out.println(recipeId);
				
				RecipeFileInfo recipeFileInfo = recipeFileManager.storeFile(requestForm.getRecipeImage());
				recipeFileInfo.setRecipeFileId(recipeId);
				
				int result = recipeFileService.modifyRecipeFileInfo(recipeFileInfo);
				
			}

			
			int result2 = postRecipeService.modifyRecipe(postRecipe);
			
			if(result2 > 0) {
				System.out.println("수정성공");
				return "redirect:/recipe";
			}else {
				System.out.println("수정실패");
				return "recipe";
			}
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return "redirect:/recipe";
		
		
	}
	
	//레시피 삭제
	@RequestMapping("/recipe/removeRecipe")
	public String removeRecipeProcess(@RequestParam int id) {
		System.out.println("/removeRecipe 실행됨 레시피 아이디 : "+id);
		
		//아이디에 따른 레시피 찾기
		PostRecipe recipe = postRecipeService.findRecipeInfoById(id);
		int recipeFileId = recipe.getRecipeFileId();
		
		System.out.println("recipeFileId : " + recipeFileId);
		
		//찾은 레시피의 이미지 DB 정보 삭제
		int result2 = recipeFileService.removeRecipeFileInfo(recipeFileId);
		int result = postRecipeService.removeRecipeById(id);
		
		
		if(result > 0 && result2 >0) {
			System.out.println("삭제성공");
			return "redirect:/recipe";
		}else {
			System.out.println("삭제실패");
			return "recipe/recipe";
		}
		
	}

	
	//검색기능 + 페이징 추가된 레시피 리스트
	@GetMapping("/recipe")
	public String recipeList (Model model, @ModelAttribute("recipeSearchCondition")RecipeSearchCondition recipeSearchCondition) {
		System.out.println(recipeSearchCondition);
		
		int total = postRecipeService.getTotal(recipeSearchCondition);
		recipeSearchCondition.setTotalRowCount(total);
		recipeSearchCondition.pageSetting();
		
		
		List<PostRecipe> recipeList = postRecipeService.findRecipeListBySearchCondition(recipeSearchCondition);
				
		model.addAttribute("recipeList", recipeList);
		
		System.out.println(recipeList);
		
		return "recipe/recipe";
		
	}
	
	

	// 레시피 상세
	@RequestMapping("/recipe/recipeInfo")
	public String recipeInfo(@RequestParam int id, Model model, HttpSession session) {
		
		String sessionId = (String)session.getAttribute("userId");
		
		System.out.println(sessionId);

		PostRecipe recipe = postRecipeService.findRecipeInfoById(id);

		RecipeFileInfo recipeFileInfo = recipeFileService.findRecipeFileInfoByFileId(recipe.getRecipeFileId());
		
		String fullRecipeFilePath = recipeFileInfo.getRecipeFilePath() + recipeFileInfo.getRecipeFileName();
		System.out.println(recipeFileInfo.getRecipeFilePath());
		System.out.println(recipeFileInfo.getRecipeFileName());
		
		model.addAttribute("recipeId", recipe.getRecipeId());
		model.addAttribute("recipeTitle", recipe.getRecipeTitle());
		model.addAttribute("memberId", recipe.getMemberId());
		model.addAttribute("recipeContent", recipe.getRecipeContent());
		model.addAttribute("recipeType", recipe.getRecipeType());
		model.addAttribute("boardDate", recipe.getBoardDate());
		model.addAttribute("fullRecipeFilePath", fullRecipeFilePath);
		model.addAttribute("userNickname", recipe.getUserNickname());
		model.addAttribute("sessionId", sessionId);

		return "recipe/recipeInfo";
	}

}
