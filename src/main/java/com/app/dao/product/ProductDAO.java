package com.app.dao.product;

import java.util.List;

import com.app.dto.product.Product;
import com.app.dto.product.ProductSearchCondition;

public interface ProductDAO {
	
	
	public int saveProduct(Product product);
	
	public Product findProductByProductId(int productId);
	
	public List<Product> findProductList();
	
	public List<Product> findProductListBySearchCondition(ProductSearchCondition productSearchCondition);
	
	public int modifyProduct(Product product);
	
	public int removeProductById(int productId);
    
    
}
