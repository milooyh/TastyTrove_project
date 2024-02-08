package com.app.dto.mustEatPlace;

import lombok.Data;

@Data
public class MustEatPlace {
	int id;
	String restaurantName;
	String place;
	String review;
	int asterion;
	String telephoneNumber;
	String representativeMenu;
	//byte[] representativeMenuImage;
	String representativeMenuImage;
	String userId;
}
