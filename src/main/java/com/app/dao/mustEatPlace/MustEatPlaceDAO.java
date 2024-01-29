package com.app.dao.mustEatPlace;

import java.util.List;

import com.app.dto.mustEatPlace.MustEatPlace;

public interface MustEatPlaceDAO {
	
	public int saveMustEatPlace(MustEatPlace mustEatPlace);
	
	public List<MustEatPlace> findMustEatPlaceList();

}
