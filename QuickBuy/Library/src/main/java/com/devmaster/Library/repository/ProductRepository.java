package com.devmaster.Library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devmaster.Library.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

	@Query("SELECT i FROM Product i WHERE i.productID = ?1")
	Product getProductByID(int productID); 
	
	@Query("SELECT i.price FROM Product i WHERE i.productID = ?1")
	float getProductPriceByID(int productID);

	
	List<Product> findTop20By();
	
	@Query("SELECT i FROM Product i WHERE i.category.categoryID = ?1")
	List<Product> getByCategory(int categoryID);
	

	 
	//đếm số lượng sp
	@Query("SELECT count(p.productID) FROM Product p")
	Integer countAllProduct();
	
	//thống kê
//	@Query("SELECT new Report(p.category, sum(p.price), count(p)) FROM Product p GROUP BY p.category ORDER BY sum(p.price) DESC")
//	List<Report> getInventoryByCategory();
	
//	@Query("SELECT new Report(p.createDate, sum(p.price), count(p)) FROM Product p GROUP BY p.createDate ORDER BY sum(p.price) DESC")
//	List<Report> getInventoryByDate();
	
	
	

}
