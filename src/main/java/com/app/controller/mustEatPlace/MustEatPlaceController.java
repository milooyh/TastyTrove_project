package com.app.controller.mustEatPlace;

import java.io.IOException;
import java.util.List;

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

import com.app.dto.mustEatPlace.MustEatPlace;
import com.app.dto.mustEatPlace.MustEatPlaceMenu;
import com.app.dto.mustEatPlace.MustEatPlaceWithMenu;
import com.app.service.mustEatPlace.MustEatPlaceService;

@Controller
@RequestMapping("/must")
public class MustEatPlaceController {
	
	@Autowired
	MustEatPlaceService mustEatPlaceService;

	@GetMapping("/register")
	public String must(Model model, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		
		if(userId == null) {
			model.addAttribute("alertMessage", "로그인 이후에 사용 가능합니다.");
			model.addAttribute("url", "/login");
			return "alert";
		}
		
		System.out.println(userId);
		
		List<MustEatPlace> mustEatPlaces = mustEatPlaceService.findMustEatPlaceList(userId);
		List<MustEatPlaceWithMenu> mustEatPlaceWithMenu = mustEatPlaceService.findMustEatPlaceWithMenu();
		
        model.addAttribute("mustEatPlaces", mustEatPlaces);
        model.addAttribute("mustEatPlaceWithMenu", mustEatPlaceWithMenu);
		
		return "/mustEatPlace/must";
	}
	
	@PostMapping("/register")
	public String addMustEatPlaceProcess(@ModelAttribute MustEatPlace mustEatPlace, Model model) {
			
		int result = mustEatPlaceService.saveMustEatPlace(mustEatPlace);
			
		model.addAttribute("userId", mustEatPlace.getUserId());
			
		if(result > 0) { //저장이 성공
			return "redirect:/must/register";  //main 요청 경로
		} else { //저장 실패
			return "/home"; //view 파일경로
		}
	}
	
	
	@GetMapping("/modifyMenu")
	public String modifyMenu(@RequestParam String id, Model model) {
		
		int intId = Integer.parseInt(id);
		
		List<MustEatPlaceMenu> mustEatPlaceMenu = mustEatPlaceService.findMustEatPlaceMenuById(intId);
		
		model.addAttribute("mustEatPlaceMenu", mustEatPlaceMenu);
		
		return "mustEatPlace/menuList";
		
	}
	
	@RequestMapping("/removeMenu")
	public String removeMenuProcess(@RequestParam String menuName) {
		int result = mustEatPlaceService.removeMenuByName(menuName);
		
		System.out.println(menuName);
		
		if(result > 0 ) {
			return "redirect:/must/register";
		} else {
			return "/home";
		}
	}
	
	@RequestMapping("/remove")
	public String removeMustEatPlaceProcess(@RequestParam String id) {
		
		int intId = Integer.parseInt(id);
		
		int result = mustEatPlaceService.removeMustEatPlaceById(intId);
		
		System.out.println(intId);
		
		if(result > 0 ) {
			return "redirect:/must/register";
		} else {
			return "/home";
		}
	}
	
	@GetMapping("/modify")
	public String modifyRoom(@RequestParam String id, Model model) {
		
		int intid = Integer.parseInt(id);
		
		MustEatPlace mustEatPlace = mustEatPlaceService.findMustEatPlaceById(intid);
		List<MustEatPlaceMenu> mustEatPlaceMenu = mustEatPlaceService.findMustEatPlaceMenuById(intid);
		
		System.out.println(mustEatPlace);
		System.out.println();
		System.out.println(mustEatPlaceMenu);
		
		model.addAttribute("mustEatPlace", mustEatPlace);
		model.addAttribute("mustEatPlaceMenu", mustEatPlaceMenu);
		
		return "mustEatPlace/modifyMust";
	}
	
	@PostMapping("/modify")
	public String modifyRoomProcess(MustEatPlace mustEatPlace) {
		
		System.out.println(mustEatPlace);
		
		int result = mustEatPlaceService.modifyMustEatPlace(mustEatPlace);
		
		if( result > 0 ) {
			return "redirect:/must/register";
		} else {
			return "mustEatPlace/modifyMust";	
		}
	}
	
	@GetMapping("/registerMenu")
	public String saveMenu(@RequestParam("id") int id, Model model) {
		
		model.addAttribute("id", id);
		model.addAttribute("MustEatPlaceMenu", new MustEatPlaceMenu());
		
		return "mustEatPlace/saveMenu";
	}
	
	@PostMapping("/registerMenu")
	public String saveMenuProcess(@RequestParam("id") int id, @ModelAttribute MustEatPlaceMenu mustEatPlaceMenu, Model model) {
		
		int result = mustEatPlaceService.saveMenuInfo(id, mustEatPlaceMenu.getMenuName(), mustEatPlaceMenu.getPrice());
		
		if(result > 0) { //저장이 성공
			return "redirect:/must/register";  //main 요청 경로
		} else { //저장 실패
			return "/home"; //view 파일경로
		}
	}
	
	@GetMapping("/removeImage")
	public String removeImage(@RequestParam String id, Model model) {
		
		int intId = Integer.parseInt(id);
		
		MustEatPlace mustEatPlace = mustEatPlaceService.findMustEatPlaceById(intId);
		
		model.addAttribute("mustEatPlace", mustEatPlace);
		
		return "/mustEatPlace/removeImage";
	}
	
	@GetMapping("/upload")
	public String fileUpload(@RequestParam int id, Model model) {
		
		MustEatPlace mustEatPlace = mustEatPlaceService.findMustEatPlaceById(id);
		
		System.out.println(id);
		
		model.addAttribute("mustEatPlace", mustEatPlace);
		
		return "/mustEatPlace/imageUpload";
	}
	
	@PostMapping("/upload")
	    public String fileUploadProcess(@RequestParam("representativeMenuImage") MultipartFile file,
	                                    @RequestParam("id") int id,
	                                    RedirectAttributes redirectAttributes) {

	        try {
	            byte[] imageData = file.getBytes();
	            MustEatPlace mustEatPlace = new MustEatPlace();
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

	            mustEatPlaceService.updateImageData(mustEatPlace);

	            redirectAttributes.addFlashAttribute("message", "File upload successful!");
	        } catch (IOException | MyBatisSystemException e) {
	            e.printStackTrace();
	            redirectAttributes.addFlashAttribute("message", "File upload failed.");
	        }

	        return "redirect:/must/register";
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
}
