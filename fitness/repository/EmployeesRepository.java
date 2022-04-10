package com.aladhas.fitness.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.aladhas.fitness.model.Employees;

@Repository
public interface EmployeesRepository extends JpaRepository<Employees, Long> {

}
