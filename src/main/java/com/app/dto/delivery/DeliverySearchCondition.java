package com.app.dto.delivery;

import lombok.Data;

@Data
public class DeliverySearchCondition {
	String deliveryId;
	String orderId;
	String deliveryDate;
	String deliveryStatus;
	String deliveryAddress;
	String addressSystem;
	String deliveryFee;
	
	String searchKeyword;
}
