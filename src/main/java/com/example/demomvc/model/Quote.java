package com.example.demomvc.model;

import jakarta.persistence.*;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
@DiscriminatorColumn(name = "insurance_type")
@Table(name = "quotes")
public abstract class Quote {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long id;

    private Double amount;
    private String details;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToOne(mappedBy = "quote", cascade = CascadeType.ALL)
    private Contract contract;

    // Getters and Setters
}
