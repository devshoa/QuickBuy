package com.devmaster.Library.model;

import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "products")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "product_id")
	private int productID;
	
	
	private String productName;

	@Column(columnDefinition = "NVARCHAR(MAX)")
	private String description;

	private Double price;
	
	@Transient
	private String formatPrice;

	private String image;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;

	@Column(columnDefinition = "NVARCHAR(25)")
	private String origin;

	private int remaining;

	@Column(columnDefinition = "NVARCHAR(50)")
	private String sentFrom;

	@OneToMany(mappedBy = "product")
	private Set<ProductSize> productSizes;

	@ManyToOne
	@JoinColumn(name = "brand_id")
	private Brand brand;

	@ManyToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;
}
