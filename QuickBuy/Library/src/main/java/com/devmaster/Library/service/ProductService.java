package com.devmaster.Library.service;

import java.util.Collection;
import java.util.Optional;

import com.devmaster.Library.model.Product;


public interface ProductService {
	Collection<Product> findAllProduct();
	
	Optional<Product> findById(int id);
}
