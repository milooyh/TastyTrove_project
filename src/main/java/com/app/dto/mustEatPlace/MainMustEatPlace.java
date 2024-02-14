package com.app.dto.mustEatPlace;

import lombok.Data;

@Data
public class MainMustEatPlace {
	int id;
	String place;
	String restaurantName;
	String telephoneNumber;
	String representativeMenuImage;
	double rating;
	String openingHours;
	String closingHours;
	String businessStatus;
	String type;
}