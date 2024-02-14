package com.app.dao.admin.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.admin.AdminDAO;
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

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

//	회원목록전체찾기
	@Override
	public List<User> findUserList() {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findUserList 불림");

		List<User> userList = sqlSessionTemplate.selectList("admin_mapper.findUserList");
		System.out.println("adminDAO 결과 : " + userList);

		return userList;
	}

//	조건에 따라 회원 정보 검색
	@Override
	public List<User> findUserListBySearchCondition(UserSearchCondition userSearchCondition) {
		// TODO Auto-generated method stub

		System.out.println("adminDAO findUserListBySearchCondition 불림");

		List<User> userList = sqlSessionTemplate.selectList("admin_mapper.findUserListBySearchCondition",
				userSearchCondition);
		System.out.println("adminDAO 결과 : " + userList);

		return userList;
	}

//	회원 저장
	@Override
	public int saveMember(User user) {
		// TODO Auto-generated method stub

		System.out.println("adminDAO saveUser 불림");

		int result = sqlSessionTemplate.insert("admin_mapper.saveMember", user);

		return result;
	}

//	아이디로 회원 조회
	@Override
	public User findUserByMemberId(int memberId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findUserByMemberId 불림");

		User user = sqlSessionTemplate.selectOne("admin_mapper.findUserByMemberId", memberId);
		return user;
	}

//	회원 정보 수정
	@Override
	public int modifyMember(User user) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO modifyMember 불림");

		int result = sqlSessionTemplate.update("admin_mapper.modifyMember", user);
		return result;
	}

//	회원 삭제
	@Override
	public int removeMember(int memberId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO removeMember 불림");

		int result = sqlSessionTemplate.delete("admin_mapper.removeMember", memberId);
		return result;
	}

//	==================================================================================
//	레시피 전체목록조회
	@Override
	public List<PostRecipe> findPostRecipeList() {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findPostRecipeList 불림");

		List<PostRecipe> postRecipeList = sqlSessionTemplate.selectList("admin_mapper.findPostRecipeList");

		return postRecipeList;
	}

//	레시피번호로 레세피 찾기
	@Override
	public PostRecipe findPostRecipeById(int recipeId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findPostRecipeById 불림");

		PostRecipe postRecipe = sqlSessionTemplate.selectOne("admin_mapper.findPostRecipeById", recipeId);

		return postRecipe;
	}

//	레시피 카테고리 수정
	@Override
	public int modifyRecipeType(PostRecipe postRecipe) {
		// TODO Auto-generated method stub

		int result = sqlSessionTemplate.update("admin_mapper.modifyRecipeType", postRecipe);

		return result;
	}

//	레시피 삭제
	@Override
	public int removePostRecipe(int recipeId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO removePostRecipe 불림");

		int result = sqlSessionTemplate.delete("admin_mapper.removePostRecipe", recipeId);

		return result;
	}

//	레시피 조건 검색
	@Override
	public List<PostRecipe> findPostRecipeListBySearchCondition(PostRecipeSearchCondition postRecipeSearchCondition) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findPostRecipeListBySearchCondition 불림");
		List<PostRecipe> recipeList = sqlSessionTemplate.selectList("admin_mapper.findPostRecipeListBySearchCondition",
				postRecipeSearchCondition);
		return recipeList;
	}

//	상품 =================================================
//	상품 찾기
	@Override
	public List<Product> findProductList() {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findProductList 불림");

		List<Product> productList = sqlSessionTemplate.selectList("admin_mapper.findProductList");

		return productList;
	}

//	상품번호로 상품 찾기
	@Override
	public Product findProductByProductId(int productId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findProductByProductId 불림");

		Product product = sqlSessionTemplate.selectOne("admin_mapper.findProductByProductId", productId);

		return product;
	}

//	상품 등록
	@Override
	public int saveProduct(Product product) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO saveProduct 불림");

		int result = sqlSessionTemplate.insert("admin_mapper.saveProduct", product);

		return result;
	}

//	======================================
//	맛집목록조회
	@Override
	public List<MainMustEatPlace> findMustEatPlaceList() {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findMustEatPlaceList 불림");

		List<MainMustEatPlace> placeList = sqlSessionTemplate.selectList("admin_mapper.findMustEatPlaceList");

		return placeList;
	}

