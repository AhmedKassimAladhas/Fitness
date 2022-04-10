package com.aladhas.fitness.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.aladhas.fitness.model.Customers;

@Repository
public interface CustomersRepository extends JpaRepository<Customers, Long>{

	@Query("select c from Customers c where c.last_sub = ?1")
	List<Customers> getAllExpiry(String expiry);
	
	@Query("select c from Customers c where c.last_sub != ?1")
	List<Customers> getAllNotExpiry(String expiry);
	
	@Query("select c from Customers c where c.last_sub = ?1 and c.trainingDay!=?2 or c.last_sub = ?1 and c.trainingDay= null")
	List<Customers> getAllTrainigSub(String sub, Date trainDate);
	
	@Query("select count(c.Cid) from Customers c where c.last_sub = ?1")
	int getNumAllSub(String sub);
	
	@Query("select count(c.Cid) from Customers c ")
	int getNumAll();
}
