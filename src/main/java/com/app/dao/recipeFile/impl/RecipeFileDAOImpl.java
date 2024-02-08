package com.app.dao.recipeFile.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.recipeFile.RecipeFileDAO;
import com.app.dto.util.RecipeFileInfo;

@Repository
public class RecipeFileDAOImpl implements RecipeFileDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int saveRecipeFileInfo(RecipeFileInfo recipeFileInfo) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.insert("recipeFile_mapper.saveRecipeFileInfo", recipeFileInfo);
		
		return result;
	}

	@Override
	public RecipeFileInfo findRecipeFileInfoByFileName(String fileName) {
		// TODO Auto-generated method stub
		RecipeFileInfo recipeFileInfo = sqlSessionTemplate.selectOne("recipeFile_mapper.findRecipeFileInfoByFileName", fileName);
		return recipeFileInfo;
	}

	@Override
	public RecipeFileInfo findRecipeFileInfoByFileId(int fileId) {
		// TODO Auto-generated method stub
		RecipeFileInfo recipeInfo = sqlSessionTemplate.selectOne("recipeFile_mapper.findRecipeFileInfoByFileId", fileId);
		return recipeInfo;
	}

	@Override
	public int modifyRecipeFileInfo(RecipeFileInfo recipeFileInfo) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.update("recipeFile_mapper.modifyRecipeFileInfo", recipeFileInfo);
		
		return result;
	}

	@Override
	public int removeRecipeFileInfo(int id) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.delete("recipeFile_mapper.removeRecipe", id);
		return result;
	}

}
