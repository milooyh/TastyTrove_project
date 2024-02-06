package com.app.dto.postRecipe;

import lombok.Data;

@Data
public class PostRecipeSearchCondition {
	String recipeId;
	String recipeTitle;
	String recipeContent;
	String memberId;
	String boardDate;
	String recipeType;
	
	String searchKeyword;
}
