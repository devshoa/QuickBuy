package com.devmaster.Library.model;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "review")
public class Review {
	
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY) 
	 @Column(name = "review_id")
	 private int reviewID;
	 
	 @ManyToOne
	 @JoinColumn(name = "product_id")
	 private Product product;

	 @ManyToOne
	 @JoinColumn(name = "customer_id")
	 private Customer customer;

	 private int rating;

	 @Column(columnDefinition = "NVARCHAR(MAX)")
	 private String comment;
	 
	 private Date DateSubmitted;
	
}
