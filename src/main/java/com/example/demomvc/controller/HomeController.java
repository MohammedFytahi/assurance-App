package com.example.demomvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {


        @GetMapping("/home")
        public String showHomePage() {
            return "home";  // Render the home page after successful login
        }
}
