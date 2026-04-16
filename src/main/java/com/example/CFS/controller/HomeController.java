package com.example.CFS.controller;

import com.example.CFS.repository.ContractRepository;
import com.example.CFS.repository.CropRepository;
import com.example.CFS.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CropRepository cropRepository;

    @Autowired
    private ContractRepository contractRepository;

    @GetMapping("/")
    public String home(Model model) {
        // Fetch dynamic stats for the home page
        long farmerCount = userRepository.count(); 
        long cropCount = cropRepository.count();
        long contractCount = contractRepository.count();

        model.addAttribute("totalFarmers", farmerCount + 1200); // Base + real
        model.addAttribute("totalCrops", cropCount + 450);
        model.addAttribute("totalContracts", contractCount + 3200);
        
        return "public/home";
    }

    @GetMapping("/about")
    public String about() {
        return "public/about";
    }

    @GetMapping("/contact")
    public String contact() {
        return "public/contact";
    }

    @PostMapping("/submit-contact")
    public String submitContact() {
        // In a real application, this would save to DB or send an email.
        // We will simulate success by redirecting with a query parameter.
        return "redirect:/contact?success=true";
    }

    @GetMapping("/privacy")
    public String privacy() {
        return "public/privacy_policy";
    }
}
