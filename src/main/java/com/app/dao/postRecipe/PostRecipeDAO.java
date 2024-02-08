package com.app.dao.postRecipe;

import java.util.List;

import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.RecipeImage;
import com.app.dto.postRecipe.RecipeSearchCondition;

public interface PostRecipeDAO {
	public int saveRecipePost(PostRecipe postRecipe);
	
	public int saveRecipeImage(RecipeImage recipeImage);
	
	public PostRecipe findRecipeInfoById(int id);
	
	public List<PostRecipe> findRecipeList();
	
	public List<PostRecipe> findRecipeListBySearchCondition(RecipeSearchCondition recipeSearchCondition);
}
