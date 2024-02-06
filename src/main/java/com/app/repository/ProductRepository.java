package com.app.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.app.dto.product.Product;
@Repository
public class ProductRepository{

	private final JdbcTemplate jdbcTemplate;

    @Autowired
    public ProductRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void addProduct(Product product) {
        String sql = "INSERT INTO product (product_name, product_content, product_price, product_count, upload_file, view_type) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
            product.getProductName(),
            product.getProductContent(),
            product.getProductPrice(),
            product.getProductCount(),
            product.getUploadFile(),
            product.getViewType()
        );
    }
    
}