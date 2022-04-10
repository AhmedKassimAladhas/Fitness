package com.aladhas.fitness.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.aladhas.fitness.model.Body_measurements;

@Repository
public interface Body_measurementsRepository extends JpaRepository<Body_measurements, Long>{

}
