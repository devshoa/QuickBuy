package com.devmaster.Library.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.devmaster.Library.model.AddressCustomer;

@Repository
public interface AddressCustomerRepository extends JpaRepository<AddressCustomer, Integer>{

	@Query("SELECT pc FROM AddressCustomer pc WHERE pc.customer.customerID = ?1")
	List<AddressCustomer> findAddressByCustomerID(int customerID);
	
	@Query("SELECT pc FROM AddressCustomer pc WHERE pc.addressId = ?1 and pc.customer.customerID = ?2")
	AddressCustomer getAddressByAddressID(int addressID, int customerID);
	
}
