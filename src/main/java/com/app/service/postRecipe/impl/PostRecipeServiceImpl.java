package com.app.service.postRecipe.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.postRecipe.PostRecipeDAO;
import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.RecipeImage;
import com.app.dto.postRecipe.RecipeSearchCondition;
import com.app.service.postRecipe.PostRecipeService;

@Service
public class PostRecipeServiceImpl implements PostRecipeService {

	@Autowired
	PostRecipeDAO postRecipeDAO;

	// 레시피 포스트 저장
	@Override
	public int saveRecipePost(PostRecipe postRecipe) {
		// TODO Auto-generated method stub
		int result = postRecipeDAO.saveRecipePost(postRecipe);
		return result;
	}

	// 레시피 포스트 첨부 이미지 저장
	@Override
	public int saveRecipeImage(RecipeImage recipeImage) {
		// TODO Auto-generated method stub
		int result = postRecipeDAO.saveRecipeImage(recipeImage);
		return 0;
	}

	// 레시피 아이디에 맞는 레시피 정보 찾기
	@Override
	public PostRecipe findRecipeInfoById(int id) {
		// TODO Auto-generated method stub
		PostRecipe recipe = postRecipeDAO.findRecipeInfoById(id);
		return recipe;
	}

	
	//레시피 목록 출력 및 조건에 따른 레시피 출력
	@Override
	public List<PostRecipe> findRecipeListBySearchCondition(RecipeSearchCondition recipeSearchCondition) {
		// TODO Auto-generated method stub
		List<PostRecipe> recipeList = postRecipeDAO.findRecipeListBySearchCondition(recipeSearchCondition);
		return recipeList;
	}

	@Override
	public int modifyRecipe(PostRecipe postRecipe) {
		// TODO Auto-generated method stub
		int result = postRecipeDAO.modifyRecipe(postRecipe);
		return result;
	}

	@Override
	public int removeRecipeById(int recipeId) {
		// TODO Auto-generated method stub
		int result = postRecipeDAO.removeRecipeById(recipeId);
		return result;
	}

}
