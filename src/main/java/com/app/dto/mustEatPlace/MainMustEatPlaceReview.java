package com.app.dto.mustEatPlace;

import lombok.Data;

@Data
public class MainMustEatPlaceReview {
	int id;
	int menuId;
	String review;
	String representativeMenuImage;
	int rating;
	String userId;
}
