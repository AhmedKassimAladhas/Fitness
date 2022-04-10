package com.aladhas.fitness.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
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

import com.aladhas.fitness.model.Body_measurements;
import com.aladhas.fitness.model.Customers;
import com.aladhas.fitness.model.Users;
import com.aladhas.fitness.services.Body_measurementsServices;
import com.aladhas.fitness.services.CustomersServices;

@Controller
@SessionAttributes("name")
@RequestMapping("/Fitness")
public class CustomersController {

	@Autowired
	private CustomersServices custServices;
	
	@Autowired
	private Body_measurementsServices bodyServices;
	
	@GetMapping("/Customers")
	public ModelAndView Customer(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		java.util.Date utilDate = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String stringDate = dateFormat.format(utilDate);
		Date date = Date.valueOf(stringDate);
		mv.addObject("date", date);
		Customers cust = new Customers();
		mv.addObject("cust", cust);
		List<Customers> allCust = custServices.getAllCust();
		mv.addObject("allCust", allCust);
		Body_measurements bud = new Body_measurements();
		mv.addObject("bud", bud);
		Users name = null;
		name =  (Users) session.getAttribute("name");	
		System.out.println("...." + name);
		if(name == null ) {
			mv.setViewName("login");
		}else {
			mv.setViewName("Customers");
		}
		return mv;
	}
	
	@PostMapping("/Customers")
	public String addNewCustm(@ModelAttribute("cust") Customers cust) {
		cust.setLast_sub("بدون اشتراك");
		custServices.addCust(cust);
		return "redirect:/Fitness/Customers";
	}
	
	@PutMapping("/Customers")
	public String updateCustm(@ModelAttribute("cust") Customers cust) {
		custServices.addCust(cust);
		return "redirect:/Fitness/Customers";
	}
	
	@DeleteMapping("/FollowUp")
	public String deletecustm(@RequestParam("cid") Long id) {
		custServices.deletCust(id);
		return "redirect:/Fitness/FollowUp";
	}
	
	@PostMapping("/Body")
	public String addNewBody(@RequestParam("Today_date") Date Today_date,@RequestParam("Age") int Age,@RequestParam("Hight") Double Hight,@RequestParam("Weight") Double Weight,@RequestParam("Fats") Double Fats,@RequestParam("Muscles") Double Muscles,@RequestParam("Calories") Double Calories, @RequestParam("c") Long c) {
		Body_measurements bud = new Body_measurements();
		bud.setToday_date(Today_date);
		bud.setAge(Age);
		bud.setHight(Hight);
		bud.setWeight(Weight);
		bud.setFats(Fats);
		bud.setMuscles(Muscles);
		bud.setCalories(Calories);
		Customers cu = custServices.getCust(c);
		bud.setC(cu);
		bodyServices.addBody_M(bud);
		return "redirect:/Fitness/Customers";
	}
}
