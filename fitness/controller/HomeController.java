package com.aladhas.fitness.controller;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.aladhas.fitness.model.New_Subscriptions;
import com.aladhas.fitness.model.Users;
import com.aladhas.fitness.services.CustomersServices;
import com.aladhas.fitness.services.New_SubscriptionsServices;
import com.aladhas.fitness.services.OffersServices;
import com.aladhas.fitness.services.TodayServices;
import com.aladhas.fitness.services.UsersServices;

@Controller
@SessionAttributes("name")
@RequestMapping("/Fitness")
public class HomeController {

	@Autowired
	private OffersServices offServices;
	@Autowired
	private New_SubscriptionsServices newServices;
	@Autowired
	private CustomersServices custServices;
	@Autowired
	private UsersServices userServices;
	@Autowired
	private TodayServices todaySservices;
	
	@GetMapping("/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("login");
//		mv.addObject("error", "تست");
		return mv;
	}
	
	/////////////////////////////////////////////////////
	java.util.Date utilDate = new java.util.Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String stringDate = dateFormat.format(utilDate);
	Date date = Date.valueOf(stringDate);
	/////////////////////////////////////////////////////
	
	@PostMapping("/Index")
	public ModelAndView loginAction(@RequestParam("Username") String username, @RequestParam("Password") String password) {
		
		ModelAndView mv = new ModelAndView();
		Users user = userServices.getUsernameAndPass(username, password);
		if(user == null) {
			mv.setViewName("login");
			mv.addObject("error", "خطأ");
			
		}else {
			
			mv.addObject("name", user);
			mv.setViewName("Index");
			offServices.endOffer();
			newServices.endSubscrip();
			custServices.endCustSubscrip();
			
			int allCustNum = custServices.getNumAll();
			mv.addObject("allCustNum", allCustNum);
			System.out.println(allCustNum);
			int custNumSub = custServices.getNumAllSub("متاح");
			mv.addObject("custNumSub", custNumSub);
			System.out.println(custNumSub);
			int custNumNotSub = custServices.getNumAllSub("بدون اشتراك");
			mv.addObject("custNumNotSub", custNumNotSub);
			System.out.println(custNumNotSub);
			List<New_Subscriptions> subEndToday = newServices.getAllExpiryToday(date);
			mv.addObject("subEndToday", subEndToday);
			
			int numAllSubToday = newServices.getNumAllExpiryToday(date);
			mv.addObject("numAllSubToday", numAllSubToday);
			System.out.println(numAllSubToday);
			int numAllTriningToday = todaySservices.getAllTrining(date);
			mv.addObject("numAllTriningToday", numAllTriningToday);
			System.out.println(numAllTriningToday);
			int numCustSubToday = todaySservices.getCustTrining(date, "متاح");
			mv.addObject("numCustSubToday", numCustSubToday);
			System.out.println(numCustSubToday);
			int numCustNotSubToday = todaySservices.getCustTrining(date, "بدون اشتراك");
			mv.addObject("numCustNotSubToday", numCustNotSubToday);
			System.out.println(numCustNotSubToday);
		}
		
		return mv;
	}
	/*
	@GetMapping("/")
	public ModelAndView goHome() {
		ModelAndView mv = new ModelAndView("Index");
		offServices.endOffer();
		newServices.endSubscrip();
		custServices.endCustSubscrip();
		return mv;
	}
	*/
	@GetMapping("/Index")
	public ModelAndView Home(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		offServices.endOffer();
		newServices.endSubscrip();
		custServices.endCustSubscrip();
		Users name = null;
		name =  (Users) session.getAttribute("name");	
		System.out.println("...." + name);
		if(name == null ) {
			mv.setViewName("login");
		}else {
			mv.setViewName("Index");
			
			int allCustNum = custServices.getNumAll();
			mv.addObject("allCustNum", allCustNum);
			System.out.println(allCustNum);
			int custNumSub = custServices.getNumAllSub("متاح");
			mv.addObject("custNumSub", custNumSub);
			System.out.println(custNumSub);
			int custNumNotSub = custServices.getNumAllSub("بدون اشتراك");
			mv.addObject("custNumNotSub", custNumNotSub);
			System.out.println(custNumNotSub);
			List<New_Subscriptions> subEndToday = newServices.getAllExpiryToday(date);
//			if(subEndToday.isEmpty()) {
				mv.addObject("subEndToday", subEndToday);
//			}else {
//				mv.addObject("subEndToday", "لا يوجد");
//			}
			int numAllSubToday = newServices.getNumAllExpiryToday(date);
			mv.addObject("numAllSubToday", numAllSubToday);
			System.out.println(numAllSubToday);
			int numAllTriningToday = todaySservices.getAllTrining(date);
			mv.addObject("numAllTriningToday", numAllTriningToday);
			System.out.println(numAllTriningToday);
			int numCustSubToday = todaySservices.getCustTrining(date, "متاح");
			mv.addObject("numCustSubToday", numCustSubToday);
			System.out.println(numCustSubToday);
			int numCustNotSubToday = todaySservices.getCustTrining(date, "بدون اشتراك");
			mv.addObject("numCustNotSubToday", numCustNotSubToday);
			System.out.println(numCustNotSubToday);
		}
		return mv;
	}
	
}
