package com.example.demomvc.service;

import com.example.demomvc.model.User;
import com.example.demomvc.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public User registerUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        System.out.println("User details: " + user);
        return userRepository.save(user);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public boolean authenticateUser(String email, String password) {
        User user = findByEmail(email);
        if (user != null) {
            System.out.println("Mot de passe en base : " + user.getPassword());
            System.out.println("Mot de passe saisi : " + password);
            boolean isMatch = passwordEncoder.matches(password, user.getPassword());
            System.out.println("Les mots de passe correspondent : " + isMatch);
            return isMatch;
        }
        return false;
    }


}
