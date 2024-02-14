package com.app.dto.order;

import java.sql.Date;

import lombok.Data;

@Data
public class Order {

	private int orderId;
	private String userId;
	private Date orderDate;
	private String orderStatus;
	double totalPrice;
}
