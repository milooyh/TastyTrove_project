package com.app.service.mustEatPlace.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.mustEatPlace.MustEatPlaceDAO;
import com.app.dto.mustEatPlace.MustEatPlace;
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

}
