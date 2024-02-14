package com.app.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component   //@Service @Repository
public class LoginManager {
	
	private static String sessionLoginId = "loginId";
	
	//세션에 로그인 기록
	public void setSessionLogin(String userId, HttpSession session) {
		session.setAttribute(sessionLoginId, userId);
	}
	
	public void setSessionLogin(String userId, HttpServletRequest request) {
		setSessionLogin(userId, request.getSession());
		//request.getSession().setAttribute(sessionLoginId, userId);
	}
	//세션에서 로그인 여부 확인
	
	public boolean isLogin(HttpSession session) {
		if(session != null && session.getAttribute(sessionLoginId) != null) {
			return true;
		}
		
		return false;
	}
	
	public boolean isLogin(HttpServletRequest request) {
		return isLogin(request.getSession(false));
	}
	
	public void logout(HttpSession session) {
		//session.removeAttribute(sessionLoginId);
		session.invalidate(); //로그아웃 처리   
	}
	
	public void logout(HttpServletRequest request) {
		logout(request.getSession());
	}
}
