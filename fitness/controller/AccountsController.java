package com.aladhas.fitness.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.aladhas.fitness.model.Accounts;
import com.aladhas.fitness.model.Expenses;
import com.aladhas.fitness.model.New_Subscriptions;
import com.aladhas.fitness.model.Sell;
import com.aladhas.fitness.model.Today_trainings;
import com.aladhas.fitness.model.Users;
import com.aladhas.fitness.services.AccountsServices;
import com.aladhas.fitness.services.ExpensesServices;
import com.aladhas.fitness.services.New_SubscriptionsServices;
import com.aladhas.fitness.services.SellServices;
import com.aladhas.fitness.services.TodayServices;

@Controller
@SessionAttributes("name")
@RequestMapping("/Fitness")
public class AccountsController {

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
	
	@GetMapping("/Accounts")
	public ModelAndView Accounts(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		List<Accounts> allAcc =accServices.getAllAcc();
		mv.addObject("allAcc", allAcc);
		List<Sell> allSell = sellServices.getAllSell();
		mv.addObject("allSell", allSell);
		List<New_Subscriptions> allSub = subServices.getAllSub();
		mv.addObject("allSub", allSub);
		List<Today_trainings> allToday = todayServices.getAllTodayNotSub("بدون اشتراك");
		mv.addObject("allToday", allToday);
		List<Expenses> allExp = expServices.getAllExpenses();
		mv.addObject("allExp", allExp);
		Users name = null;
		name =  (Users) session.getAttribute("name");	
		System.out.println("...." + name);
		if(name == null ) {
			mv.setViewName("login");
		}else {
			mv.setViewName("Accounts");
		}
		return mv;
	}
}
