package com.app.dao.mustEatPlace;

import java.util.List;

import com.app.dto.mustEatPlace.MustEatPlace;
import com.app.dto.mustEatPlace.MustEatPlaceMenu;
import com.app.dto.mustEatPlace.MustEatPlaceWithMenu;

public interface MustEatPlaceDAO {
	
	public int saveMustEatPlace(MustEatPlace mustEatPlace);
	
	public List<MustEatPlace> findMustEatPlaceList();
	
	public int removeMustEatPlaceById(int id);
	
	public List<MustEatPlaceWithMenu> findMustEatPlaceWithMenu();
	
	public int modifyMustEatPlace(MustEatPlace mustEatPlace);
	
	public MustEatPlace findMustEatPlaceById(int id);
	
	public List<MustEatPlaceMenu> findMustEatPlaceMenuById(int id);
}
