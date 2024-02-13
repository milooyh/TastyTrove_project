package com.app.dao.cart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.app.dao.cart.CartDAO;
import com.app.dto.cart.CartItemDTO;

@Repository
public class CartDAOImpl implements CartDAO{
	// 예시로, 장바구니 데이터를 메모리에 저장하는 리스트를 사용합니다.
//    private List<CartItemDTO> cartItems = new ArrayList<>();
    
    
	 @Autowired
	    private JdbcTemplate jdbcTemplate;


	    @Override
	    public void addToCart(CartItemDTO cartItemDTO) {
	        String sql = "INSERT INTO cartitem (user_id, product_id, product_name, product_price, product_count) VALUES (?, ?, ?, ?, ?)";
	        jdbcTemplate.update(sql, cartItemDTO.getUserId(), cartItemDTO.getProductId(), cartItemDTO.getProductName(), cartItemDTO.getProductPrice(), cartItemDTO.getProductCount());
	    }
	    
	    @Override
	    public List<CartItemDTO> getCartItems(String userId) {
	        String sql = "SELECT * FROM cartitem WHERE user_id = ?";
	        List<CartItemDTO> cartItems = jdbcTemplate.query(sql, new Object[]{userId}, 
	                (rs, rowNum) -> {
	                    CartItemDTO cartItem = new CartItemDTO();
	                    cartItem.setUserId(rs.getString("user_id"));
	                    cartItem.setProductId(rs.getString("product_id"));
	                    cartItem.setProductName(rs.getString("product_name"));
	                    cartItem.setProductPrice(rs.getInt("product_price"));
	                    cartItem.setProductCount(rs.getInt("product_count"));
	                    return cartItem;
	                });
	        return cartItems;
	    
	    
	    }
	    
	    @Override
	    public void deleteCartItem(String userId, String productId) {
	        String sql = "DELETE FROM cartitem WHERE user_id = ? AND product_id = ?";
	        jdbcTemplate.update(sql, userId, productId);
	    }
}

