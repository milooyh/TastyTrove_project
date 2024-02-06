package com.app.dto.product;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {
	private int productId;
    private String productName;
    private String productContent;
    private String productPrice;
    private String productCount;
    private String uploadFile; // 파일 업로드를 위한 필드 타입 변경
    //private MultipartFile uploadFile;
    private String viewType; // 뷰 타입
    private String searchKeyword;
    
   
    
}
