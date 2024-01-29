package com.app.service.mustEatPlace;

import java.util.List;

import com.app.dto.mustEatPlace.MustEatPlace;

public interface MustEatPlaceService {
	
	public int saveMustEatPlace(MustEatPlace mustEatPlace);
	
	public List<MustEatPlace> findMustEatPlaceList();

}
