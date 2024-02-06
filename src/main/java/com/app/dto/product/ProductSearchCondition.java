package com.app.dto.product;


import org.springframework.web.multipart.MultipartFile;



import lombok.Data;

@Data
public class ProductSearchCondition {

	
	private int productId;
    private String productName;
    private String productContent;
    private String productPrice;
    private String productCount;
    private  String uploadFile;
    //private MultipartFile uploadFile;
    private String viewType; //뷰타입
    
    private String searchKeyword;
}
