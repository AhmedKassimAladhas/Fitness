package com.aladhas.fitness.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.aladhas.fitness.model.Sections;

@Repository
public interface SectionsRepository extends JpaRepository<Sections, Long>{

	@Query("select Price from Sections where Sec_name=?1")
	Double getPrice(String sec_name);
}
