package com.app.dto.mustEatPlace;

import lombok.Data;

@Data
public class MustEatPlaceSearchCondition {
	String id;
	String restaurantName;
	String place;
	String telephoneNumber;
	String memberId;
	String review;
	String rating;
	String openingHours;
	String closingHours;
	String businessStatus;
	String type;
	String searchKeyword;
}
