package com.app.dao.admin;

import java.util.List;

import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.PostRecipeUpdateRecipeType;
import com.app.dto.product.Product;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

public interface AdminDAO {
	
//	회원
	public List<User> findUserList();
	public List<User> findUserListBySearchCondition(UserSearchCondition userSearchCondition);
	public User findUserByMemberId(int memberId); 
	
	public int saveMember(User user);
	
	public int modifyMember(User user);
	
	public int removeMember(int memberId);
	
//	레시피
	public List<PostRecipe> findPostRecipeList();
	public PostRecipe findPostRecipeById(int recipeId);
	
	public int modifyRecipeType(PostRecipeUpdateRecipeType postRecipeUpdateRecipeType);

	public int removePostRecipe(int recipeId);
	
//	상품
	public List<Product> findProductList();
	public Product findProductByProductId(int productId);

	public int saveProduct(Product product);
}
