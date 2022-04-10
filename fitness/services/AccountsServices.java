package com.aladhas.fitness.services;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aladhas.fitness.model.Accounts;
import com.aladhas.fitness.repository.AccountsRepository;

@Service
public class AccountsServices {

	@Autowired
	private AccountsRepository accRepository;
	
	public void addAcc(Accounts acc) {
		accRepository.save(acc);
	}
	
	public List<Accounts> getAllAccToday(Date date){
		return accRepository.getAllAccountsToday(date);
	}
	
	public List<Accounts> getAllAcc(){
		return accRepository.findAll();
	}
}
