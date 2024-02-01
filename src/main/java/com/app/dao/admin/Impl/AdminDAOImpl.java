package com.app.dao.admin.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.admin.AdminDAO;
import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.PostRecipeUpdateRecipeType;
import com.app.dto.product.Product;
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

//	회원 저장
	@Override
	public int saveMember(User user) {
		// TODO Auto-generated method stub

		System.out.println("adminDAO saveUser 불림");

		int result = sqlSessionTemplate.insert("admin_mapper.saveMember", user);

		return result;
	}

//	아이디로 회원 조회
	@Override
	public User findUserByMemberId(int memberId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findUserByMemberId 불림");

		User user = sqlSessionTemplate.selectOne("admin_mapper.findUserByMemberId", memberId);
		return user;
	}

//	회원 정보 수정
	@Override
	public int modifyMember(User user) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO modifyMember 불림");

		int result = sqlSessionTemplate.update("admin_mapper.modifyMember", user);
		return result;
	}

//	회원 삭제
	@Override
	public int removeMember(int memberId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO removeMember 불림");

		int result = sqlSessionTemplate.update("admin_mapper.removeMember", memberId);
		return result;
	}

//	==================================================================================
//	레시피 전체목록조회
	@Override
	public List<PostRecipe> findPostRecipeList() {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findPostRecipeList 불림");

		List<PostRecipe> postRecipeList = sqlSessionTemplate.selectList("admin_mapper.findPostRecipeList");

		return postRecipeList;
	}

//	레시피번호로 레세피 찾기
	@Override
	public PostRecipe findPostRecipeById(int recipeId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findPostRecipeById 불림");

		PostRecipe postRecipe = sqlSessionTemplate.selectOne("admin_mapper.findPostRecipeById", recipeId);

		return postRecipe;
	}

//	레시피 카테고리 수정
	@Override
	public int modifyRecipeType(PostRecipeUpdateRecipeType postRecipeUpdateRecipeType) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO modifyRecipeType 불림");

		int result = sqlSessionTemplate.selectOne("admin_mapper.findPostRecipeById", postRecipeUpdateRecipeType);

		return result;
	}

//	레시피 삭제
	@Override
	public int removePostRecipe(int recipeId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO removePostRecipe 불림");

		int result = sqlSessionTemplate.selectOne("admin_mapper.removePostRecipe", recipeId);

		return result;
	}

//	상품 =================================================
//	상품 찾기
	@Override
	public List<Product> findProductList() {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findProductList 불림");

		List<Product> productList = sqlSessionTemplate.selectList("admin_mapper.findProductList");

		return productList;
	}

//	상품번호로 상품 찾기
	@Override
	public Product findProductByProductId(int productId) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO findProductByProductId 불림");

		Product product = sqlSessionTemplate.selectOne("admin_mapper.findProductByProductId", productId);

		return product;
	}

//	상품 등록
	@Override
	public int saveProduct(Product product) {
		// TODO Auto-generated method stub
		System.out.println("adminDAO saveProduct 불림");

		int result = sqlSessionTemplate.selectOne("admin_mapper.saveProduct", product);

		return result;
	}

}
