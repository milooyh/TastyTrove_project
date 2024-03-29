package com.app.service.User.UserImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.User.UserDAO;
import com.app.dto.user.User;
import com.app.service.User.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserDAO userDAO;

//	유저찾기
	@Override
	public User findUserByLoginId(User user) {
		// TODO Auto-generated method stub
		System.out.println("userService findUser 불림");
		
		user = userDAO.findUserByLoginId(user);
		return user;
	}

//	유저저장
	@Override
	public int saveUser(User user) {
		// TODO Auto-generated method stub
		
		System.out.println("userService saveUser 불림");
		int result = userDAO.saveUser(user);
		
		return result;
	}

//	아이디로 조회
	@Override
	public User findUserByUserId(String userId) {
		// TODO Auto-generated method stub
		User user = userDAO.findUserByUserId(userId);
		return user;
	}

//	비밀번호 조회
	@Override
	public User findUserByUserPassword(String userPassword) {
		// TODO Auto-generated method stub
		User user = userDAO.findUserByUserPassword(userPassword);
		return user;
	}

//	별명 있나
	@Override
	public User findUserByUserNickname(String userNickname) {
		// TODO Auto-generated method stub
		User user = userDAO.findUserByUserNickname(userNickname);
		return user;
	}

//	전번있나
	@Override
	public User findUserByUserTel(String userTel) {
		// TODO Auto-generated method stub
		User user = userDAO.findUserByUserTel(userTel);
		return user;
	}

//	이메일 있나
	@Override
	public User findUserByUserEmail(String userEmail) {
		// TODO Auto-generated method stub
		User user = userDAO.findUserByUserEmail(userEmail);
		return user;
	}
	
}
