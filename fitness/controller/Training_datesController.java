package com.aladhas.fitness.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.aladhas.fitness.model.Dates;
import com.aladhas.fitness.model.Users;
import com.aladhas.fitness.services.DatesServices;

@Controller
@SessionAttributes("name")
@RequestMapping("/Fitness")
public class Training_datesController {

	@Autowired
	private DatesServices dateServices;
	
	@GetMapping("/Dates")
	public ModelAndView Training_dates(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Dates date = new Dates();
		mv.addObject("date", date);
		List<Dates> allDate = dateServices.getAllDate();
		mv.addObject("allDate", allDate);
		Users name = null;
		name =  (Users) session.getAttribute("name");	
		System.out.println("...." + name);
		if(name == null ) {
			mv.setViewName("login");
		}else {
			mv.setViewName("Training_dates");
		}
		return mv;
	}
	
	@PostMapping("/Dates")
	public String addNewDate(@ModelAttribute("date") Dates date) {
		dateServices.addDate(date);
		return "redirect:/Fitness/Dates";
	}
	
	@PutMapping("/Dates")
	public String updateDate(@ModelAttribute("date") Dates date) {
		dateServices.addDate(date);
		return "redirect:/Fitness/Dates";
	}
	
	@DeleteMapping("/Dates")
	public String deleteDate(@RequestParam("id") Long id) {
		dateServices.deleteDate(id);
		
		return "redirect:/Fitness/Dates";
	}
}
