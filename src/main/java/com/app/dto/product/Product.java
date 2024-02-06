package com.app.dto.product;

import lombok.Data;

@Data
public class Product {
	int productId;
	String productName;
	String productContent;
	double productPrice;
	int productCount;
	String productImage;
	String productType;

}
