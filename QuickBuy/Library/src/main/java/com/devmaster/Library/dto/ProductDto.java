package com.devmaster.Library.dto;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {

	@NotEmpty(message = "Vui lòng nhập vào tên sản phẩm")
    @Size(min = 3, max = 255, message = "Tên sản phẩm phải từ 3 - 225 ký tự!")
	private String productName;

	@NotEmpty(message = "Vui lòng nhập vào mô tả sản phẩm")
	@Size(max = 1000, message = "Product description should not exceed 1000 characters")
	private String description;

	private float price;

	private int quantity;
	
//	private String image;
	private MultipartFile image;

	
	private Integer categoryId;

	
	private Integer brandID;

	private Integer sizeId;

	private Integer color_id;

	private Integer customer_ID;
}
