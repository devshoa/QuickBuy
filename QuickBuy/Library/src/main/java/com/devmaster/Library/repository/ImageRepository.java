package com.devmaster.Library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devmaster.Library.model.Image;

@Repository
public interface ImageRepository extends JpaRepository<Image, Integer>{

	@Query("SELECT pc FROM Image pc WHERE pc.product.productID = ?1")
	List<Image> findByID(int id);

}
