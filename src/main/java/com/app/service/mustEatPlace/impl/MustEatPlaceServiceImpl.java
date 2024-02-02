package com.app.service.mustEatPlace.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.mustEatPlace.MustEatPlaceDAO;
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
	public List<MustEatPlace> findMustEatPlaceList() {
		
		List<MustEatPlace> mustEatPlace = mustEatPlaceDAO.findMustEatPlaceList();
		
		return mustEatPlace;
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

	

}
