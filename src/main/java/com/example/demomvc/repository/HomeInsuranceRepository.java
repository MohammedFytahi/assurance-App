package com.example.demomvc.repository;

import com.example.demomvc.model.HomeInsurance;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HomeInsuranceRepository extends JpaRepository<HomeInsurance, Long> {
}
