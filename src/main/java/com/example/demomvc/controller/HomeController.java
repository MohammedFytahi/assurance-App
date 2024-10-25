package com.example.demomvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class HomeController {

    @GetMapping("/home")
    public String home() {
        return "home"; // Affiche la vue home si l'utilisateur est connecté
    }
}
