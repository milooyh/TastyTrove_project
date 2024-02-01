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

import com.app.common.CommonCode;
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

		return "/admin/findMember";
	}

//	관리자 추가
	@GetMapping("/member/add")
	public String saveMember() {
		return "/admin/saveMember";
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
			return "redirect:/admin/member";
		} else {
			System.out.println("관리자 등록 실패");
			return "/admin/saveMember";
		}

	}

//	회원 정보 수정
	@GetMapping("/member/update")
	public String modifyMember(@RequestParam String memberId, Model model, User user) {

		int intMemberId = Integer.parseInt(memberId); // db와 형태를 맞추기 위해 다시 int로 변환
		user = adminService.findUserByMemberId(intMemberId);
		model.addAttribute("user", user);

		return "/admin/modifyMember";
	}

	@PostMapping("/member/update")
	public String modifyMemberProcess(User user) {

		System.out.println("adminController 회원 정보 수정");

		int result = adminService.modifyMember(user);
		if (result > 0) {
			return "redirect:/admin/member";
		} else {
			return "/admin";
		}
	}
	
//	회원 삭제
	@GetMapping("/member/remove")
	public String removeMember(@RequestParam String memberId) {
		int intMemberId = Integer.parseInt(memberId);
		
		int result = adminService.removeMember(intMemberId);
		if(result > 0) {
			System.out.println("회원 삭제 성공");
			return "redirect:/admin/member";
		} else {
			System.out.println("회원 삭제 실패");
			return "admin/member";
		}
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
