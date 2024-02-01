package com.app.dto.postRecipe;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RecipeImage {
	int recipe_id;
	MultipartFile recipeImage;
	//사용여부 체크 필요
}
