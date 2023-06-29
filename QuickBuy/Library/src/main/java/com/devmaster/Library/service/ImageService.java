package com.devmaster.Library.service;

import java.util.List;

import com.devmaster.Library.model.Image;


public interface ImageService {
	
	List<Image> findById(int id);
	
}
