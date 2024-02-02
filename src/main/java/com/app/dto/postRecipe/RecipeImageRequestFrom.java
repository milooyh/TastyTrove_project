package com.app.dto.postRecipe;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RecipeImageRequestFrom {
	int recipeId;
	MultipartFile recipeImage;
}
