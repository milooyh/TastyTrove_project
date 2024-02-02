package com.app.dao.admin;

import java.util.List;

import com.app.dto.mustEatPlace.MustEatPlace;
import com.app.dto.mustEatPlace.MustEatPlaceSearchCondition;
import com.app.dto.order.Order;
import com.app.dto.order.OrderItem;
import com.app.dto.order.OrderSearchCondition;
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
	
//	맛집
	public List<MustEatPlace> findMustEatPlaceList();
	public MustEatPlace findMustEatPlaceByPlaceId(int placeId);
	public List<MustEatPlace> findMustEatPlaceListBySearchCondition(MustEatPlaceSearchCondition mustEatPlaceSearchCondition);
	
	public int saveMustEatPlace(MustEatPlace mustEatPlace);
	
	public int modifyMustEatPlace(MustEatPlace mustEatPlace);
	
	public int removeMustEatPlace(int placeId);
	
//	주문
	public List<Order> findOrderList();
	public List<OrderItem> findOrderItemListByMemberId(int memberId);
	public OrderItem findOrderItemByMemberId(int orderItemId);
	public List<Order> findOrderListBySearchCondition(OrderSearchCondition orderSearchCondition);
	public OrderItem findOrderItemByOrderItemId(int orderItemId);
	public List<OrderItem> findOrderItemListByOrderId(int orderId);
	
	public int modifyOrderItem(OrderItem orderItem);	
	public int modifyOrder(Order order);
	public int modifyTotalPrice(int orderId);
	
}
