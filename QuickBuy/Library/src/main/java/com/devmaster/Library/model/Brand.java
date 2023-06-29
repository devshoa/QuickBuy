package com.devmaster.Library.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "brand")
public class Brand {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "brand_id")
    private int brandID;

	@Column(columnDefinition = "VARCHAR(25)")
    private String brandName;
}
