package com.david.savetravels.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.david.savetravels.models.Travel;
import com.david.savetravels.services.TravelService;

import jakarta.validation.Valid;

@Controller
public class APIController {
	
	@Autowired
	private TravelService travelService;
	
//	good
	
	@GetMapping("/travels")
	public String travelHome(Model model) {
		List<Travel> travelList = travelService.allTravels();
		model.addAttribute("travelList", travelList);
		
		Travel newTravel = new Travel();
		model.addAttribute("newTravel", newTravel);
		
		return "expenses.jsp";
			
	}
	 
	
//  good
	
	@PostMapping("/travels")
	public String addTravel(@Valid @ModelAttribute("newTravel")Travel newTravel,BindingResult result, Model model) {
		if(result.hasErrors()) {
			List<Travel>travelList = travelService.allTravels();
			model.addAttribute("travelList", travelList);
			return "expenses.jsp";
			
		} else {
			
			travelService.createTravel(newTravel);
			return "redirect:/travels";
		 
		}
		
	}
	
	// good
	
		@GetMapping("/travels/{id}")
		public String detailsTravel(@PathVariable("id")Long id, Model model) {
			Travel oneTravel = travelService.findTravel(id);
			model.addAttribute("oneTravel", oneTravel);
			
			return "detail.jsp";
		}
		
		
	// good
		
		@GetMapping("/tavels/new")
		public String renderCreateForm(Model model) {
			Travel newTravel = new Travel();
			model.addAttribute("newTravel", newTravel);
			return "/expenses.jsp";
		}
		
		
		
		
		
		
//		Edit
		
		@GetMapping("/travels/edit/{id}")
		public String renderEditForm(
				@PathVariable("id")Long id,
				Model model) {
			Travel oneTravel = travelService.findTravel(id);
			model.addAttribute("oneTravel", oneTravel);
			return "edit.jsp";
		}
		
		@PutMapping("/travels/edit/{id}")
		public String processEditForm(
				@PathVariable("id")Long id,
				@Valid @ModelAttribute("oneTravel") Travel oneTravel,BindingResult result
				) {
			if(result.hasErrors()) {
				return"edit.jsp";
			}else {
				travelService.updateTravel(oneTravel);
				return"redirect:/travels";
			}
		}
		
		

		
//      Delete 
		
		@DeleteMapping("/travels/{id}")
		public String deleteTravel(@PathVariable("id")Long id) {
			travelService.removeTravel(id);
			return "redirect:/travels";
		}

}
