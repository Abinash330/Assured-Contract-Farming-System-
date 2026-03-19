package com.example.CFS.controller;

import com.example.CFS.entity.User;
import com.example.CFS.entity.Wallet;
import com.example.CFS.repository.UserRepository;
import com.example.CFS.service.WalletService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/profile")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private WalletService walletService;

    @GetMapping
    public String showProfile(HttpSession session, Model model,
            @RequestParam(value = "action", required = false) String action) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }

        Long userId = (Long) session.getAttribute("userId");
        Optional<User> uOpt = userRepository.findById(userId);

        if (uOpt.isPresent()) {
            User user = uOpt.get();
            model.addAttribute("user", user);
            model.addAttribute("isEditing", "edit".equals(action));

            Wallet wallet = walletService.getWalletByUserId(userId);
            model.addAttribute("wallet", wallet);
        }

        return "profile";
    }

    @PostMapping
    public String updateProfile(@RequestParam String username,
            @RequestParam String address,
            HttpSession session,
            Model model) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }

        Long userId = (Long) session.getAttribute("userId");
        Optional<User> uOpt = userRepository.findById(userId);

        if (uOpt.isPresent()) {
            User user = uOpt.get();
            user.setUsername(username);
            user.setAddress(address);
            userRepository.save(user);

            session.setAttribute("username", username);
            model.addAttribute("message", "Profile updated successfully!");
            model.addAttribute("user", user);
            model.addAttribute("isEditing", false);
        }

        return "profile";
    }

    @PostMapping("/add-funds")
    public String addFunds(@RequestParam Double amount, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId != null && amount != null && amount > 0) {
            walletService.addFunds(userId, amount);
        }
        return "redirect:/profile";
    }
}
