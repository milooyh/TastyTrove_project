package com.app.service.mustEatPlace;

import java.util.List;

import com.app.dto.mustEatPlace.MainMustEatPlace;
import com.app.dto.mustEatPlace.MainMustEatPlaceMenuInfo;
import com.app.dto.mustEatPlace.MainMustEatPlaceReview;
import com.app.dto.mustEatPlace.MustEatPlace;
import com.app.dto.mustEatPlace.MustEatPlaceMenu;
import com.app.dto.mustEatPlace.MustEatPlaceWithMenu;

public interface MustEatPlaceService {
	
	public int saveMustEatPlace(MustEatPlace mustEatPlace);
	
	public List<MustEatPlace> findMustEatPlaceList(String userId);
	
	public int removeMustEatPlaceById(int id);
	
	public List<MustEatPlaceWithMenu> findMustEatPlaceWithMenu();
	
	public int modifyMustEatPlace(MustEatPlace mustEatPlace);
	
	public MustEatPlace findMustEatPlaceById(int id);
	
	public List<MustEatPlaceMenu> findMustEatPlaceMenuById(int id);
	
	public int saveMenuInfo(int mustEatPlaceId, String menuName, int price);
	
	public int removeMenuByName(String menuName);
	
	public int updateImageData(MustEatPlace mustEatPlace);
	
	public int removeImage(int id);
	
	public List<MainMustEatPlace> findMainMustEatPlaceList();
	
	public MainMustEatPlace findMainMustEatPlaceById(int id);
	
	public List<MainMustEatPlaceMenuInfo> mainFindMustEatPlaceMenuById(int id);
	
	public List<MainMustEatPlaceReview> mainFindMustEatPlaceReviewById(int id);
	
	public int saveReview(MainMustEatPlaceReview mainMustEatPlaceReview);

	public int updateImage(MainMustEatPlaceReview mustEatPlaceReview);
	
	public int removeReview(String review);

}
