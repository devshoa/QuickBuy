package com.devmaster.Library.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.Image;
import com.devmaster.Library.repository.ImageRepository;
import com.devmaster.Library.service.ImageService;

@Service
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageRepository imageRepository;
	
	@Override
	public List<Image> findById(int id) {
		return imageRepository.findByID(id);
	}

}
