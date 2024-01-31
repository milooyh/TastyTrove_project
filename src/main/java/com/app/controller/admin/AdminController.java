package com.app.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

//	화면 불러오기
	@GetMapping("/member")
	public String adminMemberList(Model model) {
		System.out.println("adminController 회원 정보 부르기");
		
		List<User> userList = adminService.findUserList();
		System.out.println(userList);
		
		model.addAttribute("userList", userList);		
				
		return "/admin/adminMember";
	}

//	레시피게시판 관리 ======================
	@RequestMapping("/recipeboard")
	public String adminRecipeBoard() {
		return "/admin/adminRecipeBoard";
	}

//	맛집 관리 ======================
	@RequestMapping("/musteatplace")
	public String adminMustEatPlace() {
		return "/admin/adminMustEatPlace";
	}

//	상품 관리 ======================
	@RequestMapping("/product")
	public String adminProduct() {
		return "/admin/adminProduct";
	}

//	주문 관리 ======================
	@RequestMapping("/order")
	public String adminOrder() {
		return "/admin/adminOrder";
	}

//	결제 관리 ======================
	@RequestMapping("/payment")
	public String adminPayment() {
		return "/admin/adminPayment";
	}

//	배송 관리 ======================
	@RequestMapping("/delivery")
	public String adminDelivery() {
		return "/admin/adminDelivery";
	}

}
