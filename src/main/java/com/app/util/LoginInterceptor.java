package com.app.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.app.common.CommonCode;
import com.app.dto.user.User;

@Component
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("prehandle");

		HttpSession session = request.getSession();

		if (session.getAttribute("userId") == null || session.getAttribute("userType") == null
				|| !session.getAttribute("userType").equals(CommonCode.USER_USERTYPE_ADMIN)) {
			response.sendRedirect("/login");
			return false; // 요청 처리 중단
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

}
