package com.devmaster.Library.service;

import java.util.Collection;

import com.devmaster.Library.model.AddressCustomer;


public interface AddressCustomerService {

	AddressCustomer save(AddressCustomer addressCustomer);
	
	Collection<AddressCustomer> findAddressByCustomerID(int id);
	
}
