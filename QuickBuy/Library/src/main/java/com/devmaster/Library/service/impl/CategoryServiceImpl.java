package com.devmaster.Library.service.impl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.Category;
import com.devmaster.Library.repository.CategoryRepository;
import com.devmaster.Library.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	private CategoryRepository categoryRepository;
	

	@Override
	public Category save(Category category) {
		return categoryRepository.save(category);
	}

	@Override
	public Collection<Category> findAllCategory() {
		return categoryRepository.findAll();
	}

}
