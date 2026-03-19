package com.example.CFS.controller;

import com.example.CFS.entity.Contract;
import com.example.CFS.entity.Crop;
import com.example.CFS.entity.User;
import com.example.CFS.repository.ContractRepository;
import com.example.CFS.repository.CropRepository;
import com.example.CFS.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class DashboardController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CropRepository cropRepository;

    @Autowired
    private ContractRepository contractRepository;

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        String role = (String) session.getAttribute("role");

        if (username == null) {
            return "redirect:/login";
        }

        Optional<User> userOpt = userRepository.findByUsername(username);
        if (userOpt.isPresent()) {
            User user = userOpt.get();
            if ("farmer".equals(role)) {
                List<Crop> listedCrops = cropRepository.findByFarmerId(user.getId());
                model.addAttribute("listedCrops", listedCrops);
            } else if ("buyer".equals(role)) {
                List<Contract> contracts = contractRepository.findByBuyerId(user.getId());
                List<Long> cropIds = new ArrayList<>();
                for (Contract c : contracts) {
                    cropIds.add(c.getCropId());
                }
                List<Crop> purchasedCrops = cropIds.isEmpty() ? new ArrayList<>() : cropRepository.findAllById(cropIds);
                model.addAttribute("purchasedCrops", purchasedCrops);
            }
        }

        return "dashboard";
    }
}
