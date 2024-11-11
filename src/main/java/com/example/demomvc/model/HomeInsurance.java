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


        public void setUser(User user) {
            super.setUser(user); // Call the superclass method
        }
        public String getPropertyType() {
            return propertyType;
        }

        public void setPropertyType(String propertyType) {
            this.propertyType = propertyType;
        }

        public double getPropertyValue() {
            return propertyValue;
        }

        public void setPropertyValue(double propertyValue) {
            this.propertyValue = propertyValue;
        }
        public double calculateQuote() {
            double basePrice = 300.0;


            if (propertyType.equalsIgnoreCase("maison")) {
                basePrice += basePrice * 0.02;
            }


            if (isInRiskZone) {
                basePrice += basePrice * 0.05;
            }


            if (propertyValue > 200000) {
                basePrice += basePrice * 0.10;
            }


            if (hasSecuritySystem) {
                basePrice -= basePrice * 0.15;
            } else {
                basePrice += basePrice * 0.15;
            }


            setAmount(basePrice);

            return basePrice;
        }
    }
