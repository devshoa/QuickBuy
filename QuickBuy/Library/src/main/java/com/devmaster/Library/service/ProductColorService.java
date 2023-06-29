package com.devmaster.Library.service;

import java.util.Collection;
import java.util.List;

import com.devmaster.Library.model.ProductColor;

public interface ProductColorService {

	Collection<ProductColor> findAll();

	List<ProductColor> findById(int id);
}
