package com.app.dto.util;

import lombok.Data;

@Data
public class RecipeFileInfo {
	//DB저장
	int recipeFileId;
	String recipeFileName;
	String originalRecipeFileName;
	String recipeFilePath;
	String recipeFileExtension;
    long recipeFileSize;
}
