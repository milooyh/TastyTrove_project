package com.app.controller.admin;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.common.CommonCode;
import com.app.dto.delivery.Delivery;
import com.app.dto.mustEatPlace.MustEatPlace;
import com.app.dto.mustEatPlace.MustEatPlaceSearchCondition;
import com.app.dto.order.Order;
import com.app.dto.order.OrderItem;
import com.app.dto.order.OrderSearchCondition;
import com.app.dto.payment.Payment;
import com.app.dto.payment.PaymentSearchCondition;
import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.PostRecipeUpdateRecipeType;
import com.app.dto.product.Product;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.service.admin.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;

//	관리자메인 ======================
	@GetMapping("/")
	public String adminHome() {
		return "/admin/adminHome";
	}

//	회원 관리 ======================

//	회원 목록
	@GetMapping("/member")
	public String adminMemberList(Model model) {
		System.out.println("adminController 회원 정보 부르기");

		List<User> userList = adminService.findUserList();
		model.addAttribute("userList", userList);

		return "/admin/adminMember/adminMember";
	}

//	조건에 따른 회원 검색
	@GetMapping("/member/search")
	public String findMemberListProcess(Model model, UserSearchCondition userSearchCondition) {

		System.out.println("adminController 회원 검색 정보 부르기");

		System.out.println("선택한 월" + userSearchCondition.getBirthMonth());

//		10월보다 작으면 앞에 0 붙여주기 ..
		String birthMonthWithZero = null;

		if (userSearchCondition.getBirthMonth() != null && !userSearchCondition.getBirthMonth().isEmpty())
			try {
				int intBirthMonth = Integer.parseInt(userSearchCondition.getBirthMonth());
				if (intBirthMonth < 10) {
					birthMonthWithZero = "0" + userSearchCondition.getBirthMonth();
					System.out.println(birthMonthWithZero);
					userSearchCondition.setBirthMonth(birthMonthWithZero);
				}
			} catch (NumberFormatException e) {
				// TODO: handle exception
			}

//		10일보다 작으면 앞에 0 붙이기
		String birthDateWithZero = null;

		if (userSearchCondition.getBirthDate() != null && !userSearchCondition.getBirthDate().isEmpty())
			try {
				int intBirthDate = Integer.parseInt(userSearchCondition.getBirthDate());
				if (intBirthDate < 10) {
					birthDateWithZero = "0" + userSearchCondition.getBirthDate();
					System.out.println(birthDateWithZero);
					userSearchCondition.setBirthDate(birthDateWithZero);
				}
			} catch (NumberFormatException e) {
				// TODO: handle exception
			}

		List<User> userList = adminService.findUserListBySearchCondition(userSearchCondition);
		model.addAttribute("userList", userList);

		return "/admin/adminMember/findMember";
	}

//	관리자 추가
	@GetMapping("/member/add")
	public String saveMember() {
		return "/admin/adminMember/saveMember";
	}

	@PostMapping("/member/add")
	public String saveMemberProcess(@ModelAttribute User user, @RequestParam("userId") String userId,
			@RequestParam("userPassword") String userPassword, @RequestParam("userName") String userName,
			@RequestParam("userNickname") String userNickname, @RequestParam("userAddress") String userAddress,
			@RequestParam("userEmail") String userEmail, @RequestParam("birthYear") String birthYear,
			@RequestParam("birthMonth") String birthMonth, @RequestParam("birthDate") String birthDate,
			@RequestParam("tel1") String tel1, @RequestParam("tel2") String tel2, @RequestParam("tel3") String tel3,
			Model model) {

		System.out.println("adminController 관리자 추가");

		user.setUserId(userId);
		user.setUserPassword(userPassword);
		user.setUserName(userName);
		user.setUserNickname(userNickname);
		user.setUserAddress(userAddress);
		user.setUserEmail(userEmail);
		user.setUserType(CommonCode.USER_USERTYPE_ADMIN);

//		출생 연 + 월 + 일 하나로 합치기
		String userBirthdate = birthYear + "-" + (birthMonth.length() == 1 ? "0" + birthMonth : birthMonth) + "-"
				+ (birthDate.length() == 1 ? "0" + birthDate : birthDate);

//		 전화번호 하나로 합치기
		String userTel = (tel1.length() == 2 ? "0" + tel1 : tel1) + "-" + (tel2.length() == 3 ? "0" + tel2 : tel2) + "-"
				+ (tel3.length() == 3 ? "0" + tel3 : tel3);

		user.setUserBirthdate(userBirthdate);
		user.setUserTel(userTel);

		model.addAttribute("user", user);
		System.out.println(user);

		int result = adminService.saveMember(user);
		if (result > 0) {
			System.out.println("관리자 등록 성공");
			return "redirect:/admin/adminMember/member";
		} else {
			System.out.println("관리자 등록 실패");
			return "/admin/adminMember/saveMember";
		}

	}

