package com.aladhas.fitness.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aladhas.fitness.model.Users;
import com.aladhas.fitness.repository.UsersRepository;

@Service
public class UsersServices {

	@Autowired
	private UsersRepository uesrRepository;
	
	public void addUser(Users user) {
		uesrRepository.save(user);
	}
	
	public void deleteUser(Long id) {
		uesrRepository.deleteById(id);
	}
	
	public List<Users> getAllUsers(){
		return uesrRepository.findAll();
	}
	
	public Users getUser(Long id) {
		return uesrRepository.findById(id).get();	
	}
	
	public Users getUsernameAndPass(String username, String password) {
		return uesrRepository.findByUsernameAndPass(username, password);	
	}
	
}