//	맛집번호로 맛집 조회
	@Override
	public MainMustEatPlace findMustEatPlaceByPlaceId(int placeId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findMustEatPlaceByPlaceId 불림");
		System.out.println("DAO : " + placeId);
		MustEatPlace mustEatPlace = sqlSessionTemplate.selectOne("admin_mapper.findMustEatPlaceByPlaceId", placeId);

		return mustEatPlace;
	}

//	맛집 저장
	@Override
	public int saveMustEatPlace(MainMustEatPlace mustEatPlace) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO saveMustEatPlace 불림");

		int result = sqlSessionTemplate.insert("admin_mapper.saveMustEatPlace", mustEatPlace);
		return result;
	}

//	맛집 검색하기
	@Override
	public List<MainMustEatPlace> findMustEatPlaceListBySearchCondition(
			MustEatPlaceSearchCondition mustEatPlaceSearchCondition) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findMustEatPlaceListBySearchCondition 불림");

		List<MainMustEatPlace> placeList = sqlSessionTemplate
				.selectList("admin_mapper.findMustEatPlaceListBySearchCondition", mustEatPlaceSearchCondition);
		return placeList;
	}

//	맛집 수정
	@Override
	public int modifyMustEatPlace(MainMustEatPlace mustEatPlace) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO modifyMustEatPlace 불림");

		int result = sqlSessionTemplate.update("admin_mapper.modifyMustEatPlace", mustEatPlace);
		return result;
	}

//	맛집 삭제
	@Override
	public int removeMustEatPlace(int placeId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO removeMustEatPlace 불림");
		int result = sqlSessionTemplate.delete("admin_mapper.removeMustEatPlace", placeId);
		return result;
	}
	
//  맛집 이미지 업로드
	@Override
	public int updateImageData(MainMustEatPlace mustEatPlace) {
		int result = sqlSessionTemplate.update("admin_mapper.updateImagePath", mustEatPlace);
		
		return result;
	}
	
	@Override
	public int saveMenuInfo(MainMustEatPlaceMenuInfo mustEatPlaceMenu) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.insert("admin_mapper.saveMenuById", mustEatPlaceMenu);
		return result;
	}


	@Override
	public int removeMenuByName(String menuName) {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.delete("admin_mapper.removeMenuByName", menuName);
		return result;
	}
	
	@Override
	public List<MainMustEatPlaceMenuInfo> findMustEatPlaceMenuById(int id) {
		// TODO Auto-generated method stub
		List<MainMustEatPlaceMenuInfo> mainMustEatPlaceMenuInfo = sqlSessionTemplate.selectList("admin_mapper.findMustEatPlaceMenuById", id);
		return mainMustEatPlaceMenuInfo;
	}

//	주문 =============================
//	주문 목록
	@Override
	public List<Order> findOrderList() {
		// TODO Auto-generated method stub
		System.out.println("adminDAO removefindOrderList 불림");
		List<Order> orderList = sqlSessionTemplate.selectList("admin_mapper.findOrderList");
		return orderList;
	}

//	회원번호로 주문 내역 찾기
	@Override
	public List<OrderItem> findOrderItemListByMemberId(int memberId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findOrderItemListByMemberId 불림");
		List<OrderItem> orderItemList = sqlSessionTemplate.selectList("admin_mapper.findOrderItemListByMemberId",
				memberId);
		System.out.println("dao : " + orderItemList);

		return orderItemList;
	}

//	주문 검색
	@Override
	public List<Order> findOrderListBySearchCondition(OrderSearchCondition orderSearchCondition) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findOrderListBySearchCondition 불림");
		List<Order> orderList = sqlSessionTemplate.selectList("admin_mapper.findOrderListBySearchCondition",
				orderSearchCondition);
		return orderList;
	}

//	개별 주문 정보 수정
	@Override
	public int modifyOrderItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO modifyOrderItem 불림");
		int result = sqlSessionTemplate.update("admin_mapper.modifyOrderItem", orderItem);
		return result;
	}

//	회원번호로 개별주문 찾기
	@Override
	public OrderItem findOrderItemByMemberId(int orderItemId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findOrderItemByMemberId 불림");
		OrderItem orderItem = sqlSessionTemplate.selectOne("admin_mapper.findOrderItemByMemberId", orderItemId);

		return orderItem;
	}

