package com.devmaster.Library.service;

import java.util.Collection;

import com.devmaster.Library.model.Category;

public interface CategoryService {

	Category save(Category category);

	Collection<Category> findAllCategory();

}
