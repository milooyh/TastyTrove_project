package com.app.service.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.admin.AdminDAO;
import com.app.dto.delivery.Delivery;
import com.app.dto.delivery.DeliverySearchCondition;
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
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.service.admin.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

//	회원 전체 조회
	@Override
	public List<User> findUserList() {
		// TODO Auto-generated method stub

		System.out.println("adminService findUserList 불림");

		List<User> userList = adminDAO.findUserList();
		System.out.println("adminService 결과 : " + userList);

		return userList;
	}

//	검색 조건에 따라 회원 정보 찾기
	@Override
	public List<User> findUserListBySearchCondition(UserSearchCondition userSearchCondition) {
		// TODO Auto-generated method stub
		System.out.println("adminService findUserListBySearchCondition 불림");

		List<User> userList = adminDAO.findUserListBySearchCondition(userSearchCondition);
		System.out.println("adminService 결과 : " + userList);

		return userList;
	}

//	회원 추가
	@Override
	public int saveMember(User user) {
		// TODO Auto-generated method stub
		System.out.println("adminService saveUser 불림");

		int result = adminDAO.saveMember(user);

		return result;
	}

//	아이디로 회원 조회
	@Override
	public User findUserByMemberId(int memberId) {
		// TODO Auto-generated method stub
		System.out.println("adminService findUserByMemberId 불림");

		User user = adminDAO.findUserByMemberId(memberId);

		return user;
	}

//	회원 정보 수정
	@Override
	public int modifyMember(User user) {
		// TODO Auto-generated method stub
		System.out.println("adminService modifyMember 불림");

		int result = adminDAO.modifyMember(user);

		return result;
	}

//	회원 삭제
	@Override
	public int removeMember(int memberId) {
		// TODO Auto-generated method stub
		System.out.println("adminService removeMember 불림");

		int result = adminDAO.removeMember(memberId);

		return result;
	}

//	====================================================
//	레시피 전체 조회
	@Override
	public List<PostRecipe> findPostRecipeList() {
		// TODO Auto-generated method stub
		System.out.println("adminService findPostRecipeList 불림");

		List<PostRecipe> postRecipeList = adminDAO.findPostRecipeList();

		return postRecipeList;
	}

//	레시피 번호로 레시피 찾기
	@Override
	public PostRecipe findPostRecipeById(int recipeId) {
		// TODO Auto-generated method stub
		System.out.println("adminService findPostRecipeById 불림");

		PostRecipe postRecipe = adminDAO.findPostRecipeById(recipeId);

		return postRecipe;
	}

//	레시피 카테고리 수정
	@Override
	public int modifyRecipeType(PostRecipe postRecipe) {
		// TODO Auto-generated method stub
		System.out.println("adminService modifyRecipeType 불림");

		int result = adminDAO.modifyRecipeType(postRecipe);
		return result;
	}

//	레시피 삭제
	@Override
	public int removePostRecipe(int recipeId) {
		// TODO Auto-generated method stub
		System.out.println("adminService removePostRecipe 불림");

		int result = adminDAO.removePostRecipe(recipeId);

		return result;
	}
	
//	레시피 조건 검색
	@Override
	public List<PostRecipe> findPostRecipeListBySearchCondition(PostRecipeSearchCondition postRecipeSearchCondition) {
		// TODO Auto-generated method stub
		System.out.println("adminService findPostRecipeListBySearchCondition 불림");
		List<PostRecipe> recipeList = adminDAO.findPostRecipeListBySearchCondition(postRecipeSearchCondition);
		return recipeList;
	}


//	상품==========================
//	상품 목록 조회
	@Override
	public List<Product> findProductList() {
		// TODO Auto-generated method stub
		System.out.println("adminService findProductList 불림");

		List<Product> productList = adminDAO.findProductList();
		return productList;
	}

//	상품번호도 상품 조회
	@Override
	public Product findProductByProductId(int productId) {
		// TODO Auto-generated method stub
		System.out.println("adminService findProductByproductId 불림");

		Product product = adminDAO.findProductByProductId(productId);
		return product;
	}

//	상품 저장
	@Override
	public int saveProduct(Product product) {
		// TODO Auto-generated method stub
		System.out.println("adminService saveProduct 불림");

		int result = adminDAO.saveProduct(product);
		return result;
	}

//	맛집 =============
//	맛집목록조회
	@Override
	public List<MustEatPlace> findMustEatPlaceList() {
		// TODO Auto-generated method stub
		System.out.println("adminService findMustEatPlaceList 불림");

		List<MustEatPlace> placeList = adminDAO.findMustEatPlaceList();
		return placeList;
	}

//	맛집번호로 맛집조회
	@Override
	public MustEatPlace findMustEatPlaceByPlaceId(int placeId) {
		// TODO Auto-generated method stub
		System.out.println("adminService findMustEatPlaceByPlaceId 불림");

		MustEatPlace mustEatPlace = adminDAO.findMustEatPlaceByPlaceId(placeId);
		return mustEatPlace;
	}

//	맛집 저장
	@Override
	public int saveMustEatPlace(MustEatPlace mustEatPlace) {
		// TODO Auto-generated method stub
		System.out.println("adminService saveMustEatPlace 불림");

		int result = adminDAO.saveMustEatPlace(mustEatPlace);
		System.out.println("adminService result : " + result);
		return result;
	}

//	맛집 검색
	@Override
	public List<MustEatPlace> findMustEatPlaceListBySearchCondition(
			MustEatPlaceSearchCondition mustEatPlaceSeartchCondition) {
		// TODO Auto-generated method stub
		System.out.println("adminService findMustEatPlaceListBySearchCondition 불림");
		
		List<MustEatPlace> placeList = adminDAO.findMustEatPlaceListBySearchCondition(mustEatPlaceSeartchCondition);
		return placeList;
	}

