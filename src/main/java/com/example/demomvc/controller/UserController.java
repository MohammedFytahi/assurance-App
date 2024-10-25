package com.example.demomvc.controller;

import com.example.demomvc.model.User;
import com.example.demomvc.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    // Affiche le formulaire d'inscription
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    // Gère l'enregistrement de l'utilisateur
    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") User user) {
        userService.registerUser(user);
        return "redirect:/loginForm";
    }

    // Affiche le formulaire de connexion
    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, Model model, HttpSession session) {
        User user = userService.findByEmail(email);

        if (user != null && userService.authenticateUser(email, password)) {
            session.setAttribute("loggedInUser", user); // Stocke l'utilisateur dans la session
            return "redirect:/home"; // Redirige vers la page d'accueil si authentifié
        } else {
            model.addAttribute("error", "Invalid email or password"); // Affiche un message d'erreur
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalide la session
        return "redirect:/loginForm"; // Redirige vers la page de connexion
    }


}
