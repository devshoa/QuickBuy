package com.devmaster.Library.service;

import java.util.Collection;
import java.util.List;

import com.devmaster.Library.model.Color;

public interface ColorService {
	Collection<Color> findAllColor();

	List<Color> findById(int id);
}
