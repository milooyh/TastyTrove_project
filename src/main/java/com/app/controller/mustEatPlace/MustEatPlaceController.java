package com.app.controller.mustEatPlace;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.dto.mustEatPlace.MustEatPlace;
import com.app.service.mustEatPlace.MustEatPlaceService;

@Controller
public class MustEatPlaceController {
	
	@Autowired
	MustEatPlaceService mustEatPlaceService;

	@GetMapping("/must")
	public String must(Model model) {
		
		List<MustEatPlace> mustEatPlaces = mustEatPlaceService.findMustEatPlaceList();
        model.addAttribute("mustEatPlaces", mustEatPlaces);
		
		return "/mustEatPlace/must";
	}
	
	@ResponseBody
	@PostMapping("/must")
	public String addRoomProcess(@ModelAttribute MustEatPlace mustEatPlace, @RequestBody String place) {
			
			int result = mustEatPlaceService.saveMustEatPlace(mustEatPlace);
			
			MustEatPlace mep = new MustEatPlace();
			
			mep.setPlace(place);
			
			if(result > 0) { //저장이 성공
				return "redirect:/must";  //main 요청 경로
			} else { //저장 실패
				return "/home"; //view 파일경로
			}
	}
}
