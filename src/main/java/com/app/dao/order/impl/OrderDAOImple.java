package com.app.dao.order.impl;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.app.dao.order.OrderDAO;
import com.app.dto.order.Order;
import com.app.dto.order.OrderItem;


@Repository
public class OrderDAOImple implements OrderDAO{
	 @Autowired
	    private JdbcTemplate jdbcTemplate;
	 
	
	    
/*
	    @Override
	    public void saveOrder(Order order) {
	        String sql = "INSERT INTO orders (order_id, user_id, order_date, order_status, total_price) VALUES ((select nvl(max(order_id), 0)+1 from orders), ?, sysdate, ?, ?)";
	        jdbcTemplate.update(sql, order.getOrderId(), order.getUserId(), order.getOrderDate(), order.getOrderStatus(), order.getTotalPrice());
	    }
	    */
	 
	 @Override
	    public void saveOrder(Order order) {
	        // 주문 정보를 삽입하는 SQL 쿼리. order_id는 데이터베이스에서 자동으로 계산합니다.
		 String sql = "INSERT INTO orders (order_id, user_id, order_date, order_status, total_price) " +
	             "VALUES ((SELECT NVL(MAX(order_id), 0) + 1 FROM orders), ?, sysdate, ?, ?)";
		 jdbcTemplate.update(sql, order.getUserId(), order.getOrderStatus(), order.getTotalPrice());
	    }
	 
	 @Override
	    public void saveOrderItem(OrderItem orderItem) {
	        String sql = "INSERT INTO order_items (order_id, member_id, product_id, order_item_count, product_price, total_price) " +
	                     "VALUES (?, ?, ?, ?, ?, ?)";
	        jdbcTemplate.update(sql, orderItem.getOrderId(), orderItem.getMemberId(),
	                            orderItem.getProductId(), orderItem.getOrderItemCount(),
	                            orderItem.getProductPrice(), orderItem.getTotalPrice());
	    }
	 
	
	
	 
}
