package com.app.service.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.product.ProductDAO;
import com.app.dto.product.Product;
import com.app.dto.product.ProductSearchCondition;

import com.app.repository.ProductRepository;
import com.app.service.product.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;



   
    
	@Override
	public int saveProduct(Product product) {
		// TODO Auto-generated method stub
		
		//이미 해당 호실이나 정보가 있나? -> 저장실패
		//저장 가능 -> dao 저장해라~
		int result = productDAO.saveProduct(product);
		
		
		return result;

	}
	public List<Product> findProductList(){
		
		List<Product> productList = productDAO.findProductList();
		
		return productList;
	}

	@Override
	public List<Product> findProductListBySearchCondition(ProductSearchCondition productSearchCondition) {
		// TODO Auto-generated method stub
		
		List<Product> productList = productDAO.findProductListBySearchCondition(productSearchCondition);
		
		return productList;
	}

	@Override
	public Product findProductByProductId(int productId) {
		// TODO Auto-generated method stub
		Product product = productDAO.findProductByProductId(productId);
		
		
		return product;
	}

	@Override
	public int modifyProduct(Product product) {
		// TODO Auto-generated method stub
		int result = productDAO.modifyProduct(product);
		
		return result;
	}

	@Override
	public int removeProductById(int productId) {
		// TODO Auto-generated method stub
		int result = productDAO.removeProductById(productId);
		
		return result;
	}
	
	
}