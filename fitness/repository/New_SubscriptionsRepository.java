package com.aladhas.fitness.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.aladhas.fitness.model.New_Subscriptions;

@Repository
public interface New_SubscriptionsRepository extends JpaRepository<New_Subscriptions, Long>{

	@Query("select s from New_Subscriptions s where s.id = ?1")
	New_Subscriptions getSub(Long id);
	
	@Query("select s from New_Subscriptions s where s.expiry = ?1")
	List<New_Subscriptions> getAllSub(String expiry);
	
	@Query("select sum(n.price) from New_Subscriptions n where n.date_start = ?1")
	Double getAllSubPrice(Date date);
	
	@Query("select s from New_Subscriptions s where s.date_end = ?1")
	List<New_Subscriptions> getAllExpiryToday(Date date);
	
	@Query("select count(s.id) from New_Subscriptions s where s.date_end = ?1")
	int getNumAllExpiryToday(Date date);
}
