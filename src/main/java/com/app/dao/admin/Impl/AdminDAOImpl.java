package com.app.dao.admin.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.admin.AdminDAO;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

//	회원목록전체찾기
	@Override
	public List<User> findUserList() {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findUserList 불림");

		List<User> userList = sqlSessionTemplate.selectList("admin_mapper.findUserList");
		System.out.println("adminDAO 결과 : " + userList);

		return userList;
	}

//	조건에 따라 회원 정보 검색
	@Override
	public List<User> findUserListBySearchCondition(UserSearchCondition userSearchCondition) {
		// TODO Auto-generated method stub

		System.out.println("adminDAO findUserListBySearchCondition 불림");

		List<User> userList = sqlSessionTemplate.selectList("admin_mapper.findUserListBySearchCondition",
				userSearchCondition);
		System.out.println("adminDAO 결과 : " + userList);

		return userList;
	}

}
