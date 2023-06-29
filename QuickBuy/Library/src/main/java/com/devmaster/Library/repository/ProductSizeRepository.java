package com.devmaster.Library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devmaster.Library.model.ProductSize;

@Repository
public interface ProductSizeRepository extends JpaRepository<ProductSize, Integer> {

	@Query("SELECT pc FROM ProductSize pc WHERE pc.product.productID = ?1")
	List<ProductSize> findByID(int id);
	
	@Query("SELECT pc.quantity FROM ProductSize pc WHERE pc.product.productID = ?1 AND pc.size.sizeID = ?2")
	Integer getQuantityByProductIdAndSizeId(int productID, int sizeID);
	
	@Query("SELECT pc FROM ProductSize pc WHERE pc.product.productID = ?1 AND pc.size.sizeID = ?2")
	ProductSize getProductSizeByProductID(int productID, int sizeID);
	
}
