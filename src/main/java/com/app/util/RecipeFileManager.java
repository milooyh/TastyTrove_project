package com.app.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.app.dto.util.RecipeFileInfo;

@Component
public class RecipeFileManager {
	
	private static String fileDirectoryPath = "d:/recipeImageFile/";
	private static String fileUrlPath = "/recipeImageFile/";
	
	public RecipeFileInfo storeFile(MultipartFile file) throws IllegalStateException, IOException{
		
		RecipeFileInfo recipeFileInfo = new RecipeFileInfo();
		
		recipeFileInfo.setOriginalRecipeFileName(file.getOriginalFilename());
		recipeFileInfo.setRecipeFileSize(file.getSize());
		recipeFileInfo.setRecipeFilePath(fileUrlPath);

		String extension = extractExtension(file.getOriginalFilename());
		
		recipeFileInfo.setRecipeFileExtension(extension);
		String fileName = createFileName(file.getOriginalFilename());
		recipeFileInfo.setRecipeFileName(fileName);
		
		file.transferTo(new File(fileDirectoryPath + recipeFileInfo.getRecipeFileName() ));
		
		
		return recipeFileInfo;
	}
	
	private String createFileName(String originalFileName) {
		String fileName = UUID.randomUUID().toString() + "." + extractExtension(originalFileName);
		return fileName;
	}
	
	private String extractExtension(String fileName) {
		int dotIndex = fileName.lastIndexOf("."); // .의 위치
		String extension = fileName.substring(dotIndex + 1); // .jpg  .다음위치부터~  
		return extension;
	}
}
