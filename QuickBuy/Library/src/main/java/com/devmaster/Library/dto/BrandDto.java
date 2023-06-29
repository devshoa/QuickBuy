package com.devmaster.Library.dto;

import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BrandDto {

	@Size(min = 2, max = 10, message = "Tên brand phải từ 2 - 10 ký tự!")
    private String brandName;
}
