package com.aladhas.fitness.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.aladhas.fitness.model.Today_trainings;

@Repository
public interface TodayRepository extends JpaRepository<Today_trainings, Long>{

	@Query("select t from Today_trainings t where t.date = ?1")
	List<Today_trainings> getToday(Date date);
	
	@Query("select t from Today_trainings t where t.subscrip = ?1")
	List<Today_trainings> getTodayNotSub(String sub);
	
	@Query("select sum(t.price) from Today_trainings t where t.date = ?1")
	Double getAllPriceToday(Date date);
	
	@Query("select count(t.id) from Today_trainings t where t.date = ?1")
	int getAllTriningToday(Date date);
	
	@Query("select count(t.id) from Today_trainings t where t.date = ?1 and t.subscrip = ?2")
	int getCustTriningToday(Date date, String sub);
}
