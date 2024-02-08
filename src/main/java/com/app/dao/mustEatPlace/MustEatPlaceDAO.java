package com.app.dao.mustEatPlace;

import java.util.List;

import com.app.dto.mustEatPlace.MainMustEatPlace;
import com.app.dto.mustEatPlace.MustEatPlace;
import com.app.dto.mustEatPlace.MustEatPlaceMenu;
import com.app.dto.mustEatPlace.MustEatPlaceWithMenu;

public interface MustEatPlaceDAO {
	
	public int saveMustEatPlace(MustEatPlace mustEatPlace);
	
	public List<MustEatPlace> findMustEatPlaceList(String userId);
	
	public int removeMustEatPlaceById(int id);
	
	public List<MustEatPlaceWithMenu> findMustEatPlaceWithMenu();
	
	public int modifyMustEatPlace(MustEatPlace mustEatPlace);
	
	public MustEatPlace findMustEatPlaceById(int id);
	
	public List<MustEatPlaceMenu> findMustEatPlaceMenuById(int id);
	
	public int saveMenuInfo(MustEatPlaceMenu mustEatPlaceMenu);
	
	public int removeMenuByName(String menuName);
	
	public int updateImageData(MustEatPlace mustEatPlace);
	
	public int removeImage(int id);
	
	public List<MainMustEatPlace> findMainMustEatPlaceList();
	
	public MainMustEatPlace findMainMustEatPlaceById(int id);
	/*
	public MustEatPlaceMenu getMenuByIdAndName(int menu_id, String menu_name);

    public void modifyMenu(MustEatPlaceMenu menu);
    */
}
