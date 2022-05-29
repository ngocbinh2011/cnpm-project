package com.ptit.tableorder.repository;


import com.ptit.tableorder.model.Tables;
import org.springframework.data.jpa.repository.JpaRepository;


public interface TableRepository extends JpaRepository<Tables, Long> {
}
