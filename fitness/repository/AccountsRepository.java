package com.aladhas.fitness.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.aladhas.fitness.model.Accounts;

@Repository
public interface AccountsRepository extends JpaRepository<Accounts, Long>{

	@Query("select a from Accounts a where a.Date_today=?1")
	List<Accounts> getAllAccountsToday(Date date);
}
