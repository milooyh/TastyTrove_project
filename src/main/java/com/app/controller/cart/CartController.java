package com.app.controller.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.cart.CartItemDTO;
import com.app.dto.product.Product;
import com.app.dto.product.ProductSearchCondition;
import com.app.service.cart.CartService;
import com.app.service.product.ProductService;


@Controller
public class CartController {

	@Autowired
    private CartService cartService; // 가정: CartService는 addToCart 로직을 처리하는 서비스

	@Autowired
    private ProductService productService; 
	
    @PostMapping("/addToCart")
    public String addToCart(@RequestParam("productId") String productId,
                            @RequestParam("productCount") int productCount,
                            HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        String productName = request.getParameter("productName"); // 상품 이름 가져오기
        int productPrice = Integer.parseInt(request.getParameter("productPrice")); // 상품 가격 가져오기

        cartService.addToCart(userId, productId, productName, productPrice, productCount);

        return "redirect:/product"; // 장바구니 페이지나 상품 목록 페이지로 리다이렉트
    }
    /*
    @GetMapping("/addCart")
    public String addCartList(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        List<CartItem> cartItems = cartService.getCartItems(userId); // 장바구니 데이터 조회
        model.addAttribute("cartItems", cartItems);
        return "product/addCart";
    }
    
  
    */
   
    
    @GetMapping("/addToCart")
    public String addToCart() {
    	return "/product/addCart";
    }

    @GetMapping("/cart")
    public String showCart(HttpServletRequest request, Model model, ProductSearchCondition productSearchCondition) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        
        if (userId != null) {
            List<CartItemDTO> cartItems = cartService.getCartItems(userId);
            model.addAttribute("cartItems", cartItems);
            List<Product> productList = productService.findProductListBySearchCondition(productSearchCondition);
    		model.addAttribute("productList", productList);
            return "product/addCart"; // 장바구니 페이지의 뷰 이름
        } else {
            // 사용자가 로그인하지 않았을 경우 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }
        
    }
    

    // 장바구니 아이템 삭제 처리
    @PostMapping("/deleteCartItem")
    @ResponseBody
    public ResponseEntity<?> deleteCartItem(@RequestParam("productId") String productId,
                                            HttpServletRequest request) {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        
        if (userId != null) {
            try {
                // 삭제 서비스 메서드 호출
                cartService.deleteCartItem(userId, productId);
                // 성공적으로 처리되면 HTTP 상태 코드 200 반환
                return ResponseEntity.ok().body("Item deleted successfully");
            } catch (Exception e) {
                // 예외 발생 시, 오류 응답 반환
                return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error deleting item");
            }
        } else {
            // 사용자가 로그인하지 않았을 경우
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body("User not logged in");
        }
    }

    
}
