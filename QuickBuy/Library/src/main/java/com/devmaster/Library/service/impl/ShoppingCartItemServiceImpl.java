package com.devmaster.Library.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.ShoppingCartItem;
import com.devmaster.Library.repository.ShoppingCartItemRepository;
import com.devmaster.Library.service.ShoppingCartItemService;

@Service
public class ShoppingCartItemServiceImpl implements ShoppingCartItemService {

	@Autowired
	private ShoppingCartItemRepository shoppingCartItemRepository;

	@Override
	public List<ShoppingCartItem> findAll() {
		return (List<ShoppingCartItem>) shoppingCartItemRepository.findAll();
	}

	public List<ShoppingCartItem> findByCustomerID(int customerID) {
		return shoppingCartItemRepository.findByCustomerID(customerID);
	}

	public int getCountCartItem(int customerID) {
		return shoppingCartItemRepository.getCountCartItem(customerID);
	}

	public ShoppingCartItem save(ShoppingCartItem shoppingCartItem) {

		return shoppingCartItemRepository.save(shoppingCartItem);
	}

	public ShoppingCartItem findByShoppingCartByShoppingCartID(int shoppingCartID) {
		return shoppingCartItemRepository.findByShoppingCartByShoppingCartID(shoppingCartID);
	}

	public ShoppingCartItem getProductByProductIdAndShoppingCartIdProductColorIdProductSizeId(int customerID,
			int productID, int shoppingCartID, int colorID, int sizeID) {
		return shoppingCartItemRepository.getProductByProductIdAndShoppingCartIdProductColorIdProductSizeId(customerID,
				productID, shoppingCartID, colorID, sizeID);
	}

	public void deleteShoppingCartItem(int id) {
		shoppingCartItemRepository.deleteById(id);
	}

	public Integer findByShoppingCartItemIDByProductIDAndCustomerID(int productID, int customerID) {
		return shoppingCartItemRepository.findByShoppingCartItemIDByProductIDAndCustomerID(productID, customerID);
	}

	public void removeByShoppingCartID(int shoppingCartIds) {
		shoppingCartItemRepository.removeByShoppingCartID(shoppingCartIds);
	}

}
