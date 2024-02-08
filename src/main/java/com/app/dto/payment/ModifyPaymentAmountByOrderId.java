package com.app.dto.payment;

import lombok.Data;

@Data
public class ModifyPaymentAmountByOrderId {
	String totalPrice;
	String deliveryFee;
	String ordreId;
	String paymentAmount;
}
