package com.aladhas.fitness.services;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aladhas.fitness.model.New_Subscriptions;
import com.aladhas.fitness.repository.New_SubscriptionsRepository;

@Service
public class New_SubscriptionsServices {

	@Autowired
	private New_SubscriptionsRepository newRepository;

	public void addNew_Subscrip(New_Subscriptions subscrip) {
		newRepository.save(subscrip);
	}

	public List<New_Subscriptions> getAllSub() {
		return newRepository.findAll();
	}
	
	public List<New_Subscriptions> getAllStilSub(String expiry) {
		return newRepository.getAllSub(expiry);
	}
	
	public New_Subscriptions getSub(Long id) {
		return newRepository.getSub(id);
	}
	public void deleteSub(Long id) {
		newRepository.deleteById(id);
	}
	
	public Double getSubPriceToday(Date date) {
		return newRepository.getAllSubPrice(date);
	}
	
	public List<New_Subscriptions> getAllExpiryToday(Date date) {
		return newRepository.getAllExpiryToday(date);
	}

	public int getNumAllExpiryToday(Date date) {
		return newRepository.getNumAllExpiryToday(date);
	}
	
	public void endSubscrip() {
		java.util.Date utilDate = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String stringDate = dateFormat.format(utilDate);
		Date date = Date.valueOf(stringDate);
		List<New_Subscriptions> sub = getAllSub();
		if (sub.isEmpty()) {
			System.out.println("no sub");
		} else {
			System.out.println("Hello..sub");
			for (New_Subscriptions n : sub) {
				System.out.println("today sub:" + n.getDate_end());
				System.out.println("today sub:" + date.getTime());
				System.out.println("today sub:" + n.getDate_end().getTime());
				if (n.getDate_end().getTime() < date.getTime() || n.getCount() == n.getCountDone()) {
					n.setExpiry("منتهي");
					addNew_Subscrip(n);
				}if( n.getId() == n.getCust().getNumberLast_sub() && n.getCount() == n.getCountDone()){
					n.getCust().setLast_sub("منتهي");
					addNew_Subscrip(n);
					System.out.println("end sub");
				}if( n.getId() == n.getCust().getNumberLast_sub() && n.getCount() == n.getCountDone() +1){
					n.getCust().setTrainingCount("اخر");
					addNew_Subscrip(n);
					System.out.println("end sub");
				}
			}

		}
	}
}
