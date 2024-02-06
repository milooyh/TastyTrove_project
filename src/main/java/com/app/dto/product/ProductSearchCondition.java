package com.app.dto.product;

import lombok.Data;

@Data
public class ProductSearchCondition {
	String productId;
	String productName;
	String productContent;
	String productPrice;
	String productCount;
	String productImage;
	String productType;

	String searchKeyword;
}
