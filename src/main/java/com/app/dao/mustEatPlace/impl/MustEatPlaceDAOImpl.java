package com.app.dao.mustEatPlace.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.mustEatPlace.MustEatPlaceDAO;
import com.app.dto.mustEatPlace.MainMustEatPlace;
import com.app.dto.mustEatPlace.MainMustEatPlaceMenuInfo;
import com.app.dto.mustEatPlace.MainMustEatPlaceReview;
import com.app.dto.mustEatPlace.MustEatPlace;
import com.app.dto.mustEatPlace.MustEatPlaceMenu;
import com.app.dto.mustEatPlace.MustEatPlaceWithMenu;

@Repository
public class MustEatPlaceDAOImpl implements MustEatPlaceDAO{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int saveMustEatPlace(MustEatPlace mustEatPlace) {
		int result = sqlSessionTemplate.insert("mustEatPlace_mapper.saveMustEatPlace", mustEatPlace);
		return result;
	}

	/*
	@Override
	public List<MustEatPlace> findMustEatPlaceList() {
		List<MustEatPlace> mustEatPlace = sqlSessionTemplate.selectList("mustEatPlace_mapper.findMustEatPlace");
		return mustEatPlace;
	}
	*/

	@Override
	public int removeMustEatPlaceById(int id) {
		int result = sqlSessionTemplate.delete("mustEatPlace_mapper.removeMustEatPlace", id);
		return result;
	}

	@Override
	public List<MustEatPlaceWithMenu> findMustEatPlaceWithMenu() {
		List<MustEatPlaceWithMenu> mustEatPlaceWithMenu = sqlSessionTemplate.selectList("mustEatPlace_mapper.findMustEatPlaceWithMenu");
		return mustEatPlaceWithMenu;
	}

	@Override
	public int modifyMustEatPlace(MustEatPlace mustEatPlace) {
		int result = sqlSessionTemplate.update("mustEatPlace_mapper.modifyMustEatPlace", mustEatPlace);
		return result;
	}

	@Override
	public MustEatPlace findMustEatPlaceById(int id) {
		MustEatPlace mustEatPlace = sqlSessionTemplate.selectOne("mustEatPlace_mapper.findMustEatPlaceById", id);
		return mustEatPlace;
	}

	@Override
	public List<MustEatPlaceMenu> findMustEatPlaceMenuById(int id) {
		List<MustEatPlaceMenu> mustEatPlaceMenu= sqlSessionTemplate.selectList("mustEatPlace_mapper.findMustEatPlaceMenuById", id);
		return mustEatPlaceMenu;
	}

	@Override
	public int saveMenuInfo(MustEatPlaceMenu mustEatPlaceMenu) {
		int result = sqlSessionTemplate.insert("mustEatPlace_mapper.saveMenuById", mustEatPlaceMenu);
		return result;
	}

	@Override
	public int removeMenuByName(String menuName) {
		int result = sqlSessionTemplate.delete("mustEatPlace_mapper.removeMenuByName", menuName);
		return result;
	}

	@Override
	public int updateImageData(MustEatPlace mustEatPlace) {
		int result = sqlSessionTemplate.update("mustEatPlace_mapper.updateImagePath", mustEatPlace);
		
		return result;
	}

	@Override
	public int removeImage(int id) {
		int result = sqlSessionTemplate.update("mustEatPlace_mapper.removeImage", id);
		return result;
	}

	@Override
	public List<MainMustEatPlace> findMainMustEatPlaceList() {
		List<MainMustEatPlace> mainMustEatPlace = sqlSessionTemplate.selectList("mustEatPlace_mapper.mainFindMustEatPlace");
		return mainMustEatPlace;
	}

	@Override
	public MainMustEatPlace findMainMustEatPlaceById(int id) {
		MainMustEatPlace mainMustEatPlace = sqlSessionTemplate.selectOne("mustEatPlace_mapper.mainFindMustEatPlaceById", id);
		return mainMustEatPlace;
	}

	@Override
	public List<MustEatPlace> findMustEatPlaceList(String userId) {
		List<MustEatPlace> mustEatPlace = sqlSessionTemplate.selectList("mustEatPlace_mapper.findMustEatPlace", userId);
		return mustEatPlace;
	}

	@Override
	public List<MainMustEatPlaceMenuInfo> mainFindMustEatPlaceMenuById(int id) {
		List<MainMustEatPlaceMenuInfo> mainMustEatPlaceMenuInfo = sqlSessionTemplate.selectList("mustEatPlace_mapper.mainFindMustEatPlaceMenuById", id);
		return mainMustEatPlaceMenuInfo; 
	}

	@Override
	public List<MainMustEatPlaceReview> mainFindMustEatPlaceReviewById(int id) {
		List<MainMustEatPlaceReview> mainMustEatPlaceReview = sqlSessionTemplate.selectList("mustEatPlace_mapper.mainFindMustEatPlaceReviewById", id);
		return mainMustEatPlaceReview;
	}

	@Override
	public int saveReview(MainMustEatPlaceReview mainMustEatPlaceReview) {
		int result = sqlSessionTemplate.insert("mustEatPlace_mapper.saveReview", mainMustEatPlaceReview);
		return result;
	}

	@Override
	public int updateImage(MainMustEatPlaceReview mustEatPlaceReview) {
		int result = sqlSessionTemplate.update("mustEatPlace_mapper.updateImageReviewPath", mustEatPlaceReview);
		return result;
	}

	@Override
	public int removeReview(String review) {
		int result = sqlSessionTemplate.delete("mustEatPlace_mapper.removeReview", review);
		return result;
	}


	/*
	@Override
	public MustEatPlaceMenu getMenuByIdAndName(int menu_id, String menu_name) {
		return sqlSessionTemplate.selectOne("mustEatPlace_mapper.getMenuByIdAndName", new MustEatPlaceMenu(menu_id, menu_name));
	}

	@Override
	public void modifyMenu(MustEatPlaceMenu menu) {
		sqlSessionTemplate.update("mustEatPlace_mapper.modifyMenu", menu);
		
	}
	*/

}
