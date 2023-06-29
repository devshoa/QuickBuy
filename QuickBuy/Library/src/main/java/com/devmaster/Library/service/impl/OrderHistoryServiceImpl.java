package com.devmaster.Library.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.OrderHistory;
import com.devmaster.Library.repository.OrderHistoryRepository;
import com.devmaster.Library.service.OrderHistoryService;

@Service
public class OrderHistoryServiceImpl implements OrderHistoryService {
	
	@Autowired
	private OrderHistoryRepository orderHistoryRepository;

	@Override
	public List<OrderHistory> getOrderHistoryByCustomerID(int customerID) {
		return orderHistoryRepository.getOrderHistoryByCustomerID(customerID);
	}
	
	public OrderHistory save(OrderHistory orderHistory) {
		return orderHistoryRepository.save(orderHistory);
	}

	public OrderHistory getOrderHistoryByCustomerIDAndOrderID(int cusomerID, int orderID) {
		return orderHistoryRepository.getOrderHistoryByCustomerIDAndOrderID(cusomerID, orderID);
	}

	public OrderHistory getOrderHistoryByCustomerIDAndOrderHistyoryID(int customerID, int historyID) {
		return orderHistoryRepository.getOrderHistoryByCustomerIDAndOrderHistyoryID(customerID, historyID);
	}
	
}
