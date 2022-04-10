package com.aladhas.fitness.services;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aladhas.fitness.model.Expenses;
import com.aladhas.fitness.repository.ExpensesRepository;

@Service
public class ExpensesServices {

	@Autowired
	private ExpensesRepository exRepository;
	
	public void addExpense(Expenses expens) {
		exRepository.save(expens);
	}
	
	public List<Expenses> getExpensesToday(Date date_entry){
		return exRepository.getExpensesToday(date_entry);
	}
	
	public List<Expenses> getAllExpenses(){
		return exRepository.findAll();
	}
	
	public Double getExpPriceToday(Date date) {
		return exRepository.getAllExpPrice(date);
	}
}
