package com.app.service.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.admin.AdminDAO;
import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.service.admin.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

//	회원 전체 조회
	@Override
	public List<User> findUserList() {
		// TODO Auto-generated method stub

		System.out.println("adminService findUserList 불림");

		List<User> userList = adminDAO.findUserList();
		System.out.println("adminService 결과 : " + userList);

		return userList;
	}

//	검색 조건에 따라 회원 정보 찾기
	@Override
	public List<User> findUserListBySearchCondition(UserSearchCondition userSearchCondition) {
		// TODO Auto-generated method stub
		System.out.println("adminService findUserListBySearchCondition 불림");

		List<User> userList = adminDAO.findUserListBySearchCondition(userSearchCondition);
		System.out.println("adminService 결과 : " + userList);

		return userList;
	}

}
