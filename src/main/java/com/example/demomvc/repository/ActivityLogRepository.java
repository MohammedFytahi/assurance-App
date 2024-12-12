package com.example.demomvc.repository;

import com.example.demomvc.model.ActivityLog;
import com.example.demomvc.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ActivityLogRepository extends JpaRepository<ActivityLog, Long> {
    List<ActivityLog> findByUser(User user);
}

