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
	
}
