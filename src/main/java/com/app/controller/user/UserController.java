package com.app.controller.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.common.CommonCode;
import com.app.dto.user.User;
import com.app.service.User.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;

//	로그인 =====================================
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}

	@PostMapping("/login")
	public String loginProcess(User user, HttpSession session) {

		User findUser = userService.findUserByLoginId(user);
		System.out.println(findUser);

		if (findUser == null) { // 로그인 실패하면 로그인 페이지로 다시
			System.out.println("로그인 실패");
			return "user/login";
		}

		session.setAttribute("userId", findUser.getUserId()); // 로그인한 아이디 세션 저장
		System.out.println(session);

		if (findUser != null) { // 로그인 성공
			System.out.println("로그인 성공");
			if (findUser.getUserType().equals(CommonCode.USER_USERTYPE_ADMIN)) {
				System.out.println("관리자입니다");
				return "/admin/adminHome";
			} else if (findUser.getUserType().equals(CommonCode.USER_USERTYPE_CUSTOMER)) {
				System.out.println("회원입니다");
				return "/home";
			}
		}

		return "user/login";
	}

//	회원가입 ====================================
	@GetMapping("/signup")
	public String signup() {
		return "user/signup";
	}

//	아이디 있나 확인
	@PostMapping("/signup/checkId")
	@ResponseBody
	public String checkId(@RequestParam String userId) {
		User user = userService.findUserByUserId(userId);
		if (user != null) {
			System.out.println("아이디 사용 가능");
			return "0";
		} else {
			System.out.println("아이디 사용 불가");
		}
		return "1";
	}

	@PostMapping("/signup")
	public String signupProcess(@ModelAttribute User user, @RequestParam("userId") String userId,
			@RequestParam("userPassword") String userPassword, @RequestParam("userName") String userName,
			@RequestParam("userNickname") String userNickname, @RequestParam("userAddress") String userAddress,
			@RequestParam("userEmail") String userEmail, @RequestParam("birthYear") String birthYear,
			@RequestParam("birthMonth") String birthMonth, @RequestParam("birthDate") String birthDate,
			@RequestParam("tel1") String tel1, @RequestParam("tel2") String tel2, @RequestParam("tel3") String tel3,
			Model model) {

		user.setUserId(userId);
		user.setUserPassword(userPassword);
		user.setUserName(userName);
		user.setUserNickname(userNickname);
		user.setUserAddress(userAddress);
		user.setUserEmail(userEmail);
		user.setUserType(CommonCode.USER_USERTYPE_CUSTOMER);

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

		int result = userService.saveUser(user);
		if (result > 0) {
			System.out.println("회원가입 성공! result = " + result);
			return "redirect:/user/login";
		} else {
			System.out.println("회원가입 실패... result = " + result);
			return "user/signup";
		}

	}

//	관리자 페이지 =================
	@RequestMapping("/admin")
	public String adminHome() {
		return "/admin/adminHome";
	}

}
