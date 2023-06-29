package com.devmaster.Library.service.impl;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devmaster.Library.dto.CustomerDto;
import com.devmaster.Library.model.Customer;
import com.devmaster.Library.repository.CustomerRepository;
import com.devmaster.Library.repository.RoleRepository;
import com.devmaster.Library.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired 
	private CustomerRepository customerRepository;

	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public Customer findByUsername(String username) {
		return customerRepository.findByUsername(username);
	}
	
	public Customer findByEmail(String email) {
		return customerRepository.findByEmail(email);
	}

	@Override
	public Customer save(CustomerDto customerDto) {
		Customer customer = new Customer();
		
		customer.setUsername(customerDto.getUserName());
		customer.setPassword(customerDto.getPassword());
	//	customer.setImage(customerDto.getImage());
		customer.setAddress(customerDto.getAddress());
		customer.setCustomerName(customerDto.getCustomerName());
		customer.setEmail(customerDto.getEmail());
		customer.setPhone(customerDto.getPhone());
		customer.setRoles(Arrays.asList(roleRepository.findByName("CUSTOMER")));
		customer.setActive(false);
		customer.setConfirmationCode(customerDto.getConfirmationCode());
		return customerRepository.save(customer);
	}

	@Override
	public Customer update(CustomerDto customerDto) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Customer saveCustomer(Customer customer) {
		return customerRepository.save(customer);
	}

	@Override
	public Customer changePass(CustomerDto customerDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CustomerDto getCustomer(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
