package com.aladhas.fitness.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aladhas.fitness.model.Body_measurements;
import com.aladhas.fitness.repository.Body_measurementsRepository;

@Service
public class Body_measurementsServices {

	@Autowired
	private Body_measurementsRepository bodyRepository;
	
	public void addBody_M(Body_measurements body) {
		bodyRepository.save(body);
	}
	
	public List<Body_measurements> getAllBody(){
		return bodyRepository.findAll();
	}
	public Body_measurements getBody(Long id) {
		return bodyRepository.findById(id).get();
	}
}
