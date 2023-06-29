package com.devmaster.Library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devmaster.Library.model.OrderStatus;

@Repository
public interface OrderStatusRepository extends JpaRepository<OrderStatus, Integer> {

	
	@Query("SELECT pc FROM OrderStatus pc WHERE pc.orderStatusName = ?1")
	OrderStatus findAllOrderStatusByOrderStatusName(String orderStatusName);
	
}
