package com.aladhas.fitness.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.aladhas.fitness.model.Products;

@Repository
public interface ProductsRepository extends JpaRepository<Products, Long>{

	@Query("select p from Products p where p.Count!= 0")
	List<Products> getAllProd();
}
