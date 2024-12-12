package com.service;

import com.entity.Devis;
import com.entity.HealthInsurance;
import com.entity.CarInsurance;
import com.entity.HomeInsurance;
import com.repository.InsuranceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.Assurance.enums.Status;

@Service
public class InsuranceService {

    @Autowired
    private InsuranceRepository insuranceRepository;

    // Calcul du premium pour l'assurance automobile
    private double calculateCarInsurancePremium(CarInsurance carInsurance) {
        double premiumBase = 500; // Base premium
        if (carInsurance.getAge() < 25) premiumBase += premiumBase * 0.10;
        if ("luxe".equalsIgnoreCase(carInsurance.getVehicleType())) premiumBase += premiumBase * 0.15;
        if ("professionnelle".equalsIgnoreCase(carInsurance.getVehicleUsing())) premiumBase += premiumBase * 0.10;
        if ("no accidents".equalsIgnoreCase(carInsurance.getDriverHistory())) premiumBase -= premiumBase * 0.20;
        else premiumBase += premiumBase * 0.10;
        return premiumBase;
    }

    // Calcul du premium pour l'assurance habitation
    private double calculateHomeInsurancePremium(HomeInsurance homeInsurance) {
        double premiumBase = 300; // Base premium
        if ("maison".equalsIgnoreCase(homeInsurance.getAssetType())) premiumBase += premiumBase * 0.02;
        if ("zone à risque".equalsIgnoreCase(homeInsurance.getLocalization())) premiumBase += premiumBase * 0.05;
        if (homeInsurance.getAssetValue() > 200000) premiumBase += premiumBase * 0.10;
        if (homeInsurance.IsSecuritySystem()) premiumBase -= premiumBase * 0.15;
        else premiumBase += premiumBase * 0.15;
        return premiumBase;
    }

    // Calcul du premium pour l'assurance santé
    private double calculateHealthInsurancePremium(HealthInsurance healthInsurance) {
        double premiumBase = 150; // Base premium
        if (healthInsurance.getAge() > 60) premiumBase += premiumBase * 0.20;
        if ("chronic illness".equalsIgnoreCase(healthInsurance.getHealthStatus())) premiumBase += premiumBase * 0.30;
        if ("basic".equalsIgnoreCase(healthInsurance.getTypeCoverage())) premiumBase -= premiumBase * 0.10;
        else if ("premium".equalsIgnoreCase(healthInsurance.getTypeCoverage())) premiumBase += premiumBase * 0.05;
        return premiumBase;
    }

    // Sauvegarder l'assurance habitation et générer le devis
    public int saveHomeInsurance(HomeInsurance homeInsurance) {
        // Sauvegarder l'assurance habitation d'abord
        insuranceRepository.save(homeInsurance);

        // Créer et configurer le devis
        Devis devis = new Devis();
        devis.setPremiumBase(300);
        devis.setPremiumTotal(calculateHomeInsurancePremium(homeInsurance));
        devis.setStatus(Status.PENDING);
        devis.setHomeInsurance(homeInsurance);

        // Lier le devis à l'assurance habitation
        homeInsurance.setDevis(devis);

        // Sauvegarder le devis
        insuranceRepository.save(devis);

        // Retourner l'ID du devis
        return devis.getId();
    }

    // Sauvegarder l'assurance automobile et générer le devis
    public int saveCarInsurance(CarInsurance carInsurance) {
        // Sauvegarder l'assurance automobile d'abord
        insuranceRepository.save(carInsurance);

        // Créer et configurer le devis
        Devis devis = new Devis();
        devis.setPremiumBase(500);
        devis.setPremiumTotal(calculateCarInsurancePremium(carInsurance));
        devis.setStatus(Status.PENDING);
        devis.setCarInsurance(carInsurance);

        // Lier le devis à l'assurance automobile
        carInsurance.setDevis(devis);

        // Sauvegarder le devis
        insuranceRepository.save(devis);

        // Retourner l'ID du devis
        return devis.getId();
    }

    // Sauvegarder l'assurance santé et générer le devis
    public int saveHealthInsurance(HealthInsurance healthInsurance) {
        // Sauvegarder l'assurance santé d'abord
        insuranceRepository.save(healthInsurance);

        // Créer et configurer le devis
        Devis devis = new Devis();
        devis.setPremiumBase(150);
        devis.setPremiumTotal(calculateHealthInsurancePremium(healthInsurance));
        devis.setStatus(Status.PENDING);
        devis.setHealthInsurance(healthInsurance);

        // Lier le devis à l'assurance santé
        healthInsurance.setDevis(devis);

        // Sauvegarder le devis
        insuranceRepository.save(devis);

        // Retourner l'ID du devis
        return devis.getId();
    }

    // Mettre à jour une assurance
    public void updateInsurance(Object insurance) {
        insuranceRepository.update(insurance);
    }

    // Supprimer une assurance
    public void deleteInsurance(Object insurance) {
        insuranceRepository.delete(insurance);
    }
}
