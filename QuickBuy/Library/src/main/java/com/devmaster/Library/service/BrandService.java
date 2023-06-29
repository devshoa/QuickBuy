package com.devmaster.Library.service;

import java.util.Collection;

import com.devmaster.Library.dto.BrandDto;
import com.devmaster.Library.model.Brand;

public interface BrandService {
	
	Brand save(BrandDto brandDto);
	
	Collection<Brand> finBrand();
	
}
