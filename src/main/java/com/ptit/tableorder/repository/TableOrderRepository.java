package com.ptit.tableorder.repository;

import com.ptit.tableorder.model.TableOrder;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Set;

public interface TableOrderRepository extends JpaRepository<TableOrder, Long> {
    @Query("SELECT e from TableOrder e where e.tables.id = :id")
    List<TableOrder> findByTableId(Long id);
}
