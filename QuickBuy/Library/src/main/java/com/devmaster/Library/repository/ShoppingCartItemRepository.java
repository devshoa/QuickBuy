package com.devmaster.Library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devmaster.Library.model.ShoppingCartItem;

@Repository
public interface ShoppingCartItemRepository extends JpaRepository<ShoppingCartItem, Integer> {

	List<ShoppingCartItem> findAll();

	@Query("SELECT i FROM ShoppingCartItem i WHERE i.shoppingCart.customer.customerID = ?1")
	List<ShoppingCartItem> findByCustomerID(int CustomerID);

	// lấy số lượng sản phẩm có trong giỏ hàng của mỗi khách hàng
	@Query("SELECT count(i) FROM ShoppingCartItem i WHERE i.shoppingCart.customer.customerID = ?1")
	Integer getCountCartItem(int customerID);

	// Lấy ra sản phẩm trong giỏ hàng khi mà các tham số truyền vào = nhau
	@Query("SELECT i FROM ShoppingCartItem i WHERE i.shoppingCart.customer.customerID = ?1 AND i.product.productID = ?2 AND i.shoppingCart.shoppingCartDd = ?3 AND i.productColor.color.colorID = ?4 AND i.productSize.size.sizeID = ?5")
	ShoppingCartItem getProductByProductIdAndShoppingCartIdProductColorIdProductSizeId(int customerID, int productID,
			int shoppingCartID, int colorID, int sizeID);

	@Query("SELECT i FROM ShoppingCartItem i WHERE i.shoppingCartItemID = ?1")
	ShoppingCartItem findByShoppingCartByShoppingCartID(int shoppingCartItemID);

	@Query("SELECT i.shoppingCartItemID FROM ShoppingCartItem i WHERE i.product.productID = ?1 AND i.shoppingCart.customer.customerID = ?2")
	Integer findByShoppingCartItemIDByProductIDAndCustomerID(int productID, int customerID);

	@Query("DELETE FROM ShoppingCartItem i WHERE i.shoppingCartItemID = ?1")
	void removeByShoppingCartID(int shoppingCartIds);

}
