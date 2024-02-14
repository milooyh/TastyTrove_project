package com.app.controller.admin;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.app.common.CommonCode;
import com.app.dto.delivery.Delivery;
import com.app.dto.delivery.DeliverySearchCondition;
import com.app.dto.mustEatPlace.MainMustEatPlace;
import com.app.dto.mustEatPlace.MainMustEatPlaceMenuInfo;
import com.app.dto.mustEatPlace.MustEatPlace;
import com.app.dto.mustEatPlace.MustEatPlaceMenu;
import com.app.dto.mustEatPlace.MustEatPlaceSearchCondition;
import com.app.dto.order.Order;
import com.app.dto.order.OrderItem;
import com.app.dto.order.OrderSearchCondition;
import com.app.dto.payment.Payment;
import com.app.dto.payment.PaymentSearchCondition;
import com.app.dto.postRecipe.PostRecipe;
import com.app.dto.postRecipe.PostRecipeSearchCondition;
import com.app.dto.product.Product;

import com.app.dto.product.ProductSearchCondition;

import com.app.dto.schedule.Schedule;

import com.app.dto.user.User;
import com.app.dto.user.UserSearchCondition;
import com.app.dto.user.Visitor;
import com.app.service.admin.AdminService;
import com.app.service.product.ProductService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	AdminService adminService;
	

	@Autowired
	ProductService productSerive;

//	로그아웃
	@GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/"; 
    }


//	관리자메인 ======================
	@GetMapping("")
	public String adminHome(Visitor visitor, Model model) {
		System.out.println("관리자메인 컨트롤러");

		// 방문자수 반영
		int visitCnt = adminService.getVisitorCount("/");
		int userCnt = adminService.getUserCount();
		int recipeCnt = adminService.getRecipeCount();
		int placeCnt = adminService.getPlaceCount();
		int productCnt = adminService.getProductCount();
		int totalAmount = adminService.getTotalAmount();

		model.addAttribute("visitCount", visitCnt);
		model.addAttribute("userCount", userCnt);
		model.addAttribute("recipeCount", recipeCnt);
		model.addAttribute("placeCount", placeCnt);
		model.addAttribute("productCount", productCnt);
		model.addAttribute("totalAmount", totalAmount);

		return "/admin/adminHome";
	}

	// 캘린더 일정 불러오기
	@GetMapping("/schedulelist")
	@ResponseBody
	public List<Schedule> getScheduleList() {
		return adminService.findSchedule();
	}

	// 캘린더 일정 추가
	@PostMapping("/addschedule")
	public String addSchedule(@ModelAttribute Schedule schedule) {

		adminService.saveSchedule(schedule);
		return "redirect:/admin";
	}

//	회원 도넛
	@GetMapping("/userTypeCount")
	@ResponseBody
	public Map<String, Integer> getCount() {
		Map<String, Integer> count = new HashMap<>();
		count.put("cusCount", adminService.getUserCountByUserType("CUS"));
		count.put("admCount", adminService.getUserCountByUserType("ADM"));
		System.out.println(count);
		return count;
	}

//	월매출
	@GetMapping("/monthlySales")
	@ResponseBody
	public List<Map<String, Object>> monthlySales() {
		List<Map<String, Object>> map = adminService.getTotalAmountByMonth();
		System.out.println("월매출 !!! : " + map);
		return map;
	}

