package com.devmaster.Library.service;

import java.util.Collection;
import java.util.Optional;

import com.devmaster.Library.model.OrderDetails;


public interface OrderDetailsService {

	Collection<OrderDetails> findAllOrderDetailsByID(int orderDetailsID);

	Optional<OrderDetails> findByID(int id);
	
}
