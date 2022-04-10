package com.aladhas.fitness.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.aladhas.fitness.model.Accounts;
import com.aladhas.fitness.model.Users;
import com.aladhas.fitness.services.AccountsServices;
import com.aladhas.fitness.services.ExpensesServices;
import com.aladhas.fitness.services.New_SubscriptionsServices;
import com.aladhas.fitness.services.SellServices;
import com.aladhas.fitness.services.TodayServices;

@Controller
@SessionAttributes("name")
@RequestMapping("/Fitness")
public class Account_todayController {

	@Autowired
	private AccountsServices accServices;
	@Autowired
	private SellServices sellServices;
	@Autowired
	private New_SubscriptionsServices subServices;
	@Autowired
	private TodayServices todayServices;
	@Autowired
	private ExpensesServices expServices;
	
	@GetMapping("/EndToday")
	public ModelAndView Account_today(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		java.util.Date utilDate = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String stringDate = dateFormat.format(utilDate);
		Date date = Date.valueOf(stringDate);
		mv.addObject("date", date);
		Accounts acc = new Accounts();
		mv.addObject("acc", acc);
		List<Accounts> allAcc =accServices.getAllAccToday(date);
		if(allAcc.isEmpty()) {
			mv.addObject("tableAcc", "hidden");
			mv.addObject("buttonAcc", "visible");
		}else {
			mv.addObject("tableAcc", "visible");
			mv.addObject("buttonAcc", "hidden");
		}
		mv.addObject("allAcc", allAcc);
		Double sell = sellServices.getSellPriceToday(date);
		if(sell == null) {
			sell = 0.0;
		}
		Double sub = subServices.getSubPriceToday(date);
		if(sub == null) {
			sub = 0.0;
		}
		Double today = todayServices.getPriceToday(date);
		if(today == null) {
			today = 0.0;
		}
		Double exp = expServices.getExpPriceToday(date);
		if(exp == null) {
			exp = 0.0;
		}
		Double tot = sell + sub + today - exp;
		System.out.println("tot :" + tot);
		mv.addObject("sell", sell);
		mv.addObject("sub", sub);
		mv.addObject("today", today);
		mv.addObject("exp", exp);
		mv.addObject("tot", tot);
		Users name = null;
		name =  (Users) session.getAttribute("name");	
		System.out.println("...." + name);
		if(name == null ) {
			mv.setViewName("login");
		}else {
			mv.setViewName("account_today");
		}
		return mv;
	}
	
	@PostMapping("/EndToday")
	public String endAcc(@ModelAttribute("acc") Accounts acc) {
		accServices.addAcc(acc);
		return "redirect:/Fitness/EndToday";
	}
}
