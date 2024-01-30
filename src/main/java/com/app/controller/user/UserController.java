package com.app.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String loginProcess(User user, Model model) {		
		User findUser = userService.findUserByLoginId(user);
		System.out.println(findUser);
		
		if(findUser != null) { // 로그인 성공
			model.addAttribute("user", findUser);
			
			if("CUS".equals(findUser.getUserType())) {
				return "redirect:/home";
			} else if("CUS".equals(findUser.getUserType())) {
				return "redirect:/admin";
			}
		}
		
		return "user/login";
	}	
//	회원가입 ====================================
	@GetMapping("/signup")
	public String signup() {
		return "user/signup";
	}
	
	@PostMapping("/signup")
	public String signupProcess(@RequestParam String loginId, @RequestParam String pw) {
		System.out.println(loginId); // 아이디값 잘 들어왔나 확인
		System.out.println(pw); // 비번값 잘 들어왔나 확인
		return "home";
	}
	
	

	

}
