package com.ptit.tableorder.model;

import lombok.Data;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Table(name = "tables")
public class Tables {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "desk_amount")
    private int deskAmount;

    @Column(name = "status")
    private int status;

    @OneToMany(fetch = FetchType.LAZY)
    private Set<TableOrder> tableOrders = new HashSet<>();
}
