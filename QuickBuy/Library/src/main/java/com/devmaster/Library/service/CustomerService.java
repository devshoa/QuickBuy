package com.devmaster.Library.service;

import com.devmaster.Library.dto.CustomerDto;
import com.devmaster.Library.model.Customer;

public interface CustomerService {

	Customer findByUsername(String username);

	Customer save(CustomerDto customerDto);

	Customer update(CustomerDto customerDto);

	Customer changePass(CustomerDto customerDto);

	CustomerDto getCustomer(String username);

}
