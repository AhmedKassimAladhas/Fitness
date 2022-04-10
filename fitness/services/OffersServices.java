package com.aladhas.fitness.services;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.aladhas.fitness.model.Offers;
import com.aladhas.fitness.repository.OffersRepository;

@Service
public class OffersServices {

	@Autowired
	private OffersRepository offersRepository;
	
	public void addOffer(Offers offer) {
		offersRepository.save(offer);
	}
	
	public void deleteOffer(Long id) {
		offersRepository.deleteById(id);
	}
	
	public List<Offers> getall(){
		return offersRepository.findAll();
	}
	
	public void endOffer() {		
		java.util.Date utilDate = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String stringDate= dateFormat.format(utilDate);						
		Date date =  Date.valueOf(stringDate);
		System.out.println("today :" + date);
		List<Offers> o = getall();
		if(o.isEmpty()) {			
			System.out.println("no offer");		
			}else {			
			System.out.println("Hello..offer");
				for(Offers i : o) {					
					System.out.println("today offer:" + i.getDate_End());				
					System.out.println("today offer:" + date.getTime());
		        	System.out.println("today offer:" + i.getDate_End().getTime());					
		        	if(i.getDate_End().getTime() < date.getTime()) {		        	
		        	i.getSec().setOffer("لايوجد");
					i.getSec().setOffer_price(0.0);
					addOffer(i);		        	
		        	}else {
		        		System.out.println("end offer");
		        	}
		        }			
			}
	}
}
