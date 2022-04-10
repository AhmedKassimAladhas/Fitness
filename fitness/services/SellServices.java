package com.aladhas.fitness.services;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aladhas.fitness.model.Sell;
import com.aladhas.fitness.repository.SellRepository;

@Service
public class SellServices {

	@Autowired
	private SellRepository sellRepository;
	
	public void addSeall(Sell sell) {
		sellRepository.save(sell);
	}
	
	public void deleteSell(Long id) {
		sellRepository.deleteById(id);
	}
	
	public List<Sell> getSellToday(Date date_sell){
		return sellRepository.getSellToday(date_sell);
	}
	
	public Sell getSellById(Long id){
		return sellRepository.getOne(id);
	}
	
	public List<Sell> getAllSell(){
		return sellRepository.findAll();
	}
	
	public Double getSellPriceToday(Date date) {
		return sellRepository.getAllSellPrice(date);
	}
}
