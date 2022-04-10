package com.aladhas.fitness.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aladhas.fitness.model.Sections;
import com.aladhas.fitness.repository.SectionsRepository;

@Service
public class SectionsServices {

	@Autowired
	private SectionsRepository secRepository;
	
	public void addSec(Sections sec) {
		secRepository.save(sec);
	}
	
	public List<Sections> getAllSec(){
		return secRepository.findAll();
	}
	
	public void deleteSec(Long id) {
		secRepository.deleteById(id);
	}
	
	public Sections getSec(Long id) {
		return secRepository.findById(id).get();
	}
	
	public Double getPrice(String sec_name) {
		return secRepository.getPrice(sec_name);
	}
}
