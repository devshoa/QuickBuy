package com.devmaster.Library.service;

import java.util.Collection;
import java.util.Optional;

import com.devmaster.Library.model.Order;

public interface OrderService {
	Collection<Order> findAllOrderByID();

	Optional<Order> findByID(int id);
}
