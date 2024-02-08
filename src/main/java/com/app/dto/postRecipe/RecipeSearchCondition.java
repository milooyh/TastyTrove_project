package com.app.dto.postRecipe;

import lombok.Data;

@Data
public class RecipeSearchCondition {
	   int recipeId;
	   String recipeTitle;
	   String recipeContent;
	   String memberId;
	   String boardDate;
	   String recipeType;
	   int recipeFileId;
	   String recipeFileName;
	   String recipeFilePath;
	   
	   String searchKeyword;

}
