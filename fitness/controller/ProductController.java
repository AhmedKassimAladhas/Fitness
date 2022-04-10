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

import com.aladhas.fitness.model.Products;
import com.aladhas.fitness.model.Users;
import com.aladhas.fitness.services.ProductsServices;

@Controller
@SessionAttributes("name")
@RequestMapping("/Fitness")
public class ProductController {

	@Autowired
	private ProductsServices prodServices;
	
	@GetMapping("/Product")
	public ModelAndView Product(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Products prod = new Products();
		mv.addObject("prod", prod);
		List<Products> allprod = prodServices.getAllProd();
		mv.addObject("allprod", allprod);
		Users name = null;
		name =  (Users) session.getAttribute("name");	
		System.out.println("...." + name);
		if(name == null ) {
			mv.setViewName("login");
		}else {
			mv.setViewName("Product");
		}
		return mv;
	}
	
	@PostMapping("/Product")
	public String addProd(@ModelAttribute("prod") Products prod) {
		prodServices.addProd(prod);
		return "redirect:/Fitness/Product";
	}
	
	@PutMapping("/Product")
	public String editProd(@ModelAttribute("prod") Products prod) {
		prodServices.addProd(prod);
		return "redirect:/Fitness/Product";
	}
	
	@DeleteMapping("/Product")
	public String deleteProd(@RequestParam("id") Long id) {
		prodServices.deletProd(id);
		return "redirect:/Fitness/Product";
	}
}
