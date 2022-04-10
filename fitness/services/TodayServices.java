package com.aladhas.fitness.services;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aladhas.fitness.model.Today_trainings;
import com.aladhas.fitness.repository.TodayRepository;

@Service
public class TodayServices {

	@Autowired
	private TodayRepository todayRepository;
	
	public void addToday(Today_trainings today) {
		todayRepository.save(today);
	}
	
	public List<Today_trainings> getAllToday(){
		return todayRepository.findAll();
	}
	
	public List<Today_trainings> getAllTodayNotSub(String sub){
		return todayRepository.getTodayNotSub(sub);
	}
	
	public List<Today_trainings> getToday(Date date){
		return todayRepository.getToday(date);
	}
	
	public Double getPriceToday(Date date) {
		return todayRepository.getAllPriceToday(date);
	}
	
	public int getAllTrining(Date date) {
		return todayRepository.getAllTriningToday(date);
	}
	
	public int getCustTrining(Date date, String sub) {
		return todayRepository.getCustTriningToday(date, sub);
	}
}
