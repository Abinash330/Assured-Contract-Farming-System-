package com.example.CFS.controller;

import com.example.CFS.entity.User;
import com.example.CFS.repository.UserRepository;
import com.example.CFS.service.WalletService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.mindrot.jbcrypt.BCrypt;

import java.security.SecureRandom;
import java.util.Optional;

@Controller
public class AuthController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private WalletService walletService;

    @GetMapping("/login")
    public String showLoginForm() {
        return "public/login";
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        Optional<User> userOpt = userRepository.findByEmail(email);

        if (userOpt.isPresent()) {
            User user = userOpt.get();
            boolean passwordMatch = false;

            if (user.getPassword().startsWith("$2a$") || user.getPassword().startsWith("$2b$")) {
                passwordMatch = BCrypt.checkpw(password, user.getPassword());
            } else {
                passwordMatch = user.getPassword().equals(password);
                if (passwordMatch) {
                    user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
                    userRepository.save(user);
                }
            }

            if (passwordMatch) {
                // Set explicit HttpSession values (Legacy Support)
                session.setAttribute("userId", user.getId());
                session.setAttribute("username", user.getUsername());
                session.setAttribute("email", user.getEmail());
                session.setAttribute("role", user.getRole());
                
                // Inject into Spring Security Context (New Standard Protocol)
                com.example.CFS.security.CustomUserDetails userDetails = new com.example.CFS.security.CustomUserDetails(user);
                org.springframework.security.authentication.UsernamePasswordAuthenticationToken auth = 
                    new org.springframework.security.authentication.UsernamePasswordAuthenticationToken(
                        userDetails, null, userDetails.getAuthorities()
                    );
                org.springframework.security.core.context.SecurityContextHolder.getContext().setAuthentication(auth);
                // Important: Spring Security needs the context properly persisted into the session explicitly when using manual injections in Spring Boot 3+ filter chains
                session.setAttribute(org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, org.springframework.security.core.context.SecurityContextHolder.getContext());

                if ("admin".equalsIgnoreCase(user.getRole())) {
                    return "redirect:/admin/dashboard";
                }
                return "redirect:/dashboard";
            }
        }

        model.addAttribute("error", "Invalid credentials.");
        return "public/login";
    }

    @GetMapping("/register")
    public String showRegisterForm() {
        return "public/register";
    }

    @PostMapping("/register")
    public String registerUser(@RequestParam String username,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String role,
            @RequestParam String address,
            @RequestParam(required = false) String aadhaarNumber,
            @RequestParam(required = false) String panNumber,
            Model model) {

        if (userRepository.findByEmail(email).isPresent()) {
            model.addAttribute("error", "This email is already registered. Please log in or use another email.");
            return "public/register";
        }

        User newUser = new User();
        newUser.setUsername(username);
        newUser.setEmail(email);
        newUser.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
        newUser.setRole(role);
        newUser.setAddress(address);
        newUser.setAadhaarNumber(aadhaarNumber);
        newUser.setPanNumber(panNumber);

        userRepository.save(newUser);

        // Auto-create wallet for new user
        walletService.createWalletForUser(newUser.getId());

        model.addAttribute("message", "Registration successful! You can now log in.");
        return "public/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/forgot_password")
    public String showForgotPasswordForm() {
        return "public/forgot_password";
    }

    @PostMapping("/forgot_password")
    public String processForgotPassword(@RequestParam String email, Model model) {
        Optional<User> userOpt = userRepository.findByEmail(email);

        if (userOpt.isPresent()) {
            User user = userOpt.get();

            // Generate a temporary 8-character password
            String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#$%&";
            SecureRandom random = new SecureRandom();
            StringBuilder tempPasswordBuilder = new StringBuilder();
            for (int i = 0; i < 8; i++) {
                tempPasswordBuilder.append(characters.charAt(random.nextInt(characters.length())));
            }
            String tempPassword = tempPasswordBuilder.toString();

            // Update the user's password in the database
            user.setPassword(BCrypt.hashpw(tempPassword, BCrypt.gensalt()));
            userRepository.save(user);

            model.addAttribute("message", "A temporary password has been set. Please check your email.");
            model.addAttribute("tempPassword", tempPassword); // Expose to alert box logic for demo purposes
            model.addAttribute("email", email);
        } else {
            model.addAttribute("message", "No account found with this email.");
        }

        return "public/forgot_password";
    }
}
