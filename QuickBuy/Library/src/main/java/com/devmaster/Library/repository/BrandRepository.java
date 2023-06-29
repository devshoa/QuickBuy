package com.devmaster.Library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devmaster.Library.model.Brand;

@Repository
public interface BrandRepository extends JpaRepository<Brand, Integer>{
	
}
