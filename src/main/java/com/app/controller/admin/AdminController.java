package com.app.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

		return "/admin/adminMember";
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
				if (intBirthDate< 10) {
					birthDateWithZero = "0" + userSearchCondition.getBirthDate();
					System.out.println(birthDateWithZero);
					userSearchCondition.setBirthDate(birthDateWithZero);
				}
			} catch (NumberFormatException e) {
				// TODO: handle exception
			}

		List<User> userList = adminService.findUserListBySearchCondition(userSearchCondition);
		model.addAttribute("userList", userList);

		return "/admin/findMember";
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
