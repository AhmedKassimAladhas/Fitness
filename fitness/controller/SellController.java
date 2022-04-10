package com.aladhas.fitness.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
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

import com.aladhas.fitness.model.Products;
import com.aladhas.fitness.services.ProductsServices;
import com.aladhas.fitness.services.SellServices;
import com.aladhas.fitness.model.Sell;
import com.aladhas.fitness.model.Users;
@Controller
@SessionAttributes("name")
@RequestMapping("/Fitness")
public class SellController {

	@Autowired
	private SellServices sellServices;
	
	@Autowired
	private ProductsServices prodServices;
	
	@GetMapping("/Sell")
	public ModelAndView Sell(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		java.util.Date utilDate = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String stringDate = dateFormat.format(utilDate);
		Date date = Date.valueOf(stringDate);
		mv.addObject("date", date);
		Sell sel = new Sell();
		mv.addObject("sel", sel);
		List<Sell> allSellToday = sellServices.getSellToday(date);
		mv.addObject("allSellToday", allSellToday);
		List<Products> allProd = prodServices.getAllProdExist();
		mv.addObject("allProd", allProd);
		
		Users name = null;
		name =  (Users) session.getAttribute("name");		
		System.out.println("...." + name);
		if(name == null ) {
			mv.setViewName("login");
		}else {
			mv.setViewName("Sell_product");
		}
		return mv;
	}
	
	@PostMapping("/Sell")
	public String addSell(@RequestParam("date_sell") Date date_sell,@RequestParam("emp") String emp,@RequestParam("prod") Long prod,@RequestParam("price") Double price,@RequestParam("count") int count,@RequestParam("discount") Double discount,@RequestParam("total") Double total,@RequestParam("notes") String notes) {
		
		Products p = prodServices.getProd(prod);
		Sell s = new Sell(date_sell, emp, p, price, count, discount, total, notes);
		s.getProd().setCount(p.getCount() - count);
		sellServices.addSeall(s);
		return "redirect:/Fitness/Sell";
	}
	
	@DeleteMapping("/Sell")
	public String deleteSell(@RequestParam("id") Long id) {
		Sell s = sellServices.getSellById(id);
		s.getProd().setCount(s.getProd().getCount() + s.getCount());
		sellServices.addSeall(s);
		sellServices.deleteSell(id);
		return "redirect:/Fitness/Accounts";
	}
}