//	맛집 수정
	@Override
	public int modifyMustEatPlace(MustEatPlace mustEatPlace) {
		// TODO Auto-generated method stub
		System.out.println("adminService modifyMustEatPlace 불림");
		
		int result = adminDAO.modifyMustEatPlace(mustEatPlace);
		return result;
	}

//	맛집 삭제
	@Override
	public int removeMustEatPlace(int placeId) {
		// TODO Auto-generated method stub
		System.out.println("adminService removeMustEatPlace 불림");
		int result  = adminDAO.removeMustEatPlace(placeId);
		return result;
	}

//	주문 =================
//	주문목록
	@Override
	public List<Order> findOrderList() {
		// TODO Auto-generated method stub
		System.out.println("adminService findOrderList 불림");
		List<Order> orderList = adminDAO.findOrderList();
		return orderList;
	}

//	회원번호로 주문 내역 조회
	@Override
	public List<OrderItem> findOrderItemListByMemberId(int memberId) {
		// TODO Auto-generated method stub
		System.out.println("adminService findOrderItemListByMemberId 불림");
		List<OrderItem> orderItemList = adminDAO.findOrderItemListByMemberId(memberId);
		System.out.println("service :  " + orderItemList);
		return orderItemList;
	}

//	주문 검색
	@Override
	public List<Order> findOrderListBySearchCondition(OrderSearchCondition orderSearchCondition) {
		// TODO Auto-generated method stub
		System.out.println("adminService findOrderListBySearchCondition 불림");
		List<Order> orderList = adminDAO.findOrderListBySearchCondition(orderSearchCondition);
		return orderList;
	}
//	개별 주문 정보 수정
	@Override
	public int modifyOrderItem(OrderItem orderItem) {
		// TODO Auto-generated method stub
		System.out.println("adminService modifyOrderItem 불림");
		int result = adminDAO.modifyOrderItem(orderItem);
		return result;
	}
//	개별주문번호로 히원찾기
	@Override
	public OrderItem findOrderItemByMemberId(int orderItemId) {
		// TODO Auto-generated method stub
		System.out.println("adminService findOrderItemByMemberId 불림");
		OrderItem orderItem = adminDAO.findOrderItemByMemberId(orderItemId);
		return orderItem;
	}

//	개별주문번호로 개별주문 찾기
	@Override
	public OrderItem findOrderItemByOrderItemId(int orderItemId) {
		// TODO Auto-generated method stub
		System.out.println("adminService findOrderItemByOrderItemId 불림");
		OrderItem orderItem = adminDAO.findOrderItemByOrderItemId(orderItemId);
		return orderItem;
	}

//	전체주문번호로 주문 목록 조회
	@Override
	public List<OrderItem> findOrderItemListByOrderId(int orderId) {
		// TODO Auto-generated method stub
		System.out.println("adminService findOrderItemListByOrderId 불림");
		List<OrderItem> orderItemList = adminDAO.findOrderItemListByOrderId(orderId);
		return orderItemList;
	}

//	총계 변동
	@Override
	public int modifyTotalPrice(int orderId) {
		// TODO Auto-generated method stub
		System.out.println("adminService modifyTotalPrice 불림");
		int result = adminDAO.modifyTotalPrice(orderId);
		return result;
	}

//	결제 ===============
//	결제목록조회
	@Override
	public List<Payment> findPaymentList() {
		// TODO Auto-generated method stub
		System.out.println("adminService findPaymentList 불림");
		List<Payment> paymentList = adminDAO.findPaymentList();
		return paymentList;
	}

//	결제번호로 결제 조회
	@Override
	public Payment findPaymentByPaymentId(int paymentId) {
		// TODO Auto-generated method stub
		System.out.println("adminService findPaymentByPaymentId 불림");
		Payment payment = adminDAO.findPaymentByPaymentId(paymentId);
		return payment;
	}

//	결제 검색하기
	@Override
	public List<Payment> findPaymentListBySearchCondition(PaymentSearchCondition paymentSearchCondition) {
		// TODO Auto-generated method stub
		System.out.println("adminService findPaymentListBySearchCondition 불림");
		List<Payment> paymentList = adminDAO.findPaymentListBySearchCondition(paymentSearchCondition);
		return paymentList;
	}
	
//	결제 총액 변동
	@Override
	public int modifyPaymentAmount(int orderId) {
		// TODO Auto-generated method stub
		System.out.println("adminService modifyPaymentAmount 불림");
		int result = adminDAO.modifyPaymentAmount(orderId);
		return result;
	}


	
//	배송 ===============================
//	배송 목록 조회
	@Override
	public List<Delivery> findDeliveryList() {
		// TODO Auto-generated method stub
		System.out.println("adminService findDeliveryList 불림");
		List<Delivery> deliveryList = adminDAO.findDeliveryList();
		return deliveryList;
	}
	
//	배송번호로 조회
	@Override
	public Delivery findDeliveryByDeliveryId(int deliveryId) {
		// TODO Auto-generated method stub
		System.out.println("adminService findDeliveryByDeliveryId 불림");
		Delivery delivery = adminDAO.findDeliveryByDeliveryId(deliveryId);
		return delivery;
	}

//	배송 조건으로 검색
	@Override
	public List<Delivery> findDeliveryListBySearchCondition(DeliverySearchCondition deliverySearchCondition) {
		// TODO Auto-generated method stub
		System.out.println("adminService findDeliveryListBySearchCondition 불림");
		List<Delivery> deliveryList = adminDAO.findDeliveryListBySearchCondition(deliverySearchCondition);
		return deliveryList;
	}


}
