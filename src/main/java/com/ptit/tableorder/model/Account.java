package com.ptit.tableorder.model;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;

@Data
@Entity
@Table(name = "account")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "role")
    private String role;

    @Column(name = "created_date")
    private LocalDate createdDate = LocalDate.now();

    @OneToOne(mappedBy = "account", fetch = FetchType.LAZY)
    private Customer customer;

    public void setRole(Role role){
        this.role = role.name();
    }

}
