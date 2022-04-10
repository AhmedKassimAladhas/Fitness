package com.aladhas.fitness.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.aladhas.fitness.model.Users;

@Controller
@SessionAttributes("name")
@RequestMapping("/Fitness")
public class Renew_SubscriptionsController {

	@GetMapping("/Renew_Subscriptions")
	public ModelAndView Renew_Subscriptions(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Users name = null;
		name =  (Users) session.getAttribute("name");		
		System.out.println("...." + name);
		if(name == null ) {
			mv.setViewName("login");
		}else {
			mv.setViewName("Renew_Subscriptions");
		}
		return mv;
	}
}
