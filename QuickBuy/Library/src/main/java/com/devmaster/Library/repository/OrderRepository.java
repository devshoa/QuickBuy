package com.devmaster.Library.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.devmaster.Library.model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

}
