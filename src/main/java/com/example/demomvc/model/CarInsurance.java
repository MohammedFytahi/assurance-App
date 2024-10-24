package com.example.demomvc.model;

import jakarta.persistence.DiscriminatorValue;
import jakarta.persistence.Entity;

@Entity
@DiscriminatorValue("CAR_INSURANCE")
public class CarInsurance extends Quote {
    private String vehicleModel;
    private String vehicleBrand;
    private String vehicleType;
    private int driverAge;
    private boolean hasAccidents;

    // Getters and Setters
}
