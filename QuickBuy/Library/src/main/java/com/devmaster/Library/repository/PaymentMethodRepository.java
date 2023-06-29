package com.devmaster.Library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.devmaster.Library.model.PaymentMethod;

public interface PaymentMethodRepository extends JpaRepository<PaymentMethod, Integer> {
	
	@Query("SELECT pc FROM PaymentMethod pc WHERE pc.PaymentMethodID = ?1")
	PaymentMethod findByPaymentMethodID(int paymentID);
	
}
