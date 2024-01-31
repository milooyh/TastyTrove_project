package com.app.dto.postRecipe;

import lombok.Data;

@Data
public class PostRecipe {
	int recipe_id;
	String recipe_title;
	String recipe_content;
	String user_id;
	String created_at;
}
