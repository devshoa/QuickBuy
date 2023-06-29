package com.devmaster.Library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devmaster.Library.model.ShoppingCart;

@Repository
public interface ShoppingCartRepository extends JpaRepository<ShoppingCart, Integer> {

	@Query("SELECT i FROM ShoppingCart i WHERE i.customer.customerID = ?1")
	ShoppingCart findById(int customerID);
	
	@Query("SELECT COUNT(i) FROM ShoppingCart i WHERE i.customer.customerID = ?1")
	Integer numberOfProducts(int customerID);
	
	// Lấy ra shopping_cart_id của khách hàng đó
	@Query("SELECT i FROM ShoppingCart i WHERE i.customer.customerID = ?1")
	ShoppingCart getShoppingCartIDByCustomerID(int customerID);

}
