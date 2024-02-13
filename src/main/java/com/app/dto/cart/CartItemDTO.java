package com.app.dto.cart;

import lombok.Data;

@Data
public class CartItemDTO {

	private String userId;
    private String productId;
    private String productName;
    private int productPrice;
    private int productCount;
}
