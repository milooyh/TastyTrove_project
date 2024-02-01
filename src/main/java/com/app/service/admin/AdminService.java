package com.app.service.admin;

import java.util.List;

import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.PostRecipeUpdateRecipeType;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

public interface AdminService {
	
//	회원 ======================================
	public List<User> findUserList();
	public List<User> findUserListBySearchCondition(UserSearchCondition userSearchCondition);
	public User findUserByMemberId(int memberId);
	
	public int saveMember(User user);
	
	public int modifyMember(User user);
	
	public int removeMember(int intMemberId);
	
//	레시피===================================
	public List<PostRecipe> findPostRecipeList();
	public PostRecipe findPostRecipeById(int recipeId);
	
	public int modifyRecipeType(PostRecipeUpdateRecipeType postRecipeUpdateRecipeType);
	
	public int removePostRecipe(int recipeId);


}
