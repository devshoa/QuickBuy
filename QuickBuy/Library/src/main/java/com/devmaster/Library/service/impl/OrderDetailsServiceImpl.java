package com.devmaster.Library.service.impl;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.OrderDetails;
import com.devmaster.Library.repository.OrderDetailsRepository;
import com.devmaster.Library.service.OrderDetailsService;

@Service
public class OrderDetailsServiceImpl implements OrderDetailsService {

	@Autowired
	private OrderDetailsRepository orderDetailsRepository;
	
	@Override
	public Collection<OrderDetails> findAllOrderDetailsByID(int orderDetailsID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<OrderDetails> findByID(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}
		
	public OrderDetails save(OrderDetails order) {
		return orderDetailsRepository.save(order);
	}
	
	public List<OrderDetails> findOrderDetailsByCustomerID(int customerID) {
		return orderDetailsRepository.findOrderDetailsByCustomerID(customerID);
	}
	
	public OrderDetails findAllOrderDetalByOrderIDAndCustomerID(int orderID, int customerID) {
		return orderDetailsRepository.findAllOrderDetalByOrderIDAndCustomerID(orderID, customerID);
	}
	
	
	
	
}
