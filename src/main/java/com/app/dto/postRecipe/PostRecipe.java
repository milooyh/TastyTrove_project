package com.app.dto.postRecipe;

import lombok.Data;

@Data
public class PostRecipe {
   int recipeId;
   String recipeTitle;
   String recipeContent;
   String memberId;
   String boardDate;
   String recipeType;
   int recipeFileId;
}
