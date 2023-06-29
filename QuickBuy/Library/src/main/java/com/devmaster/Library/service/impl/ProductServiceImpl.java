package com.devmaster.Library.service.impl;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.Product;
import com.devmaster.Library.repository.ProductRepository;
import com.devmaster.Library.service.ProductService;


@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;
	


	@Override
	public Collection<Product> findAllProduct() {
		return productRepository.findAll();
	}


	@Override
	public Optional<Product> findById(int id) {
		return productRepository.findById(id);
	}

	public Product getProductByID(int productID) {
		return productRepository.getProductByID(productID);
	}
	
	public float getProductPriceByID(int productID) {
		return productRepository.getProductPriceByID(productID);
	}
	
	public List<Product> getLatestProduct() {
		return productRepository.findTop20By();
	}
	
	public List<Product> getByCategory(int categoryID) {
		return productRepository.getByCategory(categoryID);
	}

}
