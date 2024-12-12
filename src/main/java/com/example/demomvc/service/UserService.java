package com.example.demomvc.service;

import com.example.demomvc.model.ActivityLog;
import com.example.demomvc.model.User;
import com.example.demomvc.repository.ActivityLogRepository;
import com.example.demomvc.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private ActivityLogRepository activityLogRepository;

    public User registerUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return userRepository.save(user);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public boolean authenticateUser(String email, String password) {
        User user = findByEmail(email);
        if (user != null) {
            return passwordEncoder.matches(password, user.getPassword());
        }
        return false;
    }

    public User findById(Long id) {
        Optional<User> userOptional = userRepository.findById(id);
        return userOptional.orElse(null);
    }
    public void registerActivity(User user, String action) {
        ActivityLog log = new ActivityLog();
        log.setAction(action);
        log.setTimestamp(LocalDateTime.now());
        log.setUser(user);
        activityLogRepository.save(log);
    }
}
