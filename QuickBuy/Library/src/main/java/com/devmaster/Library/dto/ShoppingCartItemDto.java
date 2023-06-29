package com.devmaster.Library.dto;

import com.devmaster.Library.model.Product;
import com.devmaster.Library.model.ShoppingCart;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ShoppingCartItemDto {

	private ShoppingCart shoppingCart;
	private Product product;
	private String color;
	private String size;
	private int quantity;
	
	
}
