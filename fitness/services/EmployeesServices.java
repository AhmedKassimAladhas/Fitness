package com.aladhas.fitness.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aladhas.fitness.model.Employees;
import com.aladhas.fitness.repository.EmployeesRepository;

@Service
public class EmployeesServices {

	@Autowired
	private EmployeesRepository empRepository;
	
	public void addEmp(Employees emp) {
		empRepository.save(emp);
	}
	
	public void deletEmp(Long id) {
		empRepository.deleteById(id);
	}
	
	public List<Employees> getAllEmp(){
		return empRepository.findAll();
	}
	
	public Employees getEmp(Long id){
		return empRepository.findById(id).get();
	}
}
