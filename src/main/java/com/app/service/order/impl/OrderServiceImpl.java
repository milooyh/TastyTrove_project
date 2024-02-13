package com.app.service.order.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.order.OrderDAO;
import com.app.dto.order.Order;
import com.app.service.order.OrderService;
@Service
public class OrderServiceImpl  implements OrderService{
	
	
	@Autowired
    private OrderDAO orderDAO;
	
	@Override
    public void createOrder(Order order) {
        orderDAO.saveOrder(order);
    }
	 @Autowired
	    public OrderServiceImpl(OrderDAO orderDAO) {
	        this.orderDAO = orderDAO;
	    }

	  
}
