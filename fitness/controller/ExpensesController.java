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

import com.aladhas.fitness.services.ExpensesServices;
import com.aladhas.fitness.model.Expenses;
import com.aladhas.fitness.model.Users;

@Controller
@SessionAttributes("name")
@RequestMapping("/Fitness")
public class ExpensesController {

	@Autowired
	private ExpensesServices exServices;
	
	@GetMapping("/Expenses")
	public ModelAndView Expenses(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Expenses exp = new Expenses();
		java.util.Date utilDate = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String stringDate = dateFormat.format(utilDate);
		Date date = Date.valueOf(stringDate);
		List<Expenses> allExp = exServices.getExpensesToday(date);
		mv.addObject("allExp", allExp);
		mv.addObject("date", date);
		mv.addObject("exp", exp);
		Users name = null;
		name =  (Users) session.getAttribute("name");		
		System.out.println("...." + name);
		if(name == null ) {
			mv.setViewName("login");
		}else {
			mv.setViewName("Expenses");
		}
		return mv;
	}
	
	@PostMapping("/Expenses")
	public String addExpense(@ModelAttribute("exp") Expenses exp) {
		exServices.addExpense(exp);
		return "redirect:/Fitness/Expenses";
	}
}
