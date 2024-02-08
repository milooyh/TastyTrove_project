package com.app.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dto.product.Product;
import com.app.dto.product.ProductSearchCondition;


public interface ProductService {

	
	  // 다른 메서드들을 필요에 따라 추가
	
		//room 등록
		public int saveProduct(Product product);
		//room 목록
		//room 상태 변경
		
		public Product findProductByProductId(int productId);
		
		public List<Product> findProductList();
		
		public List<Product> findProductListBySearchCondition(ProductSearchCondition productSearchCondition);
		
		public int modifyProduct(Product product);
		
		public int removeProductById(int productId);

}