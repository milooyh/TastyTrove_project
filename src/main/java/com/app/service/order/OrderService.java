package com.app.service.order;


import java.util.List;

import com.app.dto.order.Order;


public interface OrderService {
	
    // 다른 주문 관련 메서드를 필요에 따라 추가할 수 있습니다.
	 void createOrder(Order order);
	 
	 
}