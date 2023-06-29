package com.devmaster.Library.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.model.AddressCustomer;
import com.devmaster.Library.repository.AddressCustomerRepository;
import com.devmaster.Library.service.AddressCustomerService;

@Service
public class AddressCustomerServiceImpl implements AddressCustomerService {

	@Autowired
	private AddressCustomerRepository addressCustomerRepository;
	
	@Override
	public AddressCustomer save(AddressCustomer addressCustomer) {
		return addressCustomerRepository.save(addressCustomer);
	}

	@Override
	public List<AddressCustomer> findAddressByCustomerID(int customerID) {
		return addressCustomerRepository.findAddressByCustomerID(customerID);
	}
	
	public AddressCustomer getAddressByAddressID(int addressID, int customerID) {
		return addressCustomerRepository.getAddressByAddressID(addressID, customerID);
	}
	

}
