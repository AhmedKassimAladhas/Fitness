package com.aladhas.fitness.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aladhas.fitness.model.Products;
import com.aladhas.fitness.repository.ProductsRepository;

@Service
public class ProductsServices {

	@Autowired
	private ProductsRepository prodRepository;
	
	public void addProd(Products prod) {
		prodRepository.save(prod);
	}
	
	public List<Products> getAllProd(){
		return prodRepository.findAll();
	}
	
	public List<Products> getAllProdExist(){
		return prodRepository.getAllProd();
	}
	
	public void deletProd(Long id) {
		prodRepository.deleteById(id);
	}
	
	public Products getProd(Long id) {
		return prodRepository.findById(id).get();
	}
}
