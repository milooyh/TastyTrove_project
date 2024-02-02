package com.app.controller.mustEatPlace;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String must(Model model) {
		
		List<MustEatPlace> mustEatPlaces = mustEatPlaceService.findMustEatPlaceList();
		List<MustEatPlaceWithMenu> mustEatPlaceWithMenu = mustEatPlaceService.findMustEatPlaceWithMenu();
		
        model.addAttribute("mustEatPlaces", mustEatPlaces);
        model.addAttribute("mustEatPlaceWithMenu", mustEatPlaceWithMenu);
		
		return "/mustEatPlace/must";
	}
	
	@ResponseBody
	@PostMapping("/register")
	public String addMustEatPlaceProcess(@ModelAttribute MustEatPlace mustEatPlace, @RequestBody String place) {
			
			int result = mustEatPlaceService.saveMustEatPlace(mustEatPlace);
			
			MustEatPlace mep = new MustEatPlace();
			
			mep.setPlace(place);
			
			if(result > 0) { //저장이 성공
				return "redirect:/mustEatPlace/must";  //main 요청 경로
			} else { //저장 실패
				return "/home"; //view 파일경로
			}
	}
	
	@RequestMapping("/remove")
	public String removeMustEatPlaceProcess(@RequestParam String id) {
		
		int intId = Integer.parseInt(id);
		
		int result = mustEatPlaceService.removeMustEatPlaceById(intId);
		
		System.out.println(intId);
		
		if(result > 0 ) {
			return "redirect:/mustEatPlace/must";
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
}
