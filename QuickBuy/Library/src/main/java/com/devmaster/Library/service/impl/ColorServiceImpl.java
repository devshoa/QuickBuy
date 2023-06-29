package com.devmaster.Library.service.impl;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.Color;
import com.devmaster.Library.repository.ColorRepository;
import com.devmaster.Library.service.ColorService;

@Service
public class ColorServiceImpl implements ColorService {

	@Autowired
	private ColorRepository colorRepository;
	
	@Override
	public Collection<Color> findAllColor() {
		return colorRepository.findAll();
	}

	@Override
	public List<Color> findById(int id) {
		return null;
	}
	
	

}
