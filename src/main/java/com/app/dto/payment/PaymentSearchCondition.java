package com.app.dto.payment;

import lombok.Data;

@Data
public class PaymentSearchCondition {
	String paymentId;
	String orderId;
	String paymentDate;
	String paymentMethod;
	String paymentAmount;
	
	String searchKeyword;
	Integer minPrice; // 추가된 필드
	Integer maxPrice; // 추가된 필드
}
