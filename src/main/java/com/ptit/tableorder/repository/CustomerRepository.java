package com.ptit.tableorder.repository;

import com.ptit.tableorder.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
}
