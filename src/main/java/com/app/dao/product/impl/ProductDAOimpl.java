package com.app.dao.product.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.dao.product.ProductDAO;
import com.app.dto.product.Product;
import com.app.dto.product.ProductSearchCondition;

@Repository
public class ProductDAOimpl implements ProductDAO{

	  @Autowired
	    private SqlSessionTemplate sqlSessionTemplate;

	    @Override
	    public int saveProduct(Product product) {
	       int result =  sqlSessionTemplate.insert("product_mapper.saveProduct",product);
	        // DB에 저장하는 과정
	       return result;
	    }

	    public List<Product> findProductList(){
			
			List<Product> productList = sqlSessionTemplate.selectList("product_mapper.findProductList");
			
			return productList;
		}

		@Override
		public List<Product> findProductListBySearchCondition(ProductSearchCondition productSearchCondition) {
			// TODO Auto-generated method stub
			
			List<Product> productList = sqlSessionTemplate.selectList("product_mapper.findProductListBySearchCondition", productSearchCondition);
			
			return productList;
		}

		@Override
		public Product findProductByProductId(int productId) {
			// TODO Auto-generated method stub
			
			Product product = sqlSessionTemplate.selectOne("product_mapper.findProductByProductId", productId);
			
			return product;
		}

		@Override
		public int modifyProduct(Product product) {
			// TODO Auto-generated method stub
			
			int result = sqlSessionTemplate.update("product_mapper.modifyProduct", product);
			
			return result;
		}

		@Override
		public int removeProductById(int productId) {
			// TODO Auto-generated method stub
			int result = sqlSessionTemplate.delete("product_mapper.removeProduct", productId);
			
			return result;
		}
    // 다른 메서드들을 필요에 따라 추가
    
}
