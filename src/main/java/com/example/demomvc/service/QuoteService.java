package com.example.demomvc.service;

import com.example.demomvc.model.HomeInsurance;
import com.example.demomvc.repository.HomeInsuranceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class QuoteService {

    @Autowired
    private HomeInsuranceRepository homeInsuranceRepository; // Assurez-vous d'avoir ce repository

    @Transactional
    public void saveQuote(HomeInsurance homeInsurance) {
        homeInsuranceRepository.save(homeInsurance);
    }
}
