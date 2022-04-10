package com.aladhas.fitness.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aladhas.fitness.model.Dates;
import com.aladhas.fitness.repository.DatesRepository;

@Service
public class DatesServices {

	@Autowired
	private DatesRepository dateRepository;
	
	public void addDate(Dates date) {
		dateRepository.save(date);
	}
	
	public List<Dates> getAllDate(){
		return dateRepository.findAll();
	}
	
	public void deleteDate(Long id) {
		dateRepository.deleteById(id);
	}
}
