package com.app.dto.order;

import lombok.Data;

@Data
public class OrderItem {
	int orderItemId;
	int orderId;
	int memberId;
	int productId;
	int orderItemCount;
	double productPrice;
	double totalPrice;
}
