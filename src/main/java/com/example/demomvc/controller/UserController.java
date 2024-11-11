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

        @GetMapping("/register")
        public String showRegistrationForm(Model model) {
            model.addAttribute("user", new User());
            return "register";
        }

        @PostMapping("/register")
        public String registerUser(@ModelAttribute("user") User user) {
            userService.registerUser(user);
            return "redirect:/login";
        }

        @GetMapping("/login")
        public String showLoginForm(Model model) {
            model.addAttribute("user", new User());
            return "login";
        }

        @PostMapping("/login")
        public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {
            if (userService.authenticateUser(email, password)) {
                session.setAttribute("user", email); // Set the user attribute in session
                return "redirect:/home"; // Redirect to home or dashboard after login
            } else {
                model.addAttribute("error", true);
                return "login"; // Show login page with error
            }
        }


        @PostMapping("/logout")
        public String logout(HttpSession session) {
            session.invalidate(); // Invalidate the session to log out the user
            return "redirect:/login"; // Redirect to the login page
        }

    }