//	회원 목록
	@GetMapping("/member")
	public String adminMemberList(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize) {
		System.out.println("adminController 회원 정보 부르기");

		int startRow = (page - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;

		Map<String, Integer> params = new HashMap<>();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		System.out.println(params);

		List<User> userList = adminService.findUserListByPage(params);
		model.addAttribute("userList", userList);

		int userCount = adminService.getUserCount();
		int totalPages = (int) Math.ceil((double) userCount / pageSize);

		System.out.println("User count: " + userCount);
		System.out.println("Total pages: " + totalPages);

		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", pageSize);

		return "/admin/adminMember/adminMember";
	}

//	ajax값 넘겨 주기 위한 컨트롤러
	@GetMapping("/member/details")
	@ResponseBody
	public User getUserDetails(@RequestParam String memberId) {
		System.out.println("ajax멤버아이디" + memberId);
		System.out.println("getUserDatil 호출됨 ㅜㅜㅜ");

		int intMemberId = Integer.parseInt(memberId);
		System.out.println("ajax멤버아이디" + intMemberId);
		User user = adminService.findUserByMemberId(intMemberId);
		System.out.println("ussssssssss=============" + user);
		return user;
	}

//	조건에 따른 회원 검색
	@GetMapping("/member/search")
	public String findMemberListProcess(Model model, UserSearchCondition userSearchCondition) {

		System.out.println("adminController 회원 검색 정보 부르기");

		System.out.println("선택한 월" + userSearchCondition.getBirthMonth());

//		10월보다 작으면 앞에 0 붙여주기 ..
		String birthMonthWithZero = null;

		if (userSearchCondition.getBirthMonth() != null && !userSearchCondition.getBirthMonth().isEmpty())
			try {
				int intBirthMonth = Integer.parseInt(userSearchCondition.getBirthMonth());
				if (intBirthMonth < 10) {
					birthMonthWithZero = "0" + userSearchCondition.getBirthMonth();
					System.out.println(birthMonthWithZero);
					userSearchCondition.setBirthMonth(birthMonthWithZero);
				}
			} catch (NumberFormatException e) {
				// TODO: handle exception
			}

//		10일보다 작으면 앞에 0 붙이기
		String birthDateWithZero = null;

		if (userSearchCondition.getBirthDate() != null && !userSearchCondition.getBirthDate().isEmpty())
			try {
				int intBirthDate = Integer.parseInt(userSearchCondition.getBirthDate());
				if (intBirthDate < 10) {
					birthDateWithZero = "0" + userSearchCondition.getBirthDate();
					System.out.println(birthDateWithZero);
					userSearchCondition.setBirthDate(birthDateWithZero);
				}
			} catch (NumberFormatException e) {
				// TODO: handle exception
			}

		List<User> userList = adminService.findUserListBySearchCondition(userSearchCondition);
		model.addAttribute("userList", userList);

		return "/admin/adminMember/findMember";
	}

//	관리자 추가
	@GetMapping("/member/add")
	public String saveMember() {
		return "/admin/adminMember/saveMember";
	}

	@PostMapping("/member/add")
	public String saveMemberProcess(@ModelAttribute User user, @RequestParam("userId") String userId,
			@RequestParam("userPassword") String userPassword, @RequestParam("userName") String userName,
			@RequestParam("userNickname") String userNickname, @RequestParam("userAddress") String userAddress,
			@RequestParam("userEmail") String userEmail, @RequestParam("birthYear") String birthYear,
			@RequestParam("birthMonth") String birthMonth, @RequestParam("birthDate") String birthDate,
			@RequestParam("tel1") String tel1, @RequestParam("tel2") String tel2, @RequestParam("tel3") String tel3,
			Model model) {

		System.out.println("adminController 관리자 추가");

		user.setUserId(userId);
		user.setUserPassword(userPassword);
		user.setUserName(userName);
		user.setUserNickname(userNickname);
		user.setUserAddress(userAddress);
		user.setUserEmail(userEmail);
		user.setUserType(CommonCode.USER_USERTYPE_ADMIN);

//		출생 연 + 월 + 일 하나로 합치기
		String userBirthdate = birthYear + "-" + (birthMonth.length() == 1 ? "0" + birthMonth : birthMonth) + "-"
				+ (birthDate.length() == 1 ? "0" + birthDate : birthDate);

//		 전화번호 하나로 합치기
		String userTel = (tel1.length() == 2 ? "0" + tel1 : tel1) + "-" + (tel2.length() == 3 ? "0" + tel2 : tel2) + "-"
				+ (tel3.length() == 3 ? "0" + tel3 : tel3);

		user.setUserBirthdate(userBirthdate);
		user.setUserTel(userTel);

		model.addAttribute("user", user);
		System.out.println(user);

		int result = adminService.saveMember(user);
		if (result > 0) {
			System.out.println("관리자 등록 성공");
			return "redirect:/admin/adminMember/member";
		} else {
			System.out.println("관리자 등록 실패");
			return "/admin/adminMember/saveMember";
		}

	}

//	회원 정보 수정
	@GetMapping("/member/update")
	public String modifyMember(@RequestParam String memberId, Model model, User user) {

		int intMemberId = Integer.parseInt(memberId); // db와 형태를 맞추기 위해 다시 int로 변환
		user = adminService.findUserByMemberId(intMemberId);
		model.addAttribute("user", user);

		return "/admin/adminMember/modifyMember";
	}

	@PostMapping("/member/update")
	public String modifyMemberProcess(User user) {

		System.out.println("adminController 회원 정보 수정");

		int result = adminService.modifyMember(user);
		if (result > 0) {
			return "redirect:/admin/member";
		} else {
			return "/admin/adminMember/member";
		}
	}

//	회원 삭제
	@GetMapping("/member/remove")
	public String removeMember(@RequestParam String memberId) {
		int intMemberId = Integer.parseInt(memberId);

		int result = adminService.removeMember(intMemberId);
		if (result > 0) {
			System.out.println("회원 삭제 성공");
			return "redirect:/admin/member";
		} else {
			System.out.println("회원 삭제 실패");
			return "admin/adminMember/member";
		}
	}

//	======================
//	레시피 도넛
	@GetMapping("/recipeTypeCount")
	@ResponseBody
	public Map<String, Integer> getRecipeCount() {
		Map<String, Integer> count = new HashMap<>();
		count.put("korCount", adminService.getRecipeCountByRecipeType("KOR"));
		count.put("chiCount", adminService.getRecipeCountByRecipeType("CHI"));
		count.put("jpnCount", adminService.getRecipeCountByRecipeType("JPN"));
		count.put("wtnCount", adminService.getRecipeCountByRecipeType("WTN"));
		count.put("drtCount", adminService.getRecipeCountByRecipeType("DRT"));
		count.put("etcCount", adminService.getRecipeCountByRecipeType("ETC"));
		System.out.println(count);
		return count;
	}

//	레시피 작성 회원 순위
	@GetMapping("/postRecipeUserCount")
	@ResponseBody
	public List<Map<String, Object>> postRecipeUserCount() {
		List<Map<String, Object>> map = adminService.getUserCountByRecipe();
		System.out.println("map ::::::::::: " + map);
		return map;
	}

//	레시피 목록
	@GetMapping("/recipeboard")
	public String findRecipeList(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize) {
		System.out.println("adminController 레시피 정보 부르기");

		int startRow = (page - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;

		Map<String, Integer> params = new HashMap<>();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		System.out.println(params);

		List<PostRecipe> postRecipeList = adminService.findRecipeListByPage(params);
		model.addAttribute("postRecipeList", postRecipeList);

		int recipeCount = adminService.getRecipeCount();
		int totalPages = (int) Math.ceil((double) recipeCount / pageSize);

		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", pageSize);

		return "/admin/adminPostRecipe/adminRecipeBoard";
	}

//	레시피 세부 내용 
	@GetMapping("/recipeboard/content")
	public String findRecipeContent(Model model, @RequestParam String recipeId, PostRecipe postRecipe) {
		int intRecipeId = Integer.parseInt(recipeId);

		postRecipe = adminService.findPostRecipeById(intRecipeId);

		model.addAttribute("postRecipe", postRecipe);

		return "/admin/adminPostRecipe/recipeContent";
	}

//	ajax값 넘겨 주기 위한 컨트롤러
	@GetMapping("/recipeboard/details")
	@ResponseBody
	public PostRecipe getRecipeDetails(@RequestParam String recipeId) {
		System.out.println("레시피 getUserDatil 호출됨 ㅜㅜㅜ");
		int intRecipeId = Integer.parseInt(recipeId);
		PostRecipe recipe = adminService.findPostRecipeById(intRecipeId);
		return recipe;
	}

//	레시피 카테고리 수정
	@GetMapping("/recipeboard/update")
	public String updateRecipeType(@RequestParam String recipeId, Model model, PostRecipe postRecipe) {
		System.out.println("recipeId : " + recipeId);

		int intRecipeId = Integer.parseInt(recipeId);
		postRecipe.setRecipeId(intRecipeId);

		postRecipe = adminService.findPostRecipeById(intRecipeId);

		model.addAttribute("postRecipe", postRecipe);

		return "/admin/adminPostRecipe";
	}

	@PostMapping("/recipeboard/update")
	public String updateRecipeTypeProcess(PostRecipe postRecipe) {

		System.out.println("adminController 레시피 카테고리 수정하기");
		int result = adminService.modifyRecipeType(postRecipe);

		if (result > 0) {
			System.out.println("레시피 카테고리 변경 성공");
			return "redirect:/admin/recipeboard";
		} else {
			System.out.println("레시피 카레토리 변경 실패");
			return "admin/adminPostRecipe/adminRecipeBoard";
		}
	}

//	레시피 조건 검색
	@GetMapping("/recipeboard/search")
	public String findPostRecipeListBySearchCondition(PostRecipeSearchCondition postRecipeSearchCondition,
			Model model) {
		List<PostRecipe> recipeList = adminService.findPostRecipeListBySearchCondition(postRecipeSearchCondition);
		model.addAttribute("recipeList", recipeList);

		return "admin/adminPostRecipe/findRecipeBoard";

	}

//	레시피 삭제
	@GetMapping("/recipe/remove")
	public String removePostRecipe(@RequestParam String recipeId) {
		System.out.println("adminController 레시피 삭제하기");

		int intRecipeId = Integer.parseInt(recipeId);

		int result = adminService.removePostRecipe(intRecipeId);

		if (result > 0) {
			System.out.println("레세피 삭제 성공");
			return "redirect:/admin/recipeboard"; // 이상해
		} else {
			System.out.println("회원 삭제 실패");
			return "admin/adminPostRecipe/adminRecipeBoard";
		}
	}

//	상품 ==============================================================
//	상품 목록
	@GetMapping("/product")
	public String findProductList(Model model,ProductSearchCondition productSearchCondition) {
		//List<Product> productList = adminService.findProductList();
		//model.addAttribute("productList", productList);
		List<Product> productList = productSerive.findProductListBySearchCondition(productSearchCondition);
		model.addAttribute("productList", productList);
		return "admin/adminProduct/adminProduct";
	}
	

	@RequestMapping("/product/content")
	public String productReview(@RequestParam String productId, Model model, Product product) {
		int intProductId = Integer.parseInt(productId);
		product = adminService.findProductByProductId(intProductId);

		model.addAttribute("product", product);

		return "admin/adminProduct/productContent";
	}

//	상품 추가
	@GetMapping("/product/add")
	public String addProduct() {
		return "/admin/adminProduct/saveProduct";
	}

//	@PostMapping("/product/add") // 이미지 업로드 하는 거 땜에 추후할 예정 ...
//	public String addProductProcess(Product product ) {
//		
//		return "redirect:/admin/product";
//	}

//	상품 검색
	@GetMapping("/product/search")
	public String searchProduct() {
		return "/admin/adminProduct/findProduct";
	}

//	맛집 ===========================
//	맛집 모록
	@GetMapping("/musteatplace")
	public String findMustEatPlaceList(Model model) {
		List<MainMustEatPlace> placeList = adminService.findMustEatPlaceList();
		model.addAttribute("placeList", placeList);

		return "/admin/adminMustEatPlace/adminMustEatPlace";
	}

//	ajax값 넘겨 주기 위한 컨트롤러
	@GetMapping("/musteatplace/details")
	@ResponseBody
	public MainMustEatPlace getMustDetails(@RequestParam String placeId) {
		System.out.println(placeId);
		System.out.println("맛집 getUserDatil 호출됨 ㅜㅜㅜ");
		
	    int intPlaceId = Integer.parseInt(placeId);
	    System.out.println(intPlaceId);
	    
	    MainMustEatPlace mustEatPlace = adminService.findMustEatPlaceByPlaceId(intPlaceId);
	    System.out.println(mustEatPlace);
	    
	    return mustEatPlace;
	}


//	맛집별 리뷰
	@RequestMapping("/musteatplace/content")
	public String mustEatPlaceReview(@RequestParam String placeId, Model model, MainMustEatPlace mustEatPlace) {
		int intPlaceId = Integer.parseInt(placeId);
		mustEatPlace = adminService.findMustEatPlaceByPlaceId(intPlaceId);

		model.addAttribute("place", mustEatPlace);

		return "/admin/adminMustEatPlace/mustEatPlaceContent";
	}

//	맛집 추가
	@GetMapping("/musteatplace/add")
	public String saveMustEatPlace() {
		return "/admin/adminMustEatPlace/saveMustEatPlace";
	}

	@PostMapping("/musteatplace/add")
	public String saveMustEatPlaceProcess(MainMustEatPlace mustEatPlace, HttpSession session) {

		int result = adminService.saveMustEatPlace(mustEatPlace);
		System.out.println("adminController result : " + result);

		if (result > 0) {
			System.out.println("맛집 저장 성공");
			return "redirect:/admin/musteatplace"; // 경로에 nullpoint예외가 .. ?
		} else {
			return "/admin/adminMustEatPlace/saveMustEatPlace";
		}
	}

//	맛집 검색
	@GetMapping("/musteatplace/search")
	public String findMustEatPlaceBySearchCondition(MustEatPlaceSearchCondition mustEatPlaceSearchCondition,
			Model model) {
		System.out.println("adminController findMustEatPlaceListBySearchCondition 불림");

		List<MainMustEatPlace> placeList = adminService.findMustEatPlaceListBySearchCondition(mustEatPlaceSearchCondition);
		model.addAttribute("placeList", placeList);

		return "/admin/adminMustEatPlace/findMustEatPlace";
	}

//	맛집 수정
	@GetMapping("/musteatplace/update")
	public String modifyMustEatPlace(@RequestParam String id, Model model, MainMustEatPlace mustEatPlace) {
		int intid = Integer.parseInt(id);
		mustEatPlace = adminService.findMustEatPlaceByPlaceId(intid);
		model.addAttribute("mustEatPlace", mustEatPlace);

		return "/admin/adminMustEatPlace/modifyMustEatPlace";
	}

	@PostMapping("/musteatplace/update")
	public String modifyMustEatPlaceProcess(MainMustEatPlace mustEatPlace) {
		int result = adminService.modifyMustEatPlace(mustEatPlace);
		if (result > 0) {
			System.out.println("맛집 수정 성공");
			return "redirect:/admin/musteatplace";
		} else {
			System.out.println("맛집 수정 실패");
			return "/admin/musteatplace/modify";
		}
	}
	
	@GetMapping("/musteatplace/reomoveMenu")
	public String modifyMenu(@RequestParam String id, Model model) {
		
		int intId = Integer.parseInt(id);
		
		List<MainMustEatPlaceMenuInfo> mustEatPlaceMenu = adminService.findMustEatPlaceMenuById(intId);
		
		model.addAttribute("mustEatPlaceMenu", mustEatPlaceMenu);
		
		return "admin/adminMustEatPlace/removeMenu";
		
	}
	
	@RequestMapping("/musteatplace/reomoveMenuName")
	public String removeMenuProcess(@RequestParam String menuName) {
		int result = adminService.removeMenuByName(menuName);
		
		System.out.println(menuName);
		
		if(result > 0 ) {
			return "redirect:/admin/musteatplace";
		} else {
			return "/home";
		}
	}
	
	@GetMapping("/musteatplace/registerMenu")
	public String saveMenu(@RequestParam("id") int id, Model model) {
		
		model.addAttribute("id", id);
		model.addAttribute("MustEatPlaceMenu", new MainMustEatPlaceMenuInfo());
		
		return "admin/adminMustEatPlace/registerMenu";
	}
	
	@PostMapping("/musteatplace/registerMenu")
	public String saveMenuProcess(@RequestParam("id") int id, @ModelAttribute MustEatPlaceMenu mustEatPlaceMenu, Model model) {
		
		int result = adminService.saveMenuInfo(id, mustEatPlaceMenu.getMenuName(), mustEatPlaceMenu.getPrice());
		
		if(result > 0) { //저장이 성공
			return "redirect:/admin/musteatplace";  //main 요청 경로
		} else { //저장 실패
			return "/home"; //view 파일경로
		}
	}

//	맛집 삭제
	@GetMapping("/musteatplace/remove")
	public String removeMustEatPlace(@RequestParam String id) {
		int intid = Integer.parseInt(id);
		int result = adminService.removeMustEatPlace(intid);
		if (result > 0) {
			System.out.println("맛집 삭제 성공");
			return "redirect:/admin/musteatplace";
		} else {
			System.out.println("맛집 삭제 실패");
			return "/admin/musteatplace";
		}
	}
	
	@GetMapping("/musteatplace/upload")
	public String fileUpload(@RequestParam int id, Model model) {
		
		//int intId = Integer.parseInt(id);
		
		MainMustEatPlace mustEatPlace = adminService.findMustEatPlaceByPlaceId(id);
		
		System.out.println(id);
		
		model.addAttribute("mustEatPlace", mustEatPlace);
		
		return "/admin/adminMustEatPlace/imageUpload";
	}
	
	@PostMapping("/musteatplace/upload")
	    public String fileUploadProcess(@RequestParam("representativeMenuImage") MultipartFile file,
	                                    @RequestParam("id") int id,
	                                    RedirectAttributes redirectAttributes) {
			/*
	        if (file.isEmpty()) {
	            redirectAttributes.addFlashAttribute("message", "Please select a file to upload.");
	            return "redirect:/uploadResult";
	        }
	        */

	        try {
	            byte[] imageData = file.getBytes();
	            MainMustEatPlace mustEatPlace = new MainMustEatPlace();
	            mustEatPlace.setId(id);
	            System.out.println(imageData);
	            System.out.println("----------");
	            String imageBase64 = null;
	            try {
	            	imageBase64 = imageToBase64(imageData);
				} catch (Exception e) {
					e.printStackTrace();
				}
	            //mustEatPlace.setRepresentativeMenuImage(imageData);
	            mustEatPlace.setRepresentativeMenuImage(imageBase64);

	            adminService.updateImageData(mustEatPlace);

	            redirectAttributes.addFlashAttribute("message", "File upload successful!");
	        } catch (IOException | MyBatisSystemException e) {
	            e.printStackTrace();
	            redirectAttributes.addFlashAttribute("message", "File upload failed.");
	        }

	        return "redirect:/admin/musteatplace/add";
	    }

	public String imageToBase64(byte[] bt) throws Exception{
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

//	주문 ======================
//	주문 목록 조회
	@GetMapping("/order")
	public String findOrderList(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize) {
		int startRow = (page - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;

		Map<String, Integer> params = new HashMap<>();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		System.out.println(params);

		List<Order> orderList = adminService.findOrderListByPage(params);
		model.addAttribute("orderList", orderList);

		int orderCount = adminService.getOrderCount();
		int totalPages = (int) Math.ceil((double) orderCount / pageSize);

		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", pageSize);

		return "/admin/adminOrder/adminOrder";
	}

	@GetMapping("/order/orderitem")
	public String findOrderListByMemberId(@RequestParam String memberId, Model model, OrderItem orderItem) {
		int intMemberId = Integer.parseInt(memberId);
		orderItem.setMemberId(intMemberId);

		List<OrderItem> orderItemList = adminService.findOrderItemListByMemberId(intMemberId);
		System.out.println("controller : + " + orderItemList);

		model.addAttribute("orderItemList", orderItemList);

		return "/admin/adminOrder/orderItems";

	}

	@GetMapping("/order/orders")
	public String findOrderListByOrderId(@RequestParam String orderId, Model model, OrderItem orderItem) {
		System.out.println("adminController 전체주문번호 누르면 나오는 페이지 ㅜㅜ");
		int intOrderId = Integer.parseInt(orderId);
		orderItem.setOrderId(intOrderId);

		List<OrderItem> orderItemList = adminService.findOrderItemListByOrderId(intOrderId);
		model.addAttribute("orderItemList", orderItemList);

		return "/admin/adminOrder/order";
	}

//	주문 목록 검색
	@GetMapping("/order/search")
	public String findOrderBySearchCondition(@RequestParam(value = "minPrice", required = false) Integer minPrice,
			@RequestParam(value = "maxPrice", required = false) Integer maxPrice,
			OrderSearchCondition orderSearchCondition, Model model) {
		orderSearchCondition.setMinPrice(minPrice);
		orderSearchCondition.setMaxPrice(maxPrice);

		List<Order> orderList = adminService.findOrderListBySearchCondition(orderSearchCondition);
		model.addAttribute("orderList", orderList);

		return "/admin/adminOrder/findOrder";
	}

//	개별 주문 정보 수정
	@GetMapping("/order/orderitem/update")
	public String modifyOrderItem(@RequestParam String orderItemId, Model model, OrderItem orderItem) {
		System.out.println("adminController modifyOrderItem  불림");
		System.out.println("~~~~~~~~~~~~~ orderItemId" + orderItemId);
		int intOrderItemId = Integer.parseInt(orderItemId);
		orderItem.setOrderItemId(intOrderItemId);
		orderItem = adminService.findOrderItemByOrderItemId(intOrderItemId);

		model.addAttribute("orderItem", orderItem);
		System.out.println("orderItem : " + orderItem);

		return "/admin/adminOrder/modifyOrderItem";
	}

	@PostMapping("/order/orderitem/update")
	public String modifyOrderItemProcess(@RequestParam String orderItemCount, @RequestParam String orderItemId,
			@RequestParam String orderId, OrderItem orderItem) {
		System.out.println("adminController modifyOrderItemProc 불림");

		System.out
				.println("orderItemId : " + orderItemId + "orderItemCount : " + orderItemCount + "orderId :" + orderId);

		int intOrderItemCount = Integer.parseInt(orderItemCount);
		int intOrderItemId = Integer.parseInt(orderItemId);
		int intOrderId = Integer.parseInt(orderId);

		orderItem.setOrderItemId(intOrderItemId);
		orderItem.setOrderItemCount(intOrderItemCount);
		orderItem.setOrderId(intOrderId);

		System.out.println("!!!!!!!!!!!!!!" + orderItem);

		int result1 = adminService.modifyOrderItem(orderItem);
		int result2 = adminService.modifyTotalPrice(intOrderId);
		int result3 = adminService.modifyPaymentAmount(intOrderId);

		System.out.println(result3);

		if (result1 > 0 && result2 > 0 && result3 > 0) {
			System.out.println("개별 주문 수정 성공");
			return "redirect:/admin/order";
		} else {
			System.out.println("개별 주문 수정 실패");
			return "/admin/order/orderitem/update";
		}
	}

	
	
	
//	주문 상태 수정
	@GetMapping("/order/update")
	public String modifyOrderStatus(@RequestParam String orderId, Model model, Order order) {
		System.out.println("admin controller modifyOrderStauts 불림");
		int intOrderId = Integer.parseInt(orderId);
		order.setOrderId(intOrderId);
		order = adminService.findOrderByOrderId(intOrderId);

		model.addAttribute("order", order);
		System.out.println("model : " + model);
		return "/admin/adminOrder";
	}

	@PostMapping("/order/update")
	public String modifyOrderStatusProcess(Order order) {
		System.out.println("admin controller modifyOrderStatusProcess 불림");
		System.out.println(order);
		int result = adminService.modifyOrderStatus(order);
		System.out.println("result : " + result);
		if (result > 0) {
			System.out.println("주문상태 수정 성공");
			return "redirect:/admin/order";
		} else {
			System.out.println("주문상태 수정 실패");
			return "/admin/adminOrder/adminOrder";
		}
	}

//	결제=============================
	@GetMapping("/payment")
	public String findPaymentList(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize) {

		int startRow = (page - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;

		Map<String, Integer> params = new HashMap<>();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		System.out.println(params);

		List<Payment> paymentList = adminService.findPaymentListByPage(params);
		model.addAttribute("paymentList", paymentList);

		int paymentCount = adminService.getPaymentCount();
		int totalPages = (int) Math.ceil((double) paymentCount / pageSize);

		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", pageSize);

		return "/admin/adminPayment/adminPayment";
	}

	@GetMapping("/payment/search")
	public String findPaymentListBySearchCondition(@RequestParam(value = "minPrice", required = false) Integer minPrice,
			@RequestParam(value = "maxPrice", required = false) Integer maxPrice,
			PaymentSearchCondition paymentSearchCondition, Model model) {
		
		paymentSearchCondition.setMinPrice(minPrice);
		paymentSearchCondition.setMaxPrice(maxPrice);
		
		List<Payment> paymentList = adminService.findPaymentListBySearchCondition(paymentSearchCondition);
		model.addAttribute("paymentList", paymentList);

		return "/admin/adminPayment/findPayment";
	}

	@GetMapping("/payment/update")
	public String modifyPayment(@RequestParam String paymentId, Payment payment, Model model) {
		int intPaymentId = Integer.parseInt(paymentId);
		payment.setPaymentId(intPaymentId);

		payment = adminService.findPaymentByPaymentId(intPaymentId);
		model.addAttribute("payment", payment);
		return "/admin/adminPayment/modifyPayment";
	}

	@PostMapping("/payment/update")
	public String modifyPaymentProc(Payment payment) {
		System.out.println("adminController modifyPaymentMethod 불림");
		int result = adminService.modifyPaymentMethod(payment);
		if (result > 0) {
			System.out.println("결제 방법 변경 셩공");
			return "redirect:/admin/payment";
		} else {
			System.out.println("결제 방법 변경 실패");
			return "/admin/adminPayment/adminPayment";
		}
	}

//	배송 ==============
	@GetMapping("/delivery")
	public String findDeliveryList(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int pageSize) {

		int startRow = (page - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;

		Map<String, Integer> params = new HashMap<>();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		System.out.println(params);

		List<Delivery> deliveryList = adminService.findDeliveryListByPage(params);
		model.addAttribute("deliveryList", deliveryList);

		int deliveryCount = adminService.getDeliveryCount();
		int totalPages = (int) Math.ceil((double) deliveryCount / pageSize);

		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", pageSize);

		return "/admin/adminDelivery/adminDelivery";

	}

	@GetMapping("/delivery/search")
	public String findDeliveryListBySearchCondition(DeliverySearchCondition deliverySearhCondition, Model model) {
		List<Delivery> deliveryList = adminService.findDeliveryListBySearchCondition(deliverySearhCondition);
		model.addAttribute("deliveryList", deliveryList);
		return "/admin/adminDelivery/findDelivery";
	}

//	배송 상태 변경
	@GetMapping("/delivery/update")
	public String modifyDeliveryStatus(@RequestParam String deliveryId, Model model, Delivery delivery) {
		System.out.println("adminController modifyDeliveryStatus 불림");

		int intDeliveryId = Integer.parseInt(deliveryId);
		delivery.setDeliveryId(intDeliveryId);

		delivery = adminService.findDeliveryByDeliveryId(intDeliveryId);
		model.addAttribute("delivery", delivery);

		return "/admin/adminDelivery/adminDelivery";
	}

	@PostMapping("/delivery/update")
	public String modifyDeliveryStatusProc(Delivery delivery) {
		System.out.println("admin Controller modifyDeliveryStatus 불림");

		int result = adminService.modifyDeliveryStatus(delivery);
		if (result > 0) {
			System.out.println("배송 상태 변경 셩공");
			return "redirect:/admin/delivery";
		} else {
			System.out.println("배송 상ㄴ태 변경 실패");
			return "/admin/adminDelivery/adminDelivery";
		}
	}

}
