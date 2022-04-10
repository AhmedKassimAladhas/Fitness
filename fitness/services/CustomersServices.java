package com.aladhas.fitness.services;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aladhas.fitness.model.Customers;
import com.aladhas.fitness.repository.CustomersRepository;

@Service
public class CustomersServices {

	@Autowired
	private CustomersRepository custRepository;
	
	public void addCust(Customers cust) {
		custRepository.save(cust);
	}
	
	public List<Customers> getAllCust(){
		return custRepository.findAll();
	}

	public List<Customers> getAllCustExpiry(String expiry){
		return custRepository.getAllExpiry(expiry);
	}
	
	public List<Customers> getAllCustNotExpiry(String expiry){
		return custRepository.getAllNotExpiry(expiry);
	}
	
	public List<Customers> getAllCustTraining(String sub, Date trainDate){
		return custRepository.getAllTrainigSub(sub, trainDate);
	}
	
	public void deletCust(Long id) {
		custRepository.deleteById(id);
	}
	
	public Customers getCust(Long id) {
		return custRepository.findById(id).get();
	}
	
	public int getNumAll() {
		return custRepository.getNumAll();
	}
	
	public int getNumAllSub(String sub) {
		return custRepository.getNumAllSub(sub);
	}
	
	public void endCustSubscrip() {
		java.util.Date utilDate = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String stringDate = dateFormat.format(utilDate);
		Date date = Date.valueOf(stringDate);
		List<Customers> cus = getAllCust();
		if (cus.isEmpty()) {
			System.out.println("no cus");
		} else {
			System.out.println("Hello..cus");
			for (Customers c : cus) {
				if (c.getSub_end() != null && c.getSub_end().getTime() < date.getTime()) {
					c.setLast_sub("منتهي");
					addCust(c);
				} else {
					System.out.println("end cus");
				}
			}

		}
	}
}
