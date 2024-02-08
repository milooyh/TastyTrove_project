package com.app.controller.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.app.dto.mustEatPlace.MainMustEatPlace;
import com.app.service.mustEatPlace.MustEatPlaceService;

@Controller
public class MainController {
	
	@Autowired
	MustEatPlaceService mustEatPlaceService;

	@GetMapping("/main")
	public String main(Model model) {
		
		List<MainMustEatPlace> mainMustEatPlace = mustEatPlaceService.findMainMustEatPlaceList();
		
		model.addAttribute("mainMustEatPlace", mainMustEatPlace);
		
		return "/main/main";
	}
	
	@GetMapping("/main/mustEatPlaceInfo")
	public String mustEatPlaceInfo(@RequestParam String id, Model model) {
		
		int intId = Integer.parseInt(id);
		
		MainMustEatPlace mainMustEatPlaceById = mustEatPlaceService.findMainMustEatPlaceById(intId);
		
		model.addAttribute("mainMustEatPlaceById", mainMustEatPlaceById);
		
		return "/main/mustEatPlaceInfo";
	}
}
