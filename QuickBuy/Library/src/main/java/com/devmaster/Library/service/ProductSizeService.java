package com.devmaster.Library.service;

import java.util.Collection;
import java.util.List;

import com.devmaster.Library.model.ProductSize;


public interface ProductSizeService {

	Collection<ProductSize> findAllColor();

	List<ProductSize> findById(int id);
	
}
