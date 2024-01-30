package com.app.dao.UserImpl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.User.UserDAO;
import com.app.dto.user.User;

@Repository
public class UserDAOImpl implements UserDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public User findUserByLoginId(User user) {
		// TODO Auto-generated method stub
		user = sqlSessionTemplate.selectOne("user_mapper.findUserByLoginId", user);
		return user;
	}
}
