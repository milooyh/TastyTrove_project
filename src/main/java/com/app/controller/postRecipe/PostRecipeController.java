package com.app.controller.postRecipe;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.app.dto.postRecipe.PostRecipe;
import com.app.service.postRecipe.PostRecipeService;
import com.google.gson.JsonObject;

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

	// -------------------------------테스트---------------------------------------------------
	
	@PostMapping(value="/fileStorage", produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "D:\\fileStorage\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			System.out.println("try됨");
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/fileStorage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
	//-------------------------------테스트---------------------------------------------------
	
	

}