//	개별주문번호로 개별주문찾기
	@Override
	public OrderItem findOrderItemByOrderItemId(int orderItemId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findOrderItemByOrderItemId 불림");
		OrderItem orderItem = sqlSessionTemplate.selectOne("admin_mapper.findOrderItemByOrderItemId", orderItemId);
		return orderItem;
	}

//	전체주문번호로 주문목록조회
	@Override
	public List<OrderItem> findOrderItemListByOrderId(int orderId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findOrderItemListByOrderId 불림");
		List<OrderItem> orderItemList = sqlSessionTemplate.selectList("admin_mapper.findOrderItemListByOrderId",
				orderId);
		return orderItemList;
	}

//	총계반영
	@Override
	public int modifyTotalPrice(int orderId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO modifyTotalPrice 불림");
		int result = sqlSessionTemplate.update("admin_mapper.modifyTotalPrice", orderId);
		return result;
	}

//	주문번호로 전체주문목록 조회
	@Override
	public Order findOrderByOrderId(int orderId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findOrderByOrderId 불림");
		Order order = sqlSessionTemplate.selectOne("admin_mapper.findOrderByOrderId", orderId);
		System.out.println(order.getOrderId());
		return order;
	}

//	주문상태 수정
	@Override
	public int modifyOrderStatus(Order order) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO modifyOrderStatus 불림");
		System.out.println(order.getOrderStatus());
		int result = sqlSessionTemplate.update("admin_mapper.modifyOrderStatus", order);
		System.out.println("result = " + result);
		return result;
	}

//	결제 ====================================
//	결제목록조회
	@Override
	public List<Payment> findPaymentList() {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findPaymentList 불림");
		List<Payment> paymentList = sqlSessionTemplate.selectList("admin_mapper.findPaymentList");
		return paymentList;
	}

//	결제번호로 결제조회
	@Override
	public Payment findPaymentByPaymentId(int paymentId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findPaymentByPaymentId 불림");
		Payment payment = sqlSessionTemplate.selectOne("admin_mapper.findPaymentByPaymentId", paymentId);
		return payment;
	}

//	결제내역 검색하기
	@Override
	public List<Payment> findPaymentListBySearchCondition(PaymentSearchCondition paymentSearchCondition) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findPaymentListBySearchCondition 불림");
		List<Payment> paymentList = sqlSessionTemplate.selectList("admin_mapper.findPaymentListBySearchCondition",
				paymentSearchCondition);
		return paymentList;
	}

//	결제 총액 변동
	@Override
	public int modifyPaymentAmount(int orderId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO modifyPaymentAmount 불림");
		int result = sqlSessionTemplate.update("admin_mapper.modifyPaymentAmount", orderId);
		return result;
	}

//	결제 방법 변경
	@Override
	public int ModifyPaymentMethod(Payment payment) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO ModifyPaymentMethod 불림");
		int result = sqlSessionTemplate.update("admin_mapper.modifyPaymentMethod", payment);
		return result;
	}

//	배송 =================================
//	배송 목록 조회
	@Override
	public List<Delivery> findDeliveryList() {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findDeliveryList 불림");
		List<Delivery> deliveryList = sqlSessionTemplate.selectList("admin_mapper.findDeliveryList");
		return deliveryList;
	}

//	배송번호로 조회
	@Override
	public Delivery findDeliveryByDeliveryId(int deliveryId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findDeliveryByDeliveryId 불림");
		Delivery delivery = sqlSessionTemplate.selectOne("admin_mapper.findDeliveryByDeliveryId", deliveryId);
		return delivery;
	}

//	배송 조건 검색
	@Override
	public List<Delivery> findDeliveryListBySearchCondition(DeliverySearchCondition deliverySearchCondition) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findDeliveryListBySearchCondition 불림");
		List<Delivery> deliveryList = sqlSessionTemplate.selectList("admin_mapper.findDeliveryListBySearchCondition",
				deliverySearchCondition);
		return deliveryList;
	}

//	배송 상태 변경
	@Override
	public int modifyDeliveryStatus(Delivery delivery) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO modifyDeliveryStatus 불림");
		int result = sqlSessionTemplate.update("admin_mapper.modifyDeliveryStatus", delivery);
		return result;
	}

//	조회수
	@Override
	public int saveVisitor(Visitor visitor) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO saveVisit 불림");
		int result = sqlSessionTemplate.insert("admin_mapper.saveVisitor", visitor);
		return result;
	}

