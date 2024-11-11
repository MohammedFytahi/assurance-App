// src/main/java/com/example/demomvc/controller/InsuranceController.java
package com.example.demomvc.controller;

import com.example.demomvc.model.HomeInsurance;
import com.example.demomvc.model.User;
import com.example.demomvc.service.QuoteService;
import com.example.demomvc.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/home-insurance")
public class InsuranceController {

    @Autowired
    private QuoteService quoteService;
    @Autowired
    private UserService userService;

    @GetMapping("/form")
    public String showHomeInsuranceForm(Model model) {
        model.addAttribute("homeInsurance", new HomeInsurance());
        return "homeInsuranceForm";
    }

    @PostMapping("/calculate")
    public String calculateHomeInsurance(
            @ModelAttribute("homeInsurance") HomeInsurance homeInsurance,
            HttpSession session,
            Model model) {

        // Retrieve the authenticated user from the session
        String userEmail = (String) session.getAttribute("user");
        User user = userService.findByEmail(userEmail); // Find user by email

        if (user != null) {
            homeInsurance.setUser(user); // Set the user in the HomeInsurance instance
        }

        // Log the property type for debugging
        System.out.println("Property Type: " + homeInsurance.getPropertyType());

        // Calculate the quote amount
        double quoteAmount = homeInsurance.calculateQuote();
        model.addAttribute("quoteAmount", quoteAmount);

        // Save the quote using the quoteService
        quoteService.saveQuote(homeInsurance); // Save the quote

        return "homeInsuranceResult"; // Return the view name for results
    }


}
