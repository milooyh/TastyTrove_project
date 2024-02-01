package com.app.service.recipeFile;

import com.app.dto.util.RecipeFileInfo;

public interface recipeFileService {
	
	public int saveRecipeFileInfo(RecipeFileInfo recipeFileInfo);
	
	public RecipeFileInfo findRecipeFileInfoByFileName(String fileName);

}
