package com.ejada.springbootecommerce.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ejada.springbootecommerce.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
	
}