//	회원 정보 수정
	@GetMapping("/member/update")
	public String modifyMember(@RequestParam String memberId, Model model, User user) {

		int intMemberId = Integer.parseInt(memberId); // db와 형태를 맞추기 위해 다시 int로 변환
		user = adminService.findUserByMemberId(intMemberId);
		model.addAttribute("user", user);

		return "/admin/adminMember/modifyMember";
	}

	@PostMapping("/member/update")
	public String modifyMemberProcess(User user) {

		System.out.println("adminController 회원 정보 수정");

		int result = adminService.modifyMember(user);
		if (result > 0) {
			return "redirect:/admin/member";
		} else {
			return "/admin/adminMember/member";
		}
	}

//	회원 삭제
	@GetMapping("/member/remove")
	public String removeMember(@RequestParam String memberId) {
		int intMemberId = Integer.parseInt(memberId);

		int result = adminService.removeMember(intMemberId);
		if (result > 0) {
			System.out.println("회원 삭제 성공");
			return "redirect:/admin/member";
		} else {
			System.out.println("회원 삭제 실패");
			return "admin/adminMember/member";
		}
	}

//	======================
//	레시피 목록
	@GetMapping("/recipeboard")
	public String findRecipeList(Model model) {
		System.out.println("adminController 레시피 정보 부르기");

		List<PostRecipe> postRecipeList = adminService.findPostRecipeList();
		model.addAttribute("postRecipeList", postRecipeList);

		// 컨트롤러에서 allRecipeTypes를 추가하는 부분
		model.addAttribute("allRecipeTypes", Arrays.asList("KOR", "CHI", "JPN", "WST", "DRT", "ETC"));

		return "/admin/adminPostRecipe/adminRecipeBoard";
	}

//	레시피 세부 내용 
	@GetMapping("/recipeboard/content")
	public String findRecipeContent(Model model, @RequestParam String recipeId, PostRecipe postRecipe) {
		int intRecipeId = Integer.parseInt(recipeId);

		postRecipe = adminService.findPostRecipeById(intRecipeId);

		model.addAttribute("postRecipe", postRecipe);

		return "/admin/adminPostRecipe/recipeContent";
	}

//	레시피 카테고리 수정 >>>>>>>>>> 안 됨 ㅜㅜ

	@GetMapping("/recipeboard/update")
	public String updateRecipeType(@RequestParam String recipeId, Model model,
			PostRecipeUpdateRecipeType postRecipeUpdateRecipeType) {
		int intRecipeId = Integer.parseInt(recipeId);
		postRecipeUpdateRecipeType.setRecipeId(intRecipeId);

		PostRecipe postRecipe = adminService.findPostRecipeById(intRecipeId);
		model.addAttribute("postRecipe", postRecipe);

		return "/admin/adminPostRecipe";
	}

	@PostMapping("/recipeboard/update")
	public String updateRecipeTypeProcess(PostRecipeUpdateRecipeType postRecipeUpdateRecipeType) {

		System.out.println("adminController 레시피 카테고리 수정하기");

		int result = adminService.modifyRecipeType(postRecipeUpdateRecipeType);
		if (result > 0) {
			System.out.println("레시피 카테고리 변경 성공");
			return "redirect:/admin/recipeboard";
		} else {
			System.out.println("레시피 카레토리 변경 실패");
			return "admin/adminPostRecipe/adminRecipeBoard";
		}
	}

//	레시피 삭제
	@GetMapping("/recipe/remove")
	public String removePostRecipe(@RequestParam String recipeId) {
		System.out.println("adminController 레시피 삭제하기");

		int intRecipeId = Integer.parseInt(recipeId);

		int result = adminService.removePostRecipe(intRecipeId);

		if (result > 0) {
			System.out.println("레세피 삭제 성공");
			return "redirect:/admin/recipeboard"; // 이상해
		} else {
			System.out.println("회원 삭제 실패");
			return "admin/adminPostRecipe/adminRecipeBoard";
		}
	}

