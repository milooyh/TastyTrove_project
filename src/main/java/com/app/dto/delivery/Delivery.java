package com.app.dto.delivery;

import lombok.Data;

@Data
public class Delivery {
	int deliveryId;
	int orderId;
	String deliveryDate;
	String deliveryStatus;
	String deliveryAddress;
	int deliveryFee;
}
