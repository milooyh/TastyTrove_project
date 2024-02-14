package com.app.controller.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.app.dao.order.OrderDAO;
import com.app.dto.order.Order;
import com.app.service.order.OrderService;
import com.app.service.product.ProductService;

@Controller
public class OrderController {
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private ProductService productService;

    @Autowired
    private OrderService orderService;

    @PostMapping("/order")
    public String createOrder(@RequestBody Order order) {
    	
    	
    	
        orderService.createOrder(order);
        
        return "/product/order";
    }
    
    @GetMapping("/order")
    public String showOrders(Model model) {
        
        return "/product/order"; // JSP 페이지 이름
    }
   
  
    
 
    
}
