package com.app.service.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.admin.AdminDAO;
import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.PostRecipeUpdateRecipeType;
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

//	회원 추가
	@Override
	public int saveMember(User user) {
		// TODO Auto-generated method stub
		System.out.println("adminService saveUser 불림");

		int result = adminDAO.saveMember(user);

		return result;
	}

//	아이디로 회원 조회
	@Override
	public User findUserByMemberId(int memberId) {
		// TODO Auto-generated method stub
		System.out.println("adminService findUserByMemberId 불림");

		User user = adminDAO.findUserByMemberId(memberId);

		return user;
	}

//	회원 정보 수정
	@Override
	public int modifyMember(User user) {
		// TODO Auto-generated method stub
		System.out.println("adminService modifyMember 불림");

		int result = adminDAO.modifyMember(user);

		return result;
	}

//	회원 삭제
	@Override
	public int removeMember(int memberId) {
		// TODO Auto-generated method stub
		System.out.println("adminService removeMember 불림");

		int result = adminDAO.removeMember(memberId);

		return result;
	}

//	====================================================
//	레시피 전체 조회
	@Override
	public List<PostRecipe> findPostRecipeList() {
		// TODO Auto-generated method stub
		System.out.println("adminService findPostRecipeList 불림");

		List<PostRecipe> postRecipeList = adminDAO.findPostRecipeList();

		return postRecipeList;
	}
//	레시피 번호로 레시피 찾기
	@Override
	public PostRecipe findPostRecipeById(int recipeId) {
		// TODO Auto-generated method stub
		System.out.println("adminService findPostRecipeById 불림");

		PostRecipe postRecipe = adminDAO.findPostRecipeById(recipeId);

		return postRecipe;
	}
	
//	레시피 카테고리 수정
	@Override
	public int modifyRecipeType(PostRecipeUpdateRecipeType postRecipeUpdateRecipeType) {
		// TODO Auto-generated method stub
		System.out.println("adminService modifyRecipeType 불림");

		int result = adminDAO.modifyRecipeType(postRecipeUpdateRecipeType);
		return result;
	}
	
//	레시피 삭제
	@Override
	public int removePostRecipe(int recipeId) {
		// TODO Auto-generated method stub
		System.out.println("adminService removePostRecipe 불림");

		int result = adminDAO.removePostRecipe(recipeId);

		return result;
	}


}
