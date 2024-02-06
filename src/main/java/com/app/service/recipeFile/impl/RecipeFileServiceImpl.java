package com.app.service.recipeFile.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.recipeFile.RecipeFileDAO;
import com.app.dto.util.RecipeFileInfo;
import com.app.service.recipeFile.RecipeFileService;

@Service
public class RecipeFileServiceImpl implements RecipeFileService{
	
	@Autowired
	RecipeFileDAO recipeFileDAO;

	@Override
	public int saveRecipeFileInfo(RecipeFileInfo recipeFileInfo) {
		// TODO Auto-generated method stub
		
		int result = recipeFileDAO.saveRecipeFileInfo(recipeFileInfo);
		
		return result;
	}

	@Override
	public RecipeFileInfo findRecipeFileInfoByFileName(String fileName) {
		// TODO Auto-generated method stub
		RecipeFileInfo recipeFileInfo = recipeFileDAO.findRecipeFileInfoByFileName(fileName);
		return recipeFileInfo;
	}

	@Override
	public RecipeFileInfo findRecipeFileInfoByFileId(int fileId) {
		// TODO Auto-generated method stub
		RecipeFileInfo recipeInfo = recipeFileDAO.findRecipeFileInfoByFileId(fileId);
		return recipeInfo;
	}

}
