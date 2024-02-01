package com.app.service.postRecipe.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.postRecipe.PostRecipeDAO;
import com.app.dto.postRecipe.PostRecipe;
import com.app.service.postRecipe.PostRecipeService;

@Service
public class PostRecipeServiceImpl implements PostRecipeService {
	
	@Autowired
	PostRecipeDAO postRecipeDAO;

	@Override
	public int saveRecipePost(PostRecipe postRecipe) {
		// TODO Auto-generated method stub
		int result = postRecipeDAO.saveRecipePost(postRecipe);
		return result;
	}

	
}
