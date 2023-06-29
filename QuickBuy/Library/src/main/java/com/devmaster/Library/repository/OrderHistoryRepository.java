package com.devmaster.Library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devmaster.Library.model.OrderHistory;

@Repository
public interface OrderHistoryRepository extends JpaRepository<OrderHistory, Integer> {

	@Query("SELECT i FROM OrderHistory i WHERE i.order.customer.customerID = ?1")
	List<OrderHistory> getOrderHistoryByCustomerID(int customerID);

	@Query("SELECT i FROM OrderHistory i WHERE i.order.customer.customerID = ?1 AND i.order.orderID = ?2")
	OrderHistory getOrderHistoryByCustomerIDAndOrderID(int customerID, int orderID);
	
	@Query("SELECT i FROM OrderHistory i WHERE i.order.customer.customerID = ?1 AND i.orderHistoryID = ?2")
	OrderHistory getOrderHistoryByCustomerIDAndOrderHistyoryID(int customerID, int historyID);
	
}
