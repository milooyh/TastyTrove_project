package com.app.dto.order;

import lombok.Data;

@Data
public class OrderSearchCondition {

	String orderId;
	String memberId;
	String orderDate;
	String orderStatus;
	String totalPrice;
	
	String searchKeyword;
}
