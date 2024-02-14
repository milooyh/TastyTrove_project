package com.app.service.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.app.dto.delivery.Delivery;
import com.app.dto.delivery.DeliverySearchCondition;
import com.app.dto.mustEatPlace.MainMustEatPlace;
import com.app.dto.mustEatPlace.MainMustEatPlaceMenuInfo;
import com.app.dto.mustEatPlace.MustEatPlace;
import com.app.dto.mustEatPlace.MustEatPlaceSearchCondition;
import com.app.dto.order.Order;
import com.app.dto.order.OrderItem;
import com.app.dto.order.OrderSearchCondition;
import com.app.dto.payment.Payment;
import com.app.dto.payment.PaymentSearchCondition;
import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.PostRecipeSearchCondition;
import com.app.dto.postRecipe.PostRecipeUpdateRecipeType;
import com.app.dto.product.Product;
import com.app.dto.schedule.Schedule;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.dto.user.Visitor;

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

	public List<PostRecipe> findPostRecipeListBySearchCondition(PostRecipeSearchCondition postRecipeSearchCondition);

	public int modifyRecipeType(PostRecipe postRecipe);

	public int removePostRecipe(int recipeId);

//	상품 ========================================
	public List<Product> findProductList();

	public Product findProductByProductId(int productId);

	public int saveProduct(Product product);

//	맛집 ==============================


	public int removeMustEatPlace(int placeId);

	public List<MainMustEatPlace> findMustEatPlaceList();
	public MainMustEatPlace findMustEatPlaceByPlaceId(int placeId);
	public List<MainMustEatPlace> findMustEatPlaceListBySearchCondition(MustEatPlaceSearchCondition mustEatPlaceSeartchCondition);
	
	public int saveMustEatPlace(MainMustEatPlace mustEatPlace);
	
	public int modifyMustEatPlace(MainMustEatPlace mustEatPlace);
		
	public int updateImageData(MainMustEatPlace mustEatPlace);

	public int saveMenuInfo(int mustEatPlaceId, String menuName, int price);
	
	public int removeMenuByName(String menuName);
	
	public List<MainMustEatPlaceMenuInfo> findMustEatPlaceMenuById(int id);
	
//	주문 ===============================
	public List<Order> findOrderList();

	public List<OrderItem> findOrderItemListByMemberId(int memberId);

	public OrderItem findOrderItemByMemberId(int orderItemId);

	public List<Order> findOrderListBySearchCondition(OrderSearchCondition orderSearchCondition);

	public OrderItem findOrderItemByOrderItemId(int orderItemId);

	public List<OrderItem> findOrderItemListByOrderId(int orderId);

	public Order findOrderByOrderId(int orderId);

	public int modifyOrderItem(OrderItem orderItem);

	public int modifyTotalPrice(int orderId);

	public int modifyOrderStatus(Order order);

//	결제 ============
	public List<Payment> findPaymentList();

	public Payment findPaymentByPaymentId(int paymentId);

	public List<Payment> findPaymentListBySearchCondition(PaymentSearchCondition paymentSearchCondition);

	public int modifyPaymentMethod(Payment payment);

//	배송 ================================
	public List<Delivery> findDeliveryList();

	public Delivery findDeliveryByDeliveryId(int deliveryId);

	public List<Delivery> findDeliveryListBySearchCondition(DeliverySearchCondition deliverySearchCondition);

	public int modifyPaymentAmount(int orderId);

	public int modifyDeliveryStatus(Delivery delivery);

//	조회수
	public int saveVisitor(Visitor visitor);

	public int getVisitorCount(String pageUrl);

//	일정
	public List<Schedule> findSchedule();

	public int saveSchedule(Schedule schedule);

//	통계
	public int getUserCountByUserType(String userType);

	public int getRecipeCountByRecipeType(String recipeType);

	public List<Map<String, Object>> getUserCountByRecipe();

	public List<Map<String, Object>> getTotalAmountByMonth();

//	페이지 분할
	public int getUserCount();

	public List<User> findUserListByPage(Map<String, Integer> params);

	public int getRecipeCount();

	public List<PostRecipe> findRecipeListByPage(Map<String, Integer> params);

	public int getOrderCount();

	public List<Order> findOrderListByPage(Map<String, Integer> params);

	public int getPaymentCount();

	public List<Payment> findPaymentListByPage(Map<String, Integer> params);

	public int getDeliveryCount();

	public List<Delivery> findDeliveryListByPage(Map<String, Integer> params);

	public int getPlaceCount();

	public int getProductCount();

	public int getTotalAmount();

}
