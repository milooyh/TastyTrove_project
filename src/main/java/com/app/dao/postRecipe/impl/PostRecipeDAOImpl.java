package com.app.dao.postRecipe.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.postRecipe.PostRecipeDAO;
import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.RecipeImage;


@Repository
public class PostRecipeDAOImpl implements PostRecipeDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int saveRecipePost(PostRecipe postRecipe) {
		// TODO Auto-generated method stub
		System.out.println("saveRecipePost 실행");
		System.out.println(postRecipe);
		
		int result = sqlSessionTemplate.insert("postRecipe_mapper.saveRecipePost", postRecipe);
		
		return result;
	}

	@Override
	public int saveRecipeImage(RecipeImage recipeImage) {
		System.out.println(recipeImage);
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.insert("recipeFile_mapper.saveRecipeImage");
		return result;
	}

	@Override
	public PostRecipe findRecipeInfoById(int id) {
		// TODO Auto-generated method stub
		PostRecipe recipe = sqlSessionTemplate.selectOne("postRecipe_mapper.findRecipeInfoById", id);
		
		return recipe;
	}

}
