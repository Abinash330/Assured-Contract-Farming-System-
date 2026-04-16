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
    public String adminDashboard(HttpSession session, Model model) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }
        long totalUsers = userRepository.count();
        long activeContracts = contractRepository.findAll().stream()
                .filter(c -> "Active".equalsIgnoreCase(c.getContractStatus()))
                .count();
        long completedContracts = contractRepository.findAll().stream()
                .filter(c -> "Completed".equalsIgnoreCase(c.getContractStatus()))
                .count();
        long disputedContracts = contractRepository.findAll().stream()
                .filter(c -> "Disputed".equalsIgnoreCase(c.getContractStatus()))
                .count();                
        long totalEscrowVolume = contractRepository.findAll().stream()
                .filter(c -> !"Cancelled".equalsIgnoreCase(c.getContractStatus()))
                .mapToLong(c -> c.getFinalPrice() != null ? c.getFinalPrice().longValue() : 0)
                .sum();
        long activeDisputes = disputeRepository.findAll().stream()
                .filter(d -> "OPEN".equalsIgnoreCase(d.getStatus()))
                .count();

        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("activeContracts", activeContracts);
        model.addAttribute("completedContracts", completedContracts);
        model.addAttribute("disputedContracts", disputedContracts);
        model.addAttribute("totalEscrowVolume", totalEscrowVolume);
        model.addAttribute("activeDisputes", activeDisputes);
        
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

            if (contract.getCropId() != null) {
                cropRepository.findById(contract.getCropId()).ifPresent(crop -> {
                    details.put("crop", crop);
                    if (crop.getFarmerId() != null) {
                        userRepository.findById(crop.getFarmerId()).ifPresent(farmer -> details.put("farmer", farmer));
                    }
                });
            }
            if (contract.getBuyerId() != null) {
                userRepository.findById(contract.getBuyerId()).ifPresent(buyer -> details.put("buyer", buyer));
            }

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

    @GetMapping("/admin/settings")
    public String systemSettings(HttpSession session, Model model) {
        if (!isAdmin(session)) {
            return "redirect:/login";
        }
        // Serve the static platform settings view
        return "admin/system_settings";
    }

    // --- NEW ADMINISTRATIVE CRUD ENDPOINTS ---

    @PostMapping("/admin/users/update")
    public String updateUser(@RequestParam Long userId, @RequestParam String username, @RequestParam String email, @RequestParam String role, @RequestParam String kycStatus, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        userRepository.findById(userId).ifPresent(user -> {
            user.setUsername(username);
            user.setEmail(email);
            user.setRole(role);
            user.setKycStatus(kycStatus);
            if("APPROVED".equals(kycStatus)) user.setVerified(true);
            else if("REJECTED".equals(kycStatus)) user.setVerified(false);
            userRepository.save(user);
        });
        return "redirect:/admin/users";
    }

    @PostMapping("/admin/contracts/update")
    public String updateContract(@RequestParam Long contractId, @RequestParam String contractStatus, @RequestParam String paymentStatus, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        contractRepository.findById(contractId).ifPresent(contract -> {
            contract.setContractStatus(contractStatus);
            contract.setPaymentStatus(paymentStatus);
            contractRepository.save(contract);
        });
        return "redirect:/admin/contracts";
    }

    @PostMapping("/admin/contracts/delete")
    public String deleteContract(@RequestParam Long contractId, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        contractRepository.deleteById(contractId);
        return "redirect:/admin/contracts";
    }

    @PostMapping("/admin/disputes/update")
    public String updateDispute(@RequestParam Long disputeId, @RequestParam String status, @RequestParam String resolution, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        disputeRepository.findById(disputeId).ifPresent(dispute -> {
            dispute.setStatus(status);
            // Assuming we append admin resolution notes to the existing reason for now to keep schema simple
            if(resolution != null && !resolution.trim().isEmpty()) {
               dispute.setReason(dispute.getReason() + " | ADMIN RESOLUTION: " + resolution);
            }
            disputeRepository.save(dispute);
        });
        return "redirect:/admin/disputes";
    }

    @PostMapping("/admin/disputes/delete")
    public String deleteDispute(@RequestParam Long disputeId, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        disputeRepository.deleteById(disputeId);
        return "redirect:/admin/disputes";
    }
}
