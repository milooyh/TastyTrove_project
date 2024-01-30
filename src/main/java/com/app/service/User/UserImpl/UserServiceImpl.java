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

	@Override
	public User findUserByLoginId(User user) {
		// TODO Auto-generated method stub
		user = userDAO.findUserByLoginId(user);
		return user;
	}
	
}
