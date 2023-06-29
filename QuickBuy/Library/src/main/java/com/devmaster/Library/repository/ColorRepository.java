package com.devmaster.Library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.devmaster.Library.model.Color;

@Repository
public interface ColorRepository extends JpaRepository<Color, Integer>{

	
	
}