//	상품 ==============================================================
//	상품 목록
	@GetMapping("/product")
	public String findProductList(Model model) {
		List<Product> productList = adminService.findProductList();
		model.addAttribute("productList", productList);

		return "admin/adminProduct/adminProduct";
	}

	@RequestMapping("/product/content")
	public String productReview(@RequestParam String productId, Model model, Product product) {
		int intProductId = Integer.parseInt(productId);
		product = adminService.findProductByProductId(intProductId);

		model.addAttribute("product", product);

		return "admin/adminProduct/productContent";
	}

//	상품 추가
	@GetMapping("/product/add")
	public String addProduct() {
		return "/admin/adminProduct/saveProduct";
	}

//	@PostMapping("/product/add") // 이미지 업로드 하는 거 땜에 추후할 예정 ...
//	public String addProductProcess(Product product ) {
//		
//		return "redirect:/admin/product";
//	}

//	상품 검색
	@GetMapping("/product/search")
	public String searchProduct() {
		return "/admin/adminProduct/findProduct";
	}

//	맛집 ===========================
//	맛집 모록
	@GetMapping("/musteatplace")
	public String findMustEatPlaceList(Model model) {
		List<MustEatPlace> placeList = adminService.findMustEatPlaceList();
		model.addAttribute("placeList", placeList);

		return "/admin/adminMustEatPlace/adminMustEatPlace";
	}

//	맛집별 리뷰
	@RequestMapping("/musteatplace/content")
	public String mustEatPlaceReview(@RequestParam String placeId, Model model, MustEatPlace mustEatPlace) {
		int intPlaceId = Integer.parseInt(placeId);
		mustEatPlace = adminService.findMustEatPlaceByPlaceId(intPlaceId);

		model.addAttribute("place", mustEatPlace);

		return "/admin/adminMustEatPlace/mustEatPlaceContent";
	}

//	맛집 추가
	@GetMapping("/musteatplace/add")
	public String saveMustEatPlace() {
		return "/admin/adminMustEatPlace/saveMustEatPlace";
	}

	@PostMapping("/musteatplace/add")
	public String saveMustEatPlaceProcess(MustEatPlace mustEatPlace, HttpSession session) {

		int result = adminService.saveMustEatPlace(mustEatPlace);
		System.out.println("adminController result : " + result);

		if (result > 0) {
			System.out.println("맛집 저장 성공");
			return "redirect:/admin/musteatplace"; // 경로에 nullpoint예외가 .. ?
		} else {
			return "/admin/adminMustEatPlace/saveMustEatPlace";
		}
	}

//	맛집 검색
	@GetMapping("/musteatplace/search")
	public String findMustEatPlaceBySearchCondition(MustEatPlaceSearchCondition mustEatPlaceSearchCondition,
			Model model) {
		System.out.println("adminController findMustEatPlaceListBySearchCondition 불림");

		List<MustEatPlace> placeList = adminService.findMustEatPlaceListBySearchCondition(mustEatPlaceSearchCondition);
		model.addAttribute("placeList", placeList);

		return "/admin/adminMustEatPlace/findMustEatPlace";
	}

//	맛집 수정
	@GetMapping("/musteatplace/update")
	public String modifyMustEatPlace(@RequestParam String placeId, Model model, MustEatPlace mustEatPlace) {
		int intPlaceId = Integer.parseInt(placeId);
		mustEatPlace = adminService.findMustEatPlaceByPlaceId(intPlaceId);
		model.addAttribute("mustEatPlace", mustEatPlace);

		return "/admin/adminMustEatPlace/modifyMustEatPlace";
	}

	@PostMapping("/musteatplace/update")
	public String modifyMustEatPlaceProcess(MustEatPlace mustEatPlace) {
		int result = adminService.modifyMustEatPlace(mustEatPlace);
		if (result > 0) {
			System.out.println("맛집 수정 성공");
			return "redirect:/admin/musteatplace";
		} else {
			System.out.println("맛집 수정 실패");
			return "/admin/musteatplace/modify";
		}
	}

//	맛집 삭제
	@GetMapping("/musteatplace/remove")
	public String removeMustEatPlace(@RequestParam String placeId) {
		int intPlaceId = Integer.parseInt(placeId);
		int result = adminService.removeMustEatPlace(intPlaceId);
		if (result > 0) {
			System.out.println("맛집 삭제 성공");
			return "redirect:/admin/musteatplace";
		} else {
			System.out.println("맛집 삭제 실패");
			return "/admin/musteatplace";
		}
	}

