package com.devmaster.Library.service.impl;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.ProductSize;
import com.devmaster.Library.repository.ProductSizeRepository;
import com.devmaster.Library.service.ProductSizeService;

@Service
public class ProductSizeServiceImpl implements ProductSizeService {
	
	@Autowired
	private ProductSizeRepository productSizeRepository;

	@Override
	public Collection<ProductSize> findAllColor() {
		return productSizeRepository.findAll();
	}

	@Override
	public List<ProductSize> findById(int id) {
		return productSizeRepository.findByID(id);
	}

	public Integer getQuantityByProductIdAndSizeId(int productID, int sizeID) {
		return productSizeRepository.getQuantityByProductIdAndSizeId(productID, sizeID);
	}
	
	public ProductSize getProductSizeByProductID(int productID, int sizeID) {
		return productSizeRepository.getProductSizeByProductID(productID, sizeID);
	}
	
}
