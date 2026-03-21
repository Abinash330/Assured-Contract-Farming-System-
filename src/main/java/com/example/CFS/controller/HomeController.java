package com.example.CFS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "redirect:/index.html";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }

    @PostMapping("/submit-contact")
    public String submitContact() {
        // In a real application, this would save to DB or send an email.
        // We will simulate success by redirecting with a query parameter.
        return "redirect:/contact?success=true";
    }

    @GetMapping("/privacy")
    public String privacy() {
        return "privacy_policy";
    }
}
