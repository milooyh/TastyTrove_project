package com.app.service.cart;

import java.util.List;

import com.app.dto.cart.CartItemDTO;

public interface CartService {
	void addToCart(String userId, String productId, String productName, int productPrice, int productCount);

	  
    // 장바구니 항목 조회 메서드 추가
    List<CartItemDTO> getCartItems(String userId);
    //장바구니 항목 삭제 메서드 추가
    void deleteCartItem(String userId, String productId);
    

}
