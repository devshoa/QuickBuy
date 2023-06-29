package com.devmaster.Library.service.impl;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.Order;
import com.devmaster.Library.repository.OrderRepository;
import com.devmaster.Library.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderRepository orderRepository;

	@Override
	public Collection<Order> findAllOrderByID() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<Order> findByID(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}
	
	public Order save(Order order) {
		return orderRepository.save(order);
	}

}
