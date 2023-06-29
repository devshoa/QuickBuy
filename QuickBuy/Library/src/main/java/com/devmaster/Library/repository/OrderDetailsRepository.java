package com.devmaster.Library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devmaster.Library.model.OrderDetails;


@Repository
public interface OrderDetailsRepository extends JpaRepository<OrderDetails, Integer> {

	@Query("SELECT pc FROM OrderDetails pc WHERE pc.order.customer.customerID = ?1")
	List<OrderDetails> findOrderDetailsByCustomerID(int customerID);
	
	@Query("SELECT pc FROM OrderDetails pc WHERE pc.order.orderID = ?1 AND pc.order.customer.customerID = ?2")
	OrderDetails findAllOrderDetalByOrderIDAndCustomerID(int orderID, int customerID);
	
	@Query("SELECT o FROM OrderDetails o WHERE o.order.orderID = ?1")
	List<OrderDetails> findByOrderid(Integer orderid);
	
}
