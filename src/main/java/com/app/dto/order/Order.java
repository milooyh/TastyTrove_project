package com.app.dto.order;

import lombok.Data;

@Data
public class Order {

	int orderId;
	int memberId;
	String orderDate;
	String orderStatus;
	double totalPrice;
}
