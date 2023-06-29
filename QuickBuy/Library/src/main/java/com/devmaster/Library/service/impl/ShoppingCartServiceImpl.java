package com.devmaster.Library.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.ShoppingCart;
import com.devmaster.Library.repository.ShoppingCartRepository;
import com.devmaster.Library.service.ShoppingCartService;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	
	@Autowired
	private ShoppingCartRepository shoppingCartRepository;

	@Override
	public ShoppingCart findById(int customerID) {
		return (ShoppingCart) shoppingCartRepository.findById(customerID) ;
	}
	
	public int numberOfProducts(int customerID) {
		return shoppingCartRepository.numberOfProducts(customerID);
	}

	public ShoppingCart save(ShoppingCart cart) {
		return shoppingCartRepository.save(cart);
	}
	
	public ShoppingCart getShoppingCartIDByCustomerID(int customerID) {
		return shoppingCartRepository.getShoppingCartIDByCustomerID(customerID);
	}
	
}
