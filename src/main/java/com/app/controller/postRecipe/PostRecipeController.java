package com.app.controller.postRecipe;


import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.RecipeImage;
import com.app.dto.util.RecipeFileInfo;
import com.app.service.postRecipe.PostRecipeService;
import com.app.service.recipeFile.recipeFileService;
import com.app.util.RecipeFileManager;

@Controller
public class PostRecipeController {

	@Autowired
	RecipeFileManager recipeFileManager;
	
	@Autowired
	recipeFileService recipeFileService;
	
	
	@Autowired
	PostRecipeService postRecipeService;

	@RequestMapping("/recipe/post")
	public String post() {

		return "postRecipe/post";
	}

	//이미지XXXX 데이터 저장
//	@PostMapping("/recipe/post")
//	public String saveRecipePostProcess(@ModelAttribute PostRecipe recipe) {
//		
//		
//		int result = postRecipeService.saveRecipePost(recipe);
//
//		
//		if(result > 0) { //저장이 성공
//			return "redirect:/";  //main 요청 경로
//		} else { //저장 실패
//			return "postRecipe/post"; //view 파일경로
//		}
//	}
	
	//이미지 1장 저장
	@PostMapping("/recipe/post")
	public String saveRecipePostProcess(RecipeImage recipeImage, @ModelAttribute PostRecipe recipe) {
		System.out.println(recipeImage);
		
		try {
			RecipeFileInfo recipeFileInfo = recipeFileManager.storeFile(recipeImage.getRecipeImage());
			
			int result = recipeFileService.saveRecipeFileInfo(recipeFileInfo);
			
			if(result > 0) {
				RecipeFileInfo savaRecipeFileInfo = recipeFileService.findRecipeFileInfoByFileName(recipeFileInfo.getRecipeFileName());
				
				//레시피 정보 저장
				int result2 = postRecipeService.saveRecipePost(recipe);
				
			}
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/";
		
		
	}
	
	

	// ----------------------------기능보류---------------------------------------------------
//
//	@PostMapping(value = "/fileStorage", produces = "application/json")
//	@ResponseBody
//	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
//
//		JsonObject jsonObject = new JsonObject();
//
//		String fileRoot = "D:\\fileStorage\\"; // 저장될 외부 파일 경로
//		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
//		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
//
//		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명
//
//		File targetFile = new File(fileRoot + savedFileName);
//
//		try {
//			System.out.println("파일저장됨");
//			InputStream fileStream = multipartFile.getInputStream();
//			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
//			jsonObject.addProperty("url", "/fileStorage/" + savedFileName);
//			jsonObject.addProperty("responseCode", "success");
//			System.out.println("File saved to: " + targetFile.getAbsolutePath());
//
//		} catch (IOException e) {
//			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
//			jsonObject.addProperty("responseCode", "error");
//			e.printStackTrace();
//		}
//
//		System.out.println("jsonOBJ" + jsonObject);
//
//		return jsonObject;
//	}
	
	//-----------------------------------------------------------------------------

	

}
