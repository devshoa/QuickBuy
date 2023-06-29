package com.devmaster.Library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devmaster.Library.model.ProductColor;

@Repository
public interface ProductColorRepository extends JpaRepository<ProductColor, Integer> {

	@Query("SELECT pc FROM ProductColor pc WHERE pc.product.productID = ?1")
	List<ProductColor> findByID(int id);
	

	@Query("SELECT pc FROM ProductColor pc WHERE pc.product.productID = ?1 AND pc.color.colorID = ?2")
	ProductColor getColorByProductID(int productID, int colorID);
	
}
