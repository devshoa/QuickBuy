package com.devmaster.Library.model;

import java.util.Collection;


import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "customer")
public class Customer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name = "customer_id")
	private int customerID;
	
	@Column(columnDefinition = "VARCHAR(50)", name = "user_name")
	private String username;

	@Column(columnDefinition = "VARCHAR(50)")
	private String password;

	private String image;
	
	@Column(name = "address_details")
	private String address;

	@Column(columnDefinition = "NVARCHAR(25)")
	private String customerName;

	@Column(columnDefinition = "VARCHAR(25)")
	private String email;

	@Column(columnDefinition = "VARCHAR(15)")
	private String phone;

	private String confirmationCode;
	
	private boolean active;

	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "customer_roles", joinColumns = @JoinColumn(name = "customer_id", referencedColumnName = "customer_id"),
    inverseJoinColumns = @JoinColumn(name = "role_id", referencedColumnName = "role_id"))
    private Collection<Role> roles;
}
