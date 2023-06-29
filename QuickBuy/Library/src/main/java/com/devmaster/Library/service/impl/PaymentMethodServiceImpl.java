package com.devmaster.Library.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.PaymentMethod;
import com.devmaster.Library.repository.PaymentMethodRepository;
import com.devmaster.Library.service.PaymentMethodService;

@Service
public class PaymentMethodServiceImpl implements PaymentMethodService {

	@Autowired
	private PaymentMethodRepository methodRepository;
	
	public List<PaymentMethod> findAll() {
		return methodRepository.findAll();
	}
	
	public PaymentMethod findByPaymentMethodID(int paymentID) {
		return methodRepository.findByPaymentMethodID(paymentID);
	}
	
}
