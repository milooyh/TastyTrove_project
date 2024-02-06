package com.app.dto.payment;

import lombok.Data;

@Data
public class Payment {
	int paymentId;
	int orderId;
	String paymentDate;
	String paymentMethod;
	String paymentAmount;
}
