package com.devmaster.Library.service;

import java.util.Optional;

import com.devmaster.Library.model.OrderStatus;


public interface OrderStatusService {

	OrderStatus findAllOrderStatusByOrderStatusName(String orderStatusName);

	Optional<OrderStatus> findByID(int id);
	
}
