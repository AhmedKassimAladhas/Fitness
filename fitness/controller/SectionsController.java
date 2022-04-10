package com.aladhas.fitness.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.aladhas.fitness.model.Offers;
import com.aladhas.fitness.model.Sections;
import com.aladhas.fitness.model.Users;
import com.aladhas.fitness.services.OffersServices;
import com.aladhas.fitness.services.SectionsServices;

@Controller
@SessionAttributes("name")
@RequestMapping("/Fitness")
public class SectionsController {

	@Autowired
	private SectionsServices secServices;

	@Autowired
	private OffersServices offerServices;

	@GetMapping("/Sections")
	public ModelAndView Sections(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		Sections sec = new Sections();
		mv.addObject("sec", sec);
		List<Sections> allSec = secServices.getAllSec();
		mv.addObject("allSec", allSec);
		Offers offer = new Offers();
		mv.addObject("offer", offer);
		List<Offers> allOffer = offerServices.getall();
		mv.addObject("allOffer", allOffer);
		Users name = null;
		name =  (Users) session.getAttribute("name");		
		System.out.println("...." + name);
		if(name == null ) {
			mv.setViewName("login");
		}else {
			mv.setViewName("Sections");
		}
		return mv;
	}

	@PostMapping("/Sections")
	public String addNewSec(@ModelAttribute("sec") Sections sec) {
		secServices.addSec(sec);
		return "redirect:/Fitness/Sections";
	}

	@PutMapping("/Sections")
	public String updateSec(@ModelAttribute("sec") Sections sec) {

		secServices.addSec(sec);
		return "redirect:/Fitness/Sections";
	}

	@DeleteMapping("/Sections")
	public String deleteSec(@RequestParam("secid") Long id, HttpServletRequest requst) {
		if(id != 1) {
			secServices.deleteSec(id);	
		}
		return "redirect:/Fitness/Sections";
		
	}

	@PostMapping("/Offer")
	public String addNewOffer(@RequestParam("offer_name") String offer_name,
			@RequestParam("offer_Details") String offer_Details, @RequestParam("offer_Price") Double offer_Price,
			@RequestParam("date_Start") Date date_Start, @RequestParam("date_End") Date date_End,
			@RequestParam("sec") Long sec, @RequestParam("notes") String notes) {

		Sections s = secServices.getSec(sec);
		Offers offer = new Offers(offer_name, offer_Details, offer_Price, date_Start, date_End, s, notes);
		offer.getSec().setOffer("يوجد");
		offer.getSec().setOffer_price(offer_Price);
		offerServices.addOffer(offer);
		return "redirect:/Fitness/Sections";
	}

	@DeleteMapping("/Offer")
	public String deleteOffer(@RequestParam("oid") Long id) {
		offerServices.deleteOffer(id);
		return "redirect:/Fitness/Sections";
	}
}
