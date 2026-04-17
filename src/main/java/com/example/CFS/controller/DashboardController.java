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
import java.util.stream.Collectors;

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

                List<Long> cropIds = listedCrops.stream().map(Crop::getId).collect(Collectors.toList());
                List<Contract> contracts = cropIds.isEmpty() ? new ArrayList<>() : contractRepository.findByCropIdIn(cropIds);
                
                long pendingContractsCount = contracts.stream()
                        .filter(c -> "Pending".equalsIgnoreCase(c.getContractStatus()))
                        .count();
                
                double walletBalance = contracts.stream()
                        .filter(c -> "Completed".equalsIgnoreCase(c.getContractStatus()) || "Paid".equalsIgnoreCase(c.getPaymentStatus()))
                        .mapToDouble(c -> c.getFinalPrice() != null ? c.getFinalPrice() : 0.0)
                        .sum();

                model.addAttribute("pendingContractsCount", pendingContractsCount);
                model.addAttribute("walletBalance", String.format("%.2f", walletBalance));
            } else if ("buyer".equals(role)) {
                List<Contract> contracts = contractRepository.findByBuyerId(user.getId());
                List<Long> cropIds = new ArrayList<>();
                double totalSpend = 0.0;
                for (Contract c : contracts) {
                    cropIds.add(c.getCropId());
                    totalSpend += (c.getFinalPrice() != null) ? c.getFinalPrice() : 0.0;
                }
                
                // Format total spend into Lakhs for professional display
                double spendLakhs = totalSpend / 100000.0;
                model.addAttribute("ytdSpend", String.format("%.2f", spendLakhs));
                
                // Simulate progressive trajectory based on real final volume
                String chartData = String.format("[%.1f, %.1f, %.1f, %.1f, %.1f, %.1f]", 
                    spendLakhs * 0.2, spendLakhs * 0.35, spendLakhs * 0.45, 
                    spendLakhs * 0.7, spendLakhs * 0.85, spendLakhs);
                model.addAttribute("chartData", chartData);
                
                List<Crop> purchasedCrops = cropIds.isEmpty() ? new ArrayList<>() : cropRepository.findAllById(cropIds);
                model.addAttribute("purchasedCrops", purchasedCrops);
                
            } else if ("inspector".equals(role)) {
                // Fetch all contracts that are currently Accepted and thus require Quality Assurance
                List<Contract> allContracts = contractRepository.findAll();
                List<Contract> pendingInspections = new ArrayList<>();
                for(Contract c : allContracts) {
                    if("Accepted".equalsIgnoreCase(c.getContractStatus())) {
                        pendingInspections.add(c);
                    }
                }
                model.addAttribute("pendingInspections", pendingInspections);
            }
        }

        if ("farmer".equals(role)) return "farmer/dashboard";
        if ("buyer".equals(role)) return "buyer/dashboard";
        if ("inspector".equals(role)) return "inspector/dashboard";

        return "dashboard";
    }
    @GetMapping("/buyer/insights")
    public String showBuyerInsights(HttpSession session, Model model) {
        String role = (String) session.getAttribute("role");
        if (role == null || !"buyer".equals(role)) {
            return "redirect:/login";
        }
        
        List<Crop> allCrops = cropRepository.findAll();
        
        // Calculate aggregations
        long totalCereals = allCrops.stream().filter(c -> {
            String nm = (c.getCropName() != null) ? c.getCropName().toLowerCase() : "";
            return nm.contains("paddy") || nm.contains("wheat") || nm.contains("maize");
        }).count();
        
        long totalPulses = allCrops.stream().filter(c -> {
            String nm = (c.getCropName() != null) ? c.getCropName().toLowerCase() : "";
            return nm.contains("dal") || nm.contains("gram");
        }).count();
        
        long totalBiomass = allCrops.stream().filter(c -> "Wastage/Byproduct".equalsIgnoreCase(c.getProductCategory())).count();
        
        double avgPrice = allCrops.stream().filter(c -> c.getPricePerUnit() != null)
                                   .mapToDouble(Crop::getPricePerUnit).average().orElse(0.0);
                                   
        long totalAvailableVolume = allCrops.stream()
                                     .filter(c -> "Available".equalsIgnoreCase(c.getStatus()))
                                     .mapToLong(c -> c.getQuantity() != null ? c.getQuantity() : 0)
                                     .sum();
        
        model.addAttribute("totalCereals", totalCereals);
        model.addAttribute("totalPulses", totalPulses);
        model.addAttribute("totalBiomass", totalBiomass);
        model.addAttribute("avgPrice", Math.round(avgPrice));
        model.addAttribute("totalVolume", totalAvailableVolume);
        
        return "buyer/insights";
    }
}
