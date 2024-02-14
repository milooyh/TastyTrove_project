package com.app.dao.cart;

import java.util.List;

import com.app.dto.cart.CartItemDTO;

public interface CartDAO {
    void addToCart(CartItemDTO cartItemDTO);
    
 // 장바구니 항목 조회 메서드 추가
    List<CartItemDTO> getCartItems(String userId);
    
    public void deleteCartItem(String userId, String productId);
}
