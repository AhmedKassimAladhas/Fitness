package com.aladhas.fitness.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.aladhas.fitness.model.Dates;

@Repository
public interface DatesRepository extends JpaRepository<Dates, Long>{

}
