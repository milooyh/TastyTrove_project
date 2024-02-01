package com.app.service.recipeFile.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.recipeFile.recipeFileDAO;
import com.app.dto.util.RecipeFileInfo;
import com.app.service.recipeFile.recipeFileService;

@Service
public class recipeFileServiceImpl implements recipeFileService{
	
	@Autowired
	recipeFileDAO recipeFileDAO;

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

}