//	주문 ======================
//	주문 목록 조회
	@GetMapping("/order")
	public String findOrderList(Model model) {
		List<Order> orderList = adminService.findOrderList();
		model.addAttribute("orderList", orderList);

		return "/admin/adminOrder/adminOrder";
	}

	@GetMapping("/order/orderitem")
	public String findOrderListByMemberId(@RequestParam String memberId, Model model, OrderItem orderItem) {
		int intMemberId = Integer.parseInt(memberId);
		orderItem.setMemberId(intMemberId);

		List<OrderItem> orderItemList = adminService.findOrderItemListByMemberId(intMemberId);
		System.out.println("controller : + " + orderItemList);

		model.addAttribute("orderItemList", orderItemList);

		return "/admin/adminOrder/orderItems";

	}

	@GetMapping("/order/orders")
	public String findOrderListByOrderId(@RequestParam String orderId, Model model, OrderItem orderItem) {
		System.out.println("adminController 전체주문번호 누르면 나오는 페이지 ㅜㅜ");
		int intOrderId = Integer.parseInt(orderId);
		orderItem.setOrderId(intOrderId);

		List<OrderItem> orderItemList = adminService.findOrderItemListByOrderId(intOrderId);
		model.addAttribute("orderItemList", orderItemList);

		return "/admin/adminOrder/order";
	}

//	주문 목록 검색
	@GetMapping("/order/search")
	public String findOrderBySearchCondition(OrderSearchCondition orderSearchCondition, Model model) {
		List<Order> orderList = adminService.findOrderListBySearchCondition(orderSearchCondition);
		model.addAttribute("orderList", orderList);
		return "/admin/adminOrder/findOrder";
	}

//	개별 주문 정보 수정
	@GetMapping("/order/orderitem/update")
	public String modifyOrderItem(@RequestParam String orderItemId, Model model, OrderItem orderItem) {
		System.out.println("adminController modifyOrderItem  불림");
		System.out.println("~~~~~~~~~~~~~ orderItemId" + orderItemId);
		int intOrderItemId = Integer.parseInt(orderItemId);
		orderItem.setOrderItemId(intOrderItemId);
		orderItem = adminService.findOrderItemByOrderItemId(intOrderItemId);

		model.addAttribute("orderItem", orderItem);
		System.out.println("orderItem : " + orderItem);

		return "/admin/adminOrder/modifyOrderItem";
	}

	@PostMapping("/order/orderitem/update")
	public String modifyOrderItemProcess(@RequestParam String orderItemCount, @RequestParam String orderItemId,
			@RequestParam String orderId, OrderItem orderItem) {
		System.out.println("adminController modifyOrderItemProc 불림");

		System.out.println("orderItemId : " + orderItemId + "orderItemCount : " + orderItemCount + "orderId :" +  orderId);
		
		int intOrderItemCount = Integer.parseInt(orderItemCount);
		int intOrderItemId = Integer.parseInt(orderItemId);
		int intOrderId = Integer.parseInt(orderId);

		orderItem.setOrderItemId(intOrderItemId);
		orderItem.setOrderItemCount(intOrderItemCount);
		orderItem.setOrderId(intOrderId);

		System.out.println("!!!!!!!!!!!!!!" + orderItem);

		int result1 = adminService.modifyOrderItem(orderItem);
		int result2 = adminService.modifyTotalPrice(intOrderId);
		
		if (result1 > 0 && result2 > 0) {
			System.out.println("개별 주문 수정 성공");
			return "redirect:/admin/order";
		} else {
			System.out.println("개별 주문 수정 실패");
			return "/admin/order/orderitem/update";
		}
	}
	
//	결제=============================
	@GetMapping("/payment")
	public String findPaymentList(Model model) {
		List<Payment> paymentList = adminService.findPaymentList();
		model.addAttribute("paymentList", paymentList);
		
		return "/admin/adminPayment/adminPayment";
	}
	
	@GetMapping("/payment/search")
	public String findPaymentListBySearchCondition(PaymentSearchCondition paymentSearchCondition, Model model) {
		List<Payment> paymentList = adminService.findPaymentListBySearchCondition(paymentSearchCondition);
		model.addAttribute("paymentList", paymentList);
		
		return "/admin/adminPayment/findPayment";
	}
	
//	배송 ==============
	@GetMapping("/delivery")
	public String findDeliveryList(Model model) {
		List<Delivery> deliveryList = adminService.findDeliveryList();
		model.addAttribute("deliveryList", deliveryList);
		return "/admin/adminDelivery/adminDelivery";
		
	}

}
