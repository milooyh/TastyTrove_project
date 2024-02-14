package com.app.controller.product;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.dto.product.Product;
import com.app.dto.product.ProductSearchCondition;
import com.app.service.User.UserService;
import com.app.service.product.ProductService;



@Controller
public class ProductController {
		
	@Autowired
	UserService userService;
    
	@Autowired
	ProductService productService;
	
	@GetMapping("/productwrite")
	public String productwrite() {
	    return "product/productWrite";
	}
	
	
	
	// 클래스의 멤버 변수로 웹 경로 접두사를 정의합니다.
	private final String UPLOAD_DIR = "C:\\tmp\\resources\\"; // 실제 파일이 저장되는 서버의 경로
	private final String WEB_ACCESS_PATH = "http://localhost:8080/resources/"; // 웹에서 파일에 접근할 때 사용되는 URL 경로

	@PostMapping("/productwrite")
	public String productwriteProcess(@RequestParam("uploadFile") MultipartFile file, 
	                                  @RequestParam("productName") String productName,
	                                  @RequestParam("productContent") String productContent,
	                                  @RequestParam("productPrice") String productPrice,
	                                  @RequestParam("productCount") String productCount,
	                                  @RequestParam("viewType") String viewType,
	                                  RedirectAttributes redirectAttributes) {
		
		// 상품 가격에서 쉼표 제거
        productPrice = productPrice.replace(",", "");
        
        // 쉼표가 제거된 상품 가격을 숫자로 변환
        // 예외 처리가 필요할 수 있음
        double price = Double.parseDouble(productPrice);

        // 상품 개수도 정수로 변환
        int count = Integer.parseInt(productCount);
		
		
	    Product product = new Product();
	    product.setProductName(productName);
	    product.setProductContent(productContent);
	    product.setProductPrice(productPrice);
	    product.setProductCount(productCount);
	    product.setViewType(viewType);

	    if (!file.isEmpty()) {
	        try {
	            String originalFilename = file.getOriginalFilename();
	            // 파일 시스템에 저장되는 실제 경로
	            String filePath = Paths.get(UPLOAD_DIR, originalFilename).toString();
	            // 파일을 실제 경로에 저장
	            File dest = new File(filePath);
	            dest.getParentFile().mkdirs();
	            file.transferTo(dest);
	            // 웹 URL로 접근할 수 있는 경로로 변환하여 데이터베이스에 저장
	            String webPath = WEB_ACCESS_PATH + originalFilename;
	            product.setUploadFile(webPath); 
	        } catch (IOException e) {
	            e.printStackTrace();
	            redirectAttributes.addFlashAttribute("errorMessage", "파일 업로드 실패");
	            return "redirect:/productwrite";
	        }
	    }

	    int result = productService.saveProduct(product);
	    if (result > 0) {
	        return "redirect:/product";
	    } else {
	        redirectAttributes.addFlashAttribute("errorMessage", "상품 저장 실패");
	        return "redirect:/productwrite";
	    }
	}
	
	
	/**/
	
	@GetMapping("/product")
	public String product(Model model, ProductSearchCondition productSearchCondition) {
		
		System.out.println(productSearchCondition);
		System.out.println("product컨트롤러 productSearch");
		//객실정보를 DB에서 읽어와서 화면에 전달
		
		List<Product> productList = productService.findProductListBySearchCondition(productSearchCondition);
		model.addAttribute("productList", productList);
		return "product/product";
	}
	
	@PostMapping("/saveProduct")
    public String saveProduct(@ModelAttribute Product product) {
        productService.saveProduct(product);
        return "redirect:/product"; // 성공 페이지로 리다이렉션
    }
	
	@GetMapping("/modifyProduct")
	public String modifyProduct(@RequestParam String productId, Model model) {
	    int intProductId = Integer.parseInt(productId);
	    
	    Product product = productService.findProductByProductId(intProductId);
	    
	    System.out.println(product);
	    
	    model.addAttribute("product", product);
	    
	    return "product/modifyProduct";
	}
	
	
	@PostMapping("/modifyProduct")
	public String modifyProductProcess(
	    @RequestParam("productId") int productId,
	    @RequestParam("productName") String productName,
	    @RequestParam("productContent") String productContent,
	    @RequestParam("productPrice") String productPrice,
	    //@RequestParam("productPrice") String productPrice,
	    @RequestParam("productCount") String productCount,
	    @RequestParam("viewType") String viewType,
	    @RequestParam(value = "uploadFile", required = false) MultipartFile file,
	    RedirectAttributes redirectAttributes) {

	    Product product = productService.findProductByProductId(productId);
	    
	    
	    // 파일이 제공되었는지 확인하고, 제공된 경우 파일 처리 로직을 실행합니다.
	    if (file != null && !file.isEmpty()) {
	        try {
	            String originalFilename = file.getOriginalFilename();
	            String filePath = Paths.get(UPLOAD_DIR, originalFilename).toString();

	            File dest = new File(filePath);
	            dest.getParentFile().mkdirs();
	            file.transferTo(dest);

	            String webPath = WEB_ACCESS_PATH + originalFilename;
	            product.setUploadFile(webPath);
	        } catch (IOException e) {
	            e.printStackTrace();
	            redirectAttributes.addFlashAttribute("errorMessage", "파일 업로드 실패");
	            return "redirect:/modifyProduct?productId=" + productId; // 실패 시, 수정 페이지로 리다이렉트
	            
	        }
	    }

	    product.setProductName(productName);
	    product.setProductContent(productContent);
	    product.setProductPrice(productPrice);
	    product.setProductCount(productCount);
	    product.setViewType(viewType);

	    int result = productService.modifyProduct(product);

	    if (result > 0) {
	        redirectAttributes.addFlashAttribute("successMessage", "제품이 성공적으로 수정되었습니다.");
	        return "redirect:/product"; // 성공 시, 제품 목록 페이지로 리다이렉트
	    } else {
	        redirectAttributes.addFlashAttribute("errorMessage", "제품 수정 실패");
	        return "redirect:/modifyProduct?productId=" + productId; // 실패 시, 수정 페이지로 리다이렉트
	        
	    }
	}


	
	
	@RequestMapping("/removeProduct")
	public String removeProductProcess(@RequestParam String productId) {
	    int intProductId = Integer.parseInt(productId);
	    int result = productService.removeProductById(intProductId);

	    if (result > 0) {
	        return "redirect:/product";
	    } else {
	        return "/products";
	    }
	}

	
	
	
	
	
}
