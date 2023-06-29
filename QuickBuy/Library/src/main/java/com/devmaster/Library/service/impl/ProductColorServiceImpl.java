package com.devmaster.Library.service.impl;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.ProductColor;
import com.devmaster.Library.repository.ProductColorRepository;
import com.devmaster.Library.service.ProductColorService;

@Service
public class ProductColorServiceImpl implements ProductColorService {

	@Autowired
	private ProductColorRepository colorRepository;
	
	@Override
	public Collection<ProductColor> findAll() {
		return colorRepository.findAll();
	}

	@Override
	public List<ProductColor> findById(int id) {
		return colorRepository.findByID(id);
	}
	
	
	public ProductColor getColorByProductID(int customerID, int colorID) {
		return colorRepository.getColorByProductID(customerID, colorID);
	}

	

}
