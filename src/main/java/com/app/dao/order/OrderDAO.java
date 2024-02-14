package com.app.dao.order;



import java.util.List;

import com.app.dto.order.Order;
import com.app.dto.order.OrderItem;


public interface OrderDAO {

	 void saveOrder(Order order);
	 void saveOrderItem(OrderItem orderItem);
	
}