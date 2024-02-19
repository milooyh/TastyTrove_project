package com.app.service.postRecipe;

import java.util.List;

import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.RecipeImage;
import com.app.dto.postRecipe.RecipeSearchCondition;

public interface PostRecipeService {
	public int saveRecipePost(PostRecipe postRecipe);
	
	public int saveRecipeImage(RecipeImage recipeImage);
	
	public PostRecipe findRecipeInfoById(int id);
	
	public List<PostRecipe> findRecipeListBySearchCondition(RecipeSearchCondition recipeSearchCondition);
	
	public List<PostRecipe> findRecipeListBySearchCondition2(RecipeSearchCondition recipeSearchCondition);
	
	public int modifyRecipe(PostRecipe postRecipe);
	
	public int removeRecipeById(int recipeId);
	
	public int getTotal(RecipeSearchCondition recipeSearchCondition);
}
