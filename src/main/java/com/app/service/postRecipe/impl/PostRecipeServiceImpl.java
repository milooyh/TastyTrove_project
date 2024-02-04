package com.app.service.postRecipe.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.postRecipe.PostRecipeDAO;
import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.RecipeImage;
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

	@Override
	public List<PostRecipe> findRecipeList() {
		// TODO Auto-generated method stub
		List<PostRecipe> recipeList = postRecipeDAO.findRecipeList();
		return recipeList;
	}

}
