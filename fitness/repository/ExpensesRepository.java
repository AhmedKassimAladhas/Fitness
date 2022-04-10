package com.aladhas.fitness.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.aladhas.fitness.model.Expenses;

@Repository
public interface ExpensesRepository extends JpaRepository<Expenses, Long>{
	
	@Query("select e from Expenses e where e.date_entry=?1")
	List<Expenses> getExpensesToday(Date date_entry);
	
	@Query("select sum(e.price) from Expenses e where e.date_entry = ?1")
	Double getAllExpPrice(Date date);
}
