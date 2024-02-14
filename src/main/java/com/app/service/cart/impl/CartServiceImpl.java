package com.app.service.cart.impl;

import java.util.List;

import javax.swing.tree.RowMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.dao.cart.CartDAO;
import com.app.dto.cart.CartItemDTO;
import com.app.service.cart.CartService;

@Service
public class CartServiceImpl implements CartService {
	  @Autowired
	    private CartDAO cartDAO;
	
	    @Override
	    public void addToCart(String userId, String productId, String productName, int productPrice, int productCount) {
	        CartItemDTO cartItemDTO = new CartItemDTO();
	        cartItemDTO.setUserId(userId);
	        cartItemDTO.setProductId(productId);
	        cartItemDTO.setProductName(productName);
	        cartItemDTO.setProductPrice(productPrice);
	        cartItemDTO.setProductCount(productCount);

	        cartDAO.addToCart(cartItemDTO);
	    }
	    
	 // 장바구니 항목 조회 메서드 구현
	    @Override
	    public List<CartItemDTO> getCartItems(String userId) {
	        return cartDAO.getCartItems(userId);
	    }
	    
	    @Override
	    public void deleteCartItem(String userId, String productId) {
	        // 사용자 ID와 상품 ID를 이용해 장바구니 아이템 삭제 로직
	        // 예: cartRepository.deleteByUserIdAndProductId(userId, productId);
	    	  cartDAO.deleteCartItem(userId, productId);
	    }
	    
	    
}
