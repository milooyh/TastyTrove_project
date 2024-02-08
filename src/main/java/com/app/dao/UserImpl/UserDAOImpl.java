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

//	아이디 있나 조회
	@Override
	public User findUserByUserId(String userId) {
		// TODO Auto-generated method stub
		User user = sqlSessionTemplate.selectOne("user_mapper.findUserByUserId", userId);
		return user;
	}


//	비밀번호 있나 조회
	@Override
	public User findUserByUserPassword(String userPassword) {
		// TODO Auto-generated method stub
		User user = sqlSessionTemplate.selectOne("user_mapper.findUserByUserPassword", userPassword);
		return user;
	}

//	닉네임 있나
	@Override
	public User findUserByUserNickname(String userNickname) {
		// TODO Auto-generated method stub
		User user = sqlSessionTemplate.selectOne("user_mapper.findUserByUserNickname", userNickname);
		return user;
	}

//	전화번호있나
	@Override
	public User findUserByUserTel(String userTel) {
		// TODO Auto-generated method stub
		User user = sqlSessionTemplate.selectOne("user_mapper.findUserByUserTel", userTel);
		return user;
	}

//	이메일 있나 확인
	@Override
	public User findUserByUserEmail(String userEmail) {
		// TODO Auto-generated method stub
		User user = sqlSessionTemplate.selectOne("user_mapper.findUserByUserEmail", userEmail);
		System.out.println("dao : " + userEmail);
		return user;
	}


}
