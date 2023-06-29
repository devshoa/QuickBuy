package com.devmaster.Library.service.impl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.dto.BrandDto;
import com.devmaster.Library.model.Brand;
import com.devmaster.Library.repository.BrandRepository;
import com.devmaster.Library.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService {

	@Autowired
	private BrandRepository brandRepository;
	

	@Override
	public Brand save(BrandDto brandDto) {
		Brand brand = new Brand();
		brand.setBrandName(brandDto.getBrandName());
		return brandRepository.save(brand);
	}

	@Override
	public Collection<Brand> finBrand() {
		return brandRepository.findAll();
	}

}
