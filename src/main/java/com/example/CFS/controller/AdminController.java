package com.example.CFS.controller;

import com.example.CFS.entity.Contract;
import com.example.CFS.entity.Dispute;
import com.example.CFS.entity.User;
import com.example.CFS.repository.ContractRepository;
import com.example.CFS.repository.CropRepository;
import com.example.CFS.repository.DisputeRepository;
import com.example.CFS.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Controller
public class AdminController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ContractRepository contractRepository;

    @Autowired
    private CropRepository cropRepository;

    @Autowired
    private DisputeRepository disputeRepository;

    private boolean isAdmin(HttpSession session) {
        return "admin".equals(session.getAttribute("role"));
    }

    @GetMapping("/admin/dashboard")
    public String adminDashboard(HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }
        return "admin/admin_dashboard";
    }

    @GetMapping("/admin/users")
    public String manageUsers(HttpSession session, Model model) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "admin/manage_users";
    }

    @PostMapping("/admin/users/delete")
    public String deleteUser(@RequestParam Long userId, HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }
        userRepository.deleteById(userId);
        return "redirect:/admin/users";
    }

    @PostMapping("/admin/users/approve-kyc")
    public String approveKyc(@RequestParam Long userId, HttpSession session) {
        if (!isAdmin(session))
            return "redirect:/login";
        userRepository.findById(userId).ifPresent(user -> {
            user.setKycStatus("APPROVED");
            user.setVerified(true);
            userRepository.save(user);
        });
        return "redirect:/admin/users";
    }

    @PostMapping("/admin/users/reject-kyc")
    public String rejectKyc(@RequestParam Long userId, HttpSession session) {
        if (!isAdmin(session))
            return "redirect:/login";
        userRepository.findById(userId).ifPresent(user -> {
            user.setKycStatus("REJECTED");
            user.setVerified(false);
            userRepository.save(user);
        });
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/contracts")
    public String manageContracts(HttpSession session, Model model) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }

        List<Contract> contracts = contractRepository.findAll();
        List<Map<String, Object>> contractDetailsList = new ArrayList<>();

        for (Contract contract : contracts) {
            Map<String, Object> details = new HashMap<>();
            details.put("contract", contract);

            cropRepository.findById(contract.getCropId()).ifPresent(crop -> {
                details.put("crop", crop);
                userRepository.findById(crop.getFarmerId()).ifPresent(farmer -> details.put("farmer", farmer));
            });
            userRepository.findById(contract.getBuyerId()).ifPresent(buyer -> details.put("buyer", buyer));

            contractDetailsList.add(details);
        }

        model.addAttribute("contractDetailsList", contractDetailsList);
        return "admin/manage_contracts";
    }

    @GetMapping("/admin/disputes")
    public String manageDisputes(HttpSession session, Model model) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }
        List<Dispute> disputes = disputeRepository.findAll();
        model.addAttribute("disputes", disputes);
        return "admin/manage_disputes";
    }
}
