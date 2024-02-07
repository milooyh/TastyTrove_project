
package com.app.dto.mustEatPlace;

import lombok.Data;

@Data
public class MustEatPlace {
	int placeId;
	String restaurantName;
	String place;
	String review;
	int rating;
	String telephoneNumber;
	String representativeMenu;
	//byte[] representativeMenuImage;
	String representativeMenuImage;
	String userId;
}
