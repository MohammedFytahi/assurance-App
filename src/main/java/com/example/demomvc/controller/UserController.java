    package com.example.demomvc.controller;

    import com.example.demomvc.model.User;
    import com.example.demomvc.repository.UserRepository;
    import com.example.demomvc.service.UserService;
    import jakarta.servlet.http.HttpSession;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Controller;
    import org.springframework.ui.Model;
    import org.springframework.web.bind.annotation.GetMapping;
    import org.springframework.web.bind.annotation.ModelAttribute;
    import org.springframework.web.bind.annotation.PostMapping;
    import org.springframework.web.bind.annotation.RequestParam;

    import java.util.List;

    @Controller
    public class UserController {

        @Autowired
        private UserService userService;

        @Autowired
        private UserRepository userRepository;

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
                User user = userService.findByEmail(email);
                session.setAttribute("user", user);

                 userService.registerActivity(user, "Connexion réussie");

                return "redirect:/home"; // Redirige vers la page d'accueil
            } else {
                model.addAttribute("error", "Email ou mot de passe incorrect");
                return "login";
            }
        }

        @PostMapping("/logout")
        public String logout(HttpSession session) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                // Enregistrer l'activité de déconnexion
                userService.registerActivity(user, "Déconnexion réussie");
            }
            session.invalidate(); // Invalider la session
            return "redirect:/login"; // Redirige vers la page de connexion
        }

        @GetMapping("/admin/activity")
        public String viewUserActivities(Model model) {
            List<User> users = userRepository.findAll();
            model.addAttribute("users", users);
            return "activity_log";
        }

    }
