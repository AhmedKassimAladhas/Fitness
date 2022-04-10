package com.aladhas.fitness.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.aladhas.fitness.model.Sell;

@Repository
public interface SellRepository extends JpaRepository<Sell, Long>{

	@Query("select s from Sell s where s.date_sell=?1")
	List<Sell> getSellToday(Date date_sell);
	
	@Query("select sum(s.Total) from Sell s where s.date_sell = ?1")
	Double getAllSellPrice(Date date);
}
