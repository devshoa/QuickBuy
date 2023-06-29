package com.devmaster.Customer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication(scanBasePackages = {"com.devmaster.Library.*", "com.devmaster.Customer.*"})
@EnableJpaRepositories(value = "com.devmaster.Library.repository")
@EntityScan(value = "com.devmaster.Library.model")
public class CustomerApplication {

	public static void main(String[] args) {
		SpringApplication.run(CustomerApplication.class, args);
	}

}
