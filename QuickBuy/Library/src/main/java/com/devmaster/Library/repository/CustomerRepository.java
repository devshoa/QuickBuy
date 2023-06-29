package com.devmaster.Library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devmaster.Library.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer>{
	
	@Query("SELECT c FROM Customer c WHERE c.username = ?1")
	Customer findByUsername(String username);
	
	@Query("SELECT c FROM Customer c WHERE c.email = ?1")
	Customer findByEmail(String email);
	
	@Query(value = "SELECT count(a.customerID) FROM Customer a")
	Integer countAllAccount();
	
}
