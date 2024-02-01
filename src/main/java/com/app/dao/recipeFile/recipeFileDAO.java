package com.app.dao.recipeFile;

import com.app.dto.util.RecipeFileInfo;

public interface recipeFileDAO {

	public int saveRecipeFileInfo(RecipeFileInfo recipeFileInfo);

	public RecipeFileInfo findRecipeFileInfoByFileName(String fileName);

}
