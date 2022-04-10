package com.aladhas.fitness.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.aladhas.fitness.model.Users;
@Repository
public interface UsersRepository extends JpaRepository<Users, Long>{

	@Query("select u from Users u where u.Username=?1 And u.Password=?2")
	Users findByUsernameAndPass(String username, String password);
}
