package com.example.demomvc.model;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("HOME_INSURANCE")
public class HomeInsurance extends Quote {
    private double propertyValue;
    private String propertyType;
    private boolean isInRiskZone;
    private boolean hasSecuritySystem;

    // Getters and Setters
}
