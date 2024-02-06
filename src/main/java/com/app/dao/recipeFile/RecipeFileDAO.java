package com.app.dao.recipeFile;

import com.app.dto.util.RecipeFileInfo;

public interface RecipeFileDAO {

	public int saveRecipeFileInfo(RecipeFileInfo recipeFileInfo);

	public RecipeFileInfo findRecipeFileInfoByFileName(String fileName);
	
	public RecipeFileInfo findRecipeFileInfoByFileId(int fileId);
	
	public int modifyRecipeFileInfo(RecipeFileInfo recipeFileInfo);

}
