package com.devmaster.Library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.devmaster.Library.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
	@Query(value = "SELECT count(c.categoryID) FROM Category c")
	Integer countAllCategory();
}
