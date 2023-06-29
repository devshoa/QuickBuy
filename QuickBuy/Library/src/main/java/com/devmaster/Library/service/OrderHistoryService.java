package com.devmaster.Library.service;

import java.util.List;

import com.devmaster.Library.model.OrderHistory;

public interface OrderHistoryService {
	
	List<OrderHistory> getOrderHistoryByCustomerID(int customerID);
	
}
