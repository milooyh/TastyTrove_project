package com.app.dao.postRecipe;

import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.RecipeImage;

public interface PostRecipeDAO {
	public int saveRecipePost(PostRecipe postRecipe);
	
	public int saveRecipeImage(RecipeImage recipeImage);
	
	public PostRecipe findRecipeInfoById(int id);
}
