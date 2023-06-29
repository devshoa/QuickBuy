package com.devmaster.Library.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.OrderStatus;
import com.devmaster.Library.repository.OrderStatusRepository;
import com.devmaster.Library.service.OrderStatusService;

@Service
public class OrderStatusServiceImpl implements OrderStatusService{

	
	@Autowired
	private OrderStatusRepository orderStatusRepository;
	
	@Override
	public OrderStatus findAllOrderStatusByOrderStatusName(String orderStatusName) {
		return orderStatusRepository.findAllOrderStatusByOrderStatusName(orderStatusName);
	}

	@Override
	public Optional<OrderStatus> findByID(int id) {
		// TODO Auto-generated method stub
		return Optional.empty();
	}

}
