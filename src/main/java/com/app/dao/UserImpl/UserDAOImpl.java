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

//	회원정보 찾기
	@Override
	public User findUserByLoginId(User user) {
	    try {
	        System.out.println("userDAO findUser 불림");
	        user = sqlSessionTemplate.selectOne("user_mapper.findUserByLoginId", user);
	        System.out.println("userDAO 값 : " + user);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return user;
	}


//	회원추가
	@Override
	public int saveUser(User user) {
		// TODO Auto-generated method stub
		
		System.out.println("userDAO saveUser 불림");
		
		int result = sqlSessionTemplate.insert("user_mapper.saveUser", user);
		return result;
	}
}
