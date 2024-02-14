package com.app.service.mustEatPlace.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.mustEatPlace.MustEatPlaceDAO;
import com.app.dto.mustEatPlace.MainMustEatPlace;
import com.app.dto.mustEatPlace.MainMustEatPlaceMenuInfo;
import com.app.dto.mustEatPlace.MainMustEatPlaceReview;
import com.app.dto.mustEatPlace.MustEatPlace;
import com.app.dto.mustEatPlace.MustEatPlaceMenu;
import com.app.dto.mustEatPlace.MustEatPlaceWithMenu;
import com.app.service.mustEatPlace.MustEatPlaceService;

@Service
public class MustEatPlaceServiceImpl implements MustEatPlaceService{
	
	@Autowired
	MustEatPlaceDAO mustEatPlaceDAO;

	@Override
	public int saveMustEatPlace(MustEatPlace mustEatPlace) {
		int result = mustEatPlaceDAO.saveMustEatPlace(mustEatPlace);
		return result;
	}

	@Override
	public int removeMustEatPlaceById(int id) {
		int result = mustEatPlaceDAO.removeMustEatPlaceById(id);
		return result;
	}

	@Override
	public List<MustEatPlaceWithMenu> findMustEatPlaceWithMenu() {
		List<MustEatPlaceWithMenu> mustEatPlaceWithMenu = mustEatPlaceDAO.findMustEatPlaceWithMenu();
		return mustEatPlaceWithMenu;
	}

	@Override
	public int modifyMustEatPlace(MustEatPlace mustEatPlace) {
		int result = mustEatPlaceDAO.modifyMustEatPlace(mustEatPlace);
		return result;
	}

	@Override
	public MustEatPlace findMustEatPlaceById(int id) {
		MustEatPlace mustEatPlace = mustEatPlaceDAO.findMustEatPlaceById(id);
		return mustEatPlace;
	}

	@Override
	public List<MustEatPlaceMenu> findMustEatPlaceMenuById(int id) {
		List<MustEatPlaceMenu> mustEatPlaceMenu = mustEatPlaceDAO.findMustEatPlaceMenuById(id);
		return mustEatPlaceMenu;
	}

	@Override
	public int saveMenuInfo(int mustEatPlaceId, String menuName, int price) {
		MustEatPlaceMenu mustEatPlaceMenu = new MustEatPlaceMenu();
		
		mustEatPlaceMenu.setMenuId(mustEatPlaceId);
		mustEatPlaceMenu.setMenuName(menuName);
		mustEatPlaceMenu.setPrice(price);
		
		int result = mustEatPlaceDAO.saveMenuInfo(mustEatPlaceMenu);
		
		return result;
	}

	@Override
	public int removeMenuByName(String menuName) {
		int result = mustEatPlaceDAO.removeMenuByName(menuName);
		return result;
	}

	@Override
	public int updateImageData(MustEatPlace mustEatPlace) {
		int result = mustEatPlaceDAO.updateImageData(mustEatPlace);
		return result;
	}

	@Override
	public int removeImage(int id) {
		int result = mustEatPlaceDAO.removeImage(id);
		return result;
	}

	@Override
	public List<MainMustEatPlace> findMainMustEatPlaceList() {
		List<MainMustEatPlace> mainMustEatPlace = mustEatPlaceDAO.findMainMustEatPlaceList();
		return mainMustEatPlace;
	}

	@Override
	public MainMustEatPlace findMainMustEatPlaceById(int id) {
		MainMustEatPlace mainMustEatPlace = mustEatPlaceDAO.findMainMustEatPlaceById(id);
		return mainMustEatPlace;
	}

	@Override
	public List<MustEatPlace> findMustEatPlaceList(String userId) {
		List<MustEatPlace> mustEatPlace = mustEatPlaceDAO.findMustEatPlaceList(userId);
		return mustEatPlace;
	}

	@Override
	public List<MainMustEatPlaceMenuInfo> mainFindMustEatPlaceMenuById(int id) {
		List<MainMustEatPlaceMenuInfo> mainMustEatPlaceMenuInfo = mustEatPlaceDAO.mainFindMustEatPlaceMenuById(id);
		return mainMustEatPlaceMenuInfo;
	}

	@Override
	public List<MainMustEatPlaceReview> mainFindMustEatPlaceReviewById(int id) {
		List<MainMustEatPlaceReview> mainMustEatPlaceReview = mustEatPlaceDAO.mainFindMustEatPlaceReviewById(id);
		return mainMustEatPlaceReview;
	}

	@Override
	public int saveReview(MainMustEatPlaceReview mainMustEatPlaceReview) {
		int result = mustEatPlaceDAO.saveReview(mainMustEatPlaceReview);
		return result;
	}

	@Override
	public int updateImage(MainMustEatPlaceReview mustEatPlaceReview) {
		int result = mustEatPlaceDAO.updateImage(mustEatPlaceReview);
		return result;
	}

	@Override
	public int removeReview(String review) {
		int result = mustEatPlaceDAO.removeReview(review);
		return result;
	}

}
