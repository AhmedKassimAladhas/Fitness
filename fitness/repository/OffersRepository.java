package com.aladhas.fitness.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.aladhas.fitness.model.Offers;

@Repository
public interface OffersRepository extends JpaRepository<Offers, Long>{
			
	
}