//	조회수 카운트
	@Override
	public int getVisitorCount(String pageUrl) {
		// TODO Auto-generated method stub
		System.out.println("adminDAo findVisitCount 불림");
		int result = sqlSessionTemplate.selectOne("admin_mapper.getVisitorCount", pageUrl);
		return result;
	}

//	일정 조회
	@Override
	public List<Schedule> findSchedule() {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findSchedule 불림");
		List<Schedule> scheduleList = sqlSessionTemplate.selectList("admin_mapper.findSchedule");
		return scheduleList;
	}

//	일정 추가
	@Override
	public int saveSchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		System.out.println("adiminDAO saveSchedule 불림");
		int result = sqlSessionTemplate.insert("admin_mapper.saveSchedule", schedule);
		return result;
	}

//	타입별 회원 찾기 =============================
	@Override
	public int getUserCountByUserType(String userType) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO getUserCountByUserType 불림");
		int result = sqlSessionTemplate.selectOne("admin_mapper.getUserCountByUserType", userType);
		return result;
	}
	

	@Override
	public int getRecipeCountByRecipeType(String recipeType) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO getRecipeCountByUserType 불림");
		int result = sqlSessionTemplate.selectOne("admin_mapper.getRecipeCountByRecipeType", recipeType);
		return result;
	}
	
	@Override
	public List<Map<String, Object>> getUserCountByRecipe() {
		// TODO Auto-generated method stub
		System.out.println("adminDAO getUserCountByRecipe 불림");
		List<Map<String, Object>> map = sqlSessionTemplate.selectList("admin_mapper.getUserCountByRecipe");
		return map;
	}
	
	@Override
	public List<Map<String, Object>> getTotalAmountByMonth() {
		// TODO Auto-generated method stub
		System.out.println("adminDAO getTotalAmountByMonth 불림");
		List<Map<String, Object>> map = sqlSessionTemplate.selectList("admin_mapper.getTotalAmountByMonth");
		return map;
	}


//	페이지 분할 ==================================
	@Override
	public int getUserCount() {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("admin_mapper.getUserCount");
		return result;
	}

	@Override
	public List<User> findUserListByPage(Map<String, Integer> params) {
		// TODO Auto-generated method stub

		List<User> userList = sqlSessionTemplate.selectList("admin_mapper.findUserListByPage", params);
		return userList;
	}

	@Override
	public int getRecipeCount() {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("admin_mapper.getRecipeCount");
		return result;
	}

	@Override
	public List<PostRecipe> findRecipeListByPage(Map<String, Integer> params) {
		// TODO Auto-generated method stub
		List<PostRecipe> recipeList = sqlSessionTemplate.selectList("admin_mapper.findRecipeListByPage", params);
		return recipeList;
	}

	@Override
	public int getOrderCount() {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("admin_mapper.getOrderCount");
		return result;
	}

	@Override
	public List<Order> findOrderListByPage(Map<String, Integer> params) {
		// TODO Auto-generated method stub
		List<Order> orderList = sqlSessionTemplate.selectList("admin_mapper.findOrderListByPage", params);
		return orderList;
	}

	@Override
	public int getPaymentCount() {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("admin_mapper.getPaymentCount");
		return result;
	}

	@Override
	public List<Payment> findPaymentListByPage(Map<String, Integer> params) {
		// TODO Auto-generated method stub
		List<Payment> paymentList = sqlSessionTemplate.selectList("admin_mapper.findPaymentListByPage", params);
		return paymentList;
	}

	@Override
	public int getDeliveryCount() {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("admin_mapper.getDeliveryCount");
		return result;
	}

	@Override
	public List<Delivery> findDeliveryListByPage(Map<String, Integer> params) {
		// TODO Auto-generated method stub
		List<Delivery> deliveryList = sqlSessionTemplate.selectList("admin_mapper.findDeliveryListByPage", params);
		return deliveryList;
	}

	@Override
	public int getPlaceCount() {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("admin_mapper.getPlaceCount");
		return result;
	}

	@Override
	public int getProductCount() {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("admin_mapper.getProductCount");
		return result;
	}

	@Override
	public int getTotalAmount() {
		// TODO Auto-generated method stub
		int result = sqlSessionTemplate.selectOne("admin_mapper.getTotalAmount");
		return result;
	}



	
}
