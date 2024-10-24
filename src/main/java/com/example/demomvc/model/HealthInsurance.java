package com.example.demomvc.model;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("HEALTH_INSURANCE")
public class HealthInsurance extends Quote {
    private int age;
    private boolean hasChronicDiseases;
    private String coverageType;

    // Getters and Setters
}
