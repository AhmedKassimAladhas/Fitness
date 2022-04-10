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

import com.aladhas.fitness.model.Body_measurements;
import com.aladhas.fitness.model.Customers;
import com.aladhas.fitness.model.New_Subscriptions;
import com.aladhas.fitness.model.Today_trainings;
import com.aladhas.fitness.model.Users;
import com.aladhas.fitness.services.Body_measurementsServices;
import com.aladhas.fitness.services.CustomersServices;
import com.aladhas.fitness.services.New_SubscriptionsServices;
import com.aladhas.fitness.services.SectionsServices;
import com.aladhas.fitness.services.TodayServices;

@Controller
@SessionAttributes("name")
@RequestMapping("/Fitness")
public class Training_one_dayController {

	@Autowired
	private TodayServices todayServices;
	@Autowired
	private CustomersServices custServices;
	@Autowired
	private SectionsServices secServices;
	@Autowired
	private New_SubscriptionsServices newServices;
	@Autowired
	private Body_measurementsServices bodyServices;
	
	@GetMapping("/Training")
	public ModelAndView Training_one_day(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		java.util.Date utilDate = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String stringDate = dateFormat.format(utilDate);
		Date date = Date.valueOf(stringDate);
		List<Customers> allCustSub = custServices.getAllCustTraining("متاح", date);
		mv.addObject("allCustSub", allCustSub);
		List<Customers> allCustNotSub = custServices.getAllCustTraining("بدون اشتراك", date);
		mv.addObject("allCustNotSub", allCustNotSub);
		List<Today_trainings> allCustToday = todayServices.getToday(date);
		mv.addObject("allCustToday", allCustToday);
		List<Body_measurements> allbody = bodyServices.getAllBody();
		mv.addObject("allbody", allbody);
		Double getprice = secServices.getPrice("يوم واحد");
		mv.addObject("getprice", getprice);
		mv.addObject("getdate", date);
		Users name = null;
		name =  (Users) session.getAttribute("name");		
		System.out.println("...." + name);
		if(name == null ) {
			mv.setViewName("login");
		}else {
			mv.setViewName("Training_one_day");
		}
		return mv;
	}
	
	@PostMapping("TrainingNotSub")
	public String addNotSub(@RequestParam("sid") Long sid ,@RequestParam("date") Date date, @RequestParam("subscrip") String subscrip, @RequestParam("name") String name, @RequestParam("phone") String phone, @RequestParam("price") Double price) {
		Customers cust = custServices.getCust(sid);
		Today_trainings t = new Today_trainings(date, subscrip, name, phone, price, cust);
		t.getCust().setTrainingDay(date);
		todayServices.addToday(t);

		return "redirect:/Fitness/Training";
	}
	
	@PostMapping("TrainingSub")
	public String addSub(@RequestParam("sid") Long sid ,@RequestParam("date") Date date, @RequestParam("subscrip") String subscrip, @RequestParam("name") String name, @RequestParam("phone") String phone, @RequestParam("numberSub") int numberSub) {
		Customers cust = custServices.getCust(sid);
		
		
		
		New_Subscriptions n = newServices.getSub(cust.getNumberLast_sub());
		
		n.setCountDone(n.getCountDone() +1);
		newServices.addNew_Subscrip(n);
		
		Today_trainings t = new Today_trainings(date, subscrip, numberSub, name, phone, n.getCount(), n.getCountDone(), 0.0, cust);
		t.getCust().setTrainingDay(date);
		todayServices.addToday(t);

		return "redirect:/Fitness/Training";
	}
}
