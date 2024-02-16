package com.app.controller.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;
import org.mybatis.spring.MyBatisSystemException;
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

import com.app.dto.mustEatPlace.MainMustEatPlace;
import com.app.dto.mustEatPlace.MainMustEatPlaceMenuInfo;
import com.app.dto.mustEatPlace.MainMustEatPlaceReview;
import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.RecipeSearchCondition;
import com.app.dto.product.Product;
import com.app.dto.product.ProductSearchCondition;
import com.app.dto.user.Visitor;
import com.app.service.admin.AdminService;
import com.app.service.mustEatPlace.MustEatPlaceService;
import com.app.service.postRecipe.PostRecipeService;
import com.app.service.product.ProductService;

@Controller
public class MainController {

	@Autowired
	MustEatPlaceService mustEatPlaceService;

	@Autowired
	AdminService adminService;

	@Autowired
	PostRecipeService postRecipeService;

	@Autowired
	ProductService productService;

	@GetMapping("/main")
	public String main(Model model, RecipeSearchCondition recipeSearchCondition, HttpServletRequest request,
			Visitor visitor, ProductSearchCondition productSearchCondition) {

		List<MainMustEatPlace> mainMustEatPlace = mustEatPlaceService.findMainMustEatPlaceList();

		List<Product> productList = productService.findProductListBySearchCondition(productSearchCondition);

		model.addAttribute("productList", productList);
		model.addAttribute("mainMustEatPlace", mainMustEatPlace);

//		테스트용(MJ)
		List<PostRecipe> recipeList = postRecipeService.findRecipeListBySearchCondition2(recipeSearchCondition);
		model.addAttribute("recipeList", recipeList);

//		방문자수 카운트
		String userId = request.getSession().getId();
		String pageUrl = "/";

		visitor.setUserId(userId);
		visitor.setPageUrl(pageUrl);

		adminService.saveVisitor(visitor);

		return "/main/main";
	}

	@GetMapping("/main/mustEatPlaceInfo")
	public String mustEatPlaceInfo(@RequestParam String id, Model model) {

		int intId = Integer.parseInt(id);

		MainMustEatPlace mainMustEatPlaceById = mustEatPlaceService.findMainMustEatPlaceById(intId);

		List<MainMustEatPlaceMenuInfo> mainMustEatPlaceMenuInfoById = mustEatPlaceService
				.mainFindMustEatPlaceMenuById(intId);

		List<MainMustEatPlaceReview> mainMustEatPlaceReviewById = mustEatPlaceService
				.mainFindMustEatPlaceReviewById(intId);

		model.addAttribute("mainMustEatPlaceById", mainMustEatPlaceById);

		model.addAttribute("mainMustEatPlaceMenuInfoById", mainMustEatPlaceMenuInfoById);

		model.addAttribute("mainMustEatPlaceReviewById", mainMustEatPlaceReviewById);

		model.addAttribute("id", intId);

		System.out.println(intId);

		return "/main/mustEatPlaceInfo";
	}

	@GetMapping("main/mustEatPlaceInfo/review")
	public String saveReview(Model model, HttpSession session, @RequestParam String id) {

		int intId = Integer.parseInt(id);

		String userId = (String) session.getAttribute("userId");

		List<MainMustEatPlaceReview> mainMustEatPlaceReviewById = mustEatPlaceService
				.mainFindMustEatPlaceReviewById(intId);

		model.addAttribute("mainMustEatPlaceReviewById", mainMustEatPlaceReviewById);
		model.addAttribute("userId", userId);
		model.addAttribute("id", intId);

		System.out.println(intId);
		System.out.println(userId);

		if (userId == null) {
			model.addAttribute("alertMessage", "로그인 이후에 사용 가능합니다.");
			model.addAttribute("url1", "/login");
			return "alert1";
		}

		return "/main/saveReview";
	}

	@PostMapping("main/mustEatPlaceInfo/review")
	public String saveReviewProcess(@ModelAttribute MainMustEatPlaceReview mainMustEatPlaceReview, Model model) {

		int result = mustEatPlaceService.saveReview(mainMustEatPlaceReview);

		model.addAttribute("id", mainMustEatPlaceReview.getId());

		System.out.println(mainMustEatPlaceReview.getId());

		if (result > 0) { // 저장이 성공
			return "redirect:/main/mustEatPlaceInfo"; // main 요청 경로
		} else { // 저장 실패
			return "/main"; // view 파일경로
		}
	}

	@GetMapping("/main/mustEatPlaceInfo/reviewUpload")
	public String fileUpload(@RequestParam String id, Model model) {

		int intId = Integer.parseInt(id);

		List<MainMustEatPlaceReview> mainMustEatPlaceReview = mustEatPlaceService.mainFindMustEatPlaceReviewById(intId);

		System.out.println(id);

		model.addAttribute("mainMustEatPlaceReview", mainMustEatPlaceReview);

		return "/main/imageUpdate";
	}

	@RequestMapping("/main/mustEatPlaceInfo/removeReview")
	public String removeReview(@RequestParam String review) {

		int result = mustEatPlaceService.removeReview(review);

		System.out.println(review);

		if (result > 0) {
			return "redirect:/main";
		} else {
			return "/home";
		}

	}

	@PostMapping("/main/mustEatPlaceInfo/reviewUpload")
	public String fileUploadProcess(@RequestParam("representativeMenuImage") MultipartFile file,
			@RequestParam("id") int id, RedirectAttributes redirectAttributes) {
		if (file.isEmpty()) {
			redirectAttributes.addFlashAttribute("message", "Please select a file to upload.");
			return "redirect:/uploadResult";
		}

		try {
			byte[] imageData = file.getBytes();
			MainMustEatPlaceReview mainMustEatPlaceReview = new MainMustEatPlaceReview();
			mainMustEatPlaceReview.setId(id);
			System.out.println(imageData);
			System.out.println("----------");
			String imageBase64 = null;
			try {
				imageBase64 = imageToBase64(imageData);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// mustEatPlace.setRepresentativeMenuImage(imageData);
			mainMustEatPlaceReview.setRepresentativeMenuImage(imageBase64);

			mustEatPlaceService.updateImage(mainMustEatPlaceReview);

			redirectAttributes.addFlashAttribute("message", "File upload successful!");
		} catch (IOException | MyBatisSystemException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("message", "File upload failed.");
		}

		return "redirect:/main/mustEatPlaceInfo";
	}

	public String imageToBase64(byte[] bt) throws Exception {
		String base64Img = "";

		try {
			base64Img = new String(Base64.encodeBase64(bt));
		} catch (Exception e) {
			throw e;
		} finally {
			try {
////	                if (fis != null) {
//	                    fis.close();
//	                }
			} catch (Exception e) {
			}
		}

		return base64Img;
	}

}
