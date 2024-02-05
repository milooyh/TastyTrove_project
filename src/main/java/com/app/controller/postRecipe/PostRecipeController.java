package com.app.controller.postRecipe;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

		return "postRecipe/post";
	}


	// 이미지 1장 저장
	@PostMapping("/recipe/post")
	public String saveRecipePostProcess(RecipeImageRequestFrom requestForm, @ModelAttribute PostRecipe recipe) {
		
		
		System.out.println(requestForm);
		//파일첨부 안하면 등록 페이지로 이동
		//스크립트로 파일 없을 시 경고 창 뜨게끔 구현 고려
		if(requestForm.getRecipeImage().getSize() == 0) {
			return "redirect:/recipe/post";
		}

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
	
//	//레시피 리스트
//	@GetMapping("/recipe")
//	public String recipeList(Model model) {
//		List<PostRecipe> recipeList = postRecipeService.findRecipeList();
//		model.addAttribute("recipeList", recipeList);
//		
//		return "recipe/recipe";
//	}
	
	//검색기능 추가된 레시피 리스트
	@GetMapping("/recipe")
	public String recipeList (Model model, RecipeSearchCondition recipeSearchCondition) {
		System.out.println(recipeSearchCondition);
		
		List<PostRecipe> recipeList = postRecipeService.findRecipeListBySearchCondition(recipeSearchCondition);
		
		model.addAttribute("recipeList", recipeList);
		
		return "recipe/recipe";
		
	}
	
	
	
	@PostMapping("/recipe")
	public String postRecipe() {
		return "redirect:/recipe/post";
	}

	// 레시피 상세
	@RequestMapping("/recipe/recipeInfo")
	public String recipeInfo(@RequestParam int id, Model model) {

		PostRecipe recipe = postRecipeService.findRecipeInfoById(id);

		RecipeFileInfo recipeFileInfo = recipeFileService.findRecipeFileInfoByFileId(recipe.getRecipeFileId());
		
		String fullRecipeFilePath = recipeFileInfo.getRecipeFilePath() + recipeFileInfo.getRecipeFileName();
		System.out.println(recipeFileInfo.getRecipeFilePath());
		System.out.println(recipeFileInfo.getRecipeFileName());
		
		model.addAttribute("recipeTitle", recipe.getRecipeTitle());
		model.addAttribute("memberId", recipe.getMemberId());
		model.addAttribute("recipeContent", recipe.getRecipeContent());
		model.addAttribute("recipeType", recipe.getRecipeType());
		model.addAttribute("boardDate", recipe.getBoardDate());
		model.addAttribute("fullRecipeFilePath", fullRecipeFilePath);

		return "recipe/recipeInfo";
	}

}
