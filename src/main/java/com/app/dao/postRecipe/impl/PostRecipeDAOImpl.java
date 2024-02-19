package com.app.dao.postRecipe.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.postRecipe.PostRecipeDAO;
import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.RecipeImage;
import com.app.dto.postRecipe.RecipeSearchCondition;


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

	//레시피 아이디에 따른 레시피 정보 출력
	@Override
	public PostRecipe findRecipeInfoById(int id) {
		// TODO Auto-generated method stub
		PostRecipe recipe = sqlSessionTemplate.selectOne("postRecipe_mapper.findRecipeInfoById", id);
		
		return recipe;
	}


	//레시피 목록 출력 및 조건에 따른 레시피 출력
	@Override
	public List<PostRecipe> findRecipeListBySearchCondition(RecipeSearchCondition recipeSearchCondition) {
		// TODO Auto-generated method stub
		
		List<PostRecipe> recipeList = sqlSessionTemplate.selectList("postRecipe_mapper.findRecipeListBySearchCondition", recipeSearchCondition);
		return recipeList;
	}


	@Override
	public int modifyRecipe(PostRecipe postRecipe) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.update("postRecipe_mapper.modifyRecipePost", postRecipe);
		return result;
	}


	@Override
	public int removeRecipeById(int recipeId) {
		// TODO Auto-generated method stub
		
		int result = sqlSessionTemplate.delete("postRecipe_mapper.removeRecipeById", recipeId);
		return result;
	}

	
	@Override
	public int getTotal(RecipeSearchCondition recipeSearchCondition) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("postRecipe_mapper.getTotal");
	}


	@Override
	public List<PostRecipe> findRecipeListBySearchCondition2(RecipeSearchCondition recipeSearchCondition) {
		// TODO Auto-generated method stub
		List<PostRecipe> recipeList = sqlSessionTemplate.selectList("postRecipe_mapper.findRecipeListBySearchCondition2", recipeSearchCondition);
		return recipeList;
	}

}
