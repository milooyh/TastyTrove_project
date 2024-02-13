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
//	관리자
	@RequestMapping
	public String admin(HttpSession session) {
		return "admin/adminHome";
	}
	
//	로그인
	@GetMapping("/login")
	public String login() {
		return "user/login";
	}

	@PostMapping("/login")
	public String loginProcess(User user, HttpSession session, Model model) {

	    User findUser = userService.findUserByLoginId(user);
	    System.out.println(findUser);

	    if (findUser == null) { // 로그인 실패하면 로그인 페이지로 다시
	        System.out.println("로그인 실패");
	        model.addAttribute("errorMessage", "로그인에 실패했습니다");
	        return "user/login";
	    }

	    session.setAttribute("userId", findUser.getUserId()); // 로그인한 아이디 세션 저장
	    session.setAttribute("userType", findUser.getUserType());
	    
	    System.out.println("sesssssssssssion 값 !!!!!!! : " + session.getAttribute("userId"));
	    
	    System.out.println("로그인한 회원 유형 : " + findUser.getUserType());

		if (findUser != null) { // 로그인 성공
			System.out.println("로그인 성공");
			if (findUser.getUserType().equals(CommonCode.USER_USERTYPE_ADMIN)) {
				System.out.println("관리자입니다");
				return "/admin/adminHome";
			} else if (findUser.getUserType().equals(CommonCode.USER_USERTYPE_CUSTOMER)) {
				System.out.println("회원입니다");
				return "redirect:/main";
			}
		}

	
//	로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃 완");
		return "redirect:/";
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
		if (user == null) {
			System.out.println("아이디 사용 가능");
			return "0";
		} else {
			System.out.println("아이디 사용 불가");
		}
		return "1";
	}

//	비번 잇나 확인
	@PostMapping("/signup/checkPw")
	@ResponseBody
	public String checkPw(@RequestParam String userPassword, @RequestParam String userPasswordChk) {
		User user = userService.findUserByUserPassword(userPassword);
		System.out.println("user : " + user);
		System.out.println("userpw : " + userPassword);
		System.out.println("pwchk : " + userPasswordChk);

		String result = null;
		if (user == null && !userPassword.equals(userPasswordChk)) {
			System.out.println("비밀번호 불일치");
			result = "1";
			return result;
		} else if (user == null && userPassword.equals(userPasswordChk)) {
			System.out.println("비밀번호 일치");
			result = "0";
			return result;
		}

		return result;
	}

//	별명 있나 확인
	@PostMapping("/signup/checknickname")
	@ResponseBody
	public String checkNickname(@RequestParam String userNickname) {
		User user = userService.findUserByUserNickname(userNickname);
		if (user == null) {
			System.out.println("별명 사용 가능");
			return "0";
		} else {
			System.out.println("별명 사용 불가");
		}
		return "1";
	}

//	전번 있나 확인
	@PostMapping("/signup/checktel")
	@ResponseBody
	public String checkTel(@RequestParam String tel1, @RequestParam String tel2, @RequestParam String tel3, User user) {
		
//		 전화번호 하나로 합치기
		String userTel = (tel1.length() == 2 ? "0" + tel1 : tel1) + "-" + (tel2.length() == 3 ? "0" + tel2 : tel2) + "-"
				+ (tel3.length() == 3 ? "0" + tel3 : tel3);
		
		user.setUserTel(userTel);
		System.out.println("userTel : " + userTel);
		
		user = userService.findUserByUserTel(userTel);
		System.out.println(user);
		
		if (user == null) {
			System.out.println("전번 사용 가능");
			return "0";
		} else {
			System.out.println("전번 사용 불가");
		}
		return "1";
	}
	
//	이메일 있나 확인
	@PostMapping("/signup/checkemail")
	@ResponseBody
	public String checkAddress(@RequestParam String userEmail) {
		System.out.println("email 컨트롤러 불림");
		
		User user = userService.findUserByUserEmail(userEmail);
		System.out.println(userEmail);
		
		if (user == null) {
			System.out.println("이메일 사용 가능");
			return "0";
		} else {
			System.out.println("이메일 사용 불가");
		}
		return "1";
	}

//	회원가입
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
			return "redirect:/login";
		} else {
			System.out.println("회원가입 실패... result = " + result);
			return "/signup";
		}

	}

//	관리자 페이지 =================
	@RequestMapping("/admin")
	public String adminHome() {
		return "/admin/adminHome";
	}

}
