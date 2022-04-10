package com.aladhas.fitness.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.aladhas.fitness.model.Body_measurements;
import com.aladhas.fitness.model.Customers;
import com.aladhas.fitness.model.Sections;
import com.aladhas.fitness.model.Today_trainings;
import com.aladhas.fitness.model.Users;
import com.aladhas.fitness.services.Body_measurementsServices;
import com.aladhas.fitness.services.CustomersServices;
import com.aladhas.fitness.services.New_SubscriptionsServices;
import com.aladhas.fitness.services.SectionsServices;
import com.aladhas.fitness.services.TodayServices;
import com.aladhas.fitness.model.New_Subscriptions;
@Controller
@SessionAttributes("name")
@RequestMapping("/Fitness")
public class New_SubscriptionsController {

	@Autowired
	private New_SubscriptionsServices newServices;
	@Autowired
	private CustomersServices custServices;
	@Autowired
	private SectionsServices secServices;
	@Autowired
	private Body_measurementsServices bodyServices;
	@Autowired
	private TodayServices todayServices;
	
	@GetMapping("/NewSubscriptions")
	public ModelAndView New_Subscriptions(HttpSession session) {
		ModelAndView mv = new ModelAndView();		
		New_Subscriptions subscrip = new New_Subscriptions();
		mv.addObject("subscrip", subscrip);
		List<New_Subscriptions> allSub = newServices.getAllStilSub("متاح");
		mv.addObject("allSub", allSub);
		List<Customers> allcust = custServices.getAllCustExpiry("بدون اشتراك");
		mv.addObject("allcust", allcust);
		List<Sections> allSec = secServices.getAllSec();
		mv.addObject("allSec", allSec);
		Users name = null;
		name =  (Users) session.getAttribute("name");		
		System.out.println("...." + name);
		if(name == null ) {
			mv.setViewName("login");
		}else {
			mv.setViewName("New_Subscriptions");
		}
		return mv;
	}
	
	@PostMapping("/NewSubscriptions")
	public String addNewSubscriptions(@RequestParam("cust") Long cust,@RequestParam("price") Double price,@RequestParam("date_start") Date date_start
			,@RequestParam("date_end") Date date_end,@RequestParam("count") int count,@RequestParam("sec") Long sec) {
		
		Customers cus = custServices.getCust(cust);
		Sections se = secServices.getSec(sec);
		String expiry = "متاح";
		int countDone = 0;
		
		New_Subscriptions sub = new New_Subscriptions(cus, se, date_start, date_end, count,countDone, price, expiry);
		sub.getCust().setLast_sub(expiry);
		sub.getCust().setSub_end(date_end);
		sub.getCust().setTrainingCount("بداية");
			if(sub.getCust().getSubscrip_Number() == 0) {
				sub.getCust().setSubscrip_Number(1);
			}
		sub.getCust().setNumberLast_sub(sub.getId());
		newServices.addNew_Subscrip(sub);
		sub.getCust().setNumberLast_sub(sub.getId());
		newServices.addNew_Subscrip(sub);
		return "redirect:/Fitness/NewSubscriptions";
	}
	
	@DeleteMapping("/NewSubscriptions")
	public String deleteSubscriptions(@RequestParam("sid") Long id) {
		newServices.deleteSub(id);
		
		return "redirect:/Fitness/FollowUp";
	}
	
	@GetMapping("/RenewSubscriptions")
	public ModelAndView ReNew_Subscriptions() {
		ModelAndView mv = new ModelAndView("Renew_Subscriptions");		
		New_Subscriptions subscrip = new New_Subscriptions();
		mv.addObject("subscrip", subscrip);
		List<New_Subscriptions> allSub = newServices.getAllSub();
		mv.addObject("allSub", allSub);
		List<Customers> allcust = custServices.getAllCustExpiry("منتهي");
		mv.addObject("allcust", allcust);
		List<Sections> allSec = secServices.getAllSec();
		mv.addObject("allSec", allSec);

		return mv;
	}
	
	@PostMapping("/RenewSubscriptions")
	public String ReNewSubscriptions(@RequestParam("cust") Long cust,@RequestParam("price") Double price,@RequestParam("date_start") Date date_start
			,@RequestParam("date_end") Date date_end,@RequestParam("count") int count,@RequestParam("sec") Long sec) {
		
		Customers cus = custServices.getCust(cust);
		Sections se = secServices.getSec(sec);
		String expiry = "متاح";
		int countDone = 0;
		
		New_Subscriptions sub = new New_Subscriptions(cus, se, date_start, date_end, count,countDone, price, expiry);
		sub.getCust().setLast_sub(expiry);
		sub.getCust().setSub_end(date_end);
		sub.getCust().setTrainingCount("بداية");
			if(sub.getCust().getSubscrip_Number() == 0) {
				sub.getCust().setSubscrip_Number(1);
			}
			else {
				int SubNum = sub.getCust().getSubscrip_Number() + 1; 
				sub.getCust().setSubscrip_Number(SubNum);
			}
		
		newServices.addNew_Subscrip(sub);
		sub.getCust().setNumberLast_sub(sub.getId());
		newServices.addNew_Subscrip(sub);
		System.out.println("id :"+sub.getId());
		return "redirect:/Fitness/RenewSubscriptions";
	}
	
	@GetMapping("/FollowUp")
	public ModelAndView Follow_Up() {
		ModelAndView mv = new ModelAndView("FollowUp");		
		New_Subscriptions subscrip = new New_Subscriptions();
		mv.addObject("subscrip", subscrip);
		List<New_Subscriptions> allSub = newServices.getAllSub();
		mv.addObject("allSub", allSub);
		List<Customers> allcust = custServices.getAllCust();
		mv.addObject("allcust", allcust);
		List<Sections> allSec = secServices.getAllSec();
		mv.addObject("allSec", allSec);
		List<Body_measurements> allbody = bodyServices.getAllBody();
		mv.addObject("allbody", allbody);
		List<Today_trainings> allCustToday = todayServices.getAllToday();
		mv.addObject("allCustToday", allCustToday);
		return mv;
	}
}
