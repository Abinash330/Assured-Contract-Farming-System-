package com.example.CFS.controller;

import com.example.CFS.entity.Contract;
import com.example.CFS.entity.TraceabilityLog;
import com.example.CFS.repository.ContractRepository;
import com.example.CFS.repository.TraceabilityLogRepository;
import com.example.CFS.service.EscrowService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.time.format.DateTimeFormatter;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/traceability")
public class TraceabilityController {

    @Autowired
    private TraceabilityLogRepository traceabilityLogRepository;

    @Autowired
    private ContractRepository contractRepository;

    @Autowired
    private EscrowService escrowService;

    public void addTraceabilityLog(Long contractId, String stage, String details) {
        TraceabilityLog log = new TraceabilityLog();
        log.setContractId(contractId);
        log.setStage(stage);
        log.setDetails(details);
        // Simulate blockchain hash
        try {
            String rawData = contractId + stage + System.currentTimeMillis();
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(rawData.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder(2 * hash.length);
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            log.setBlockchainHash("0x" + hexString.toString().substring(0, 32));
        } catch (Exception e) {
            log.setBlockchainHash("HASH_ERROR");
        }
        traceabilityLogRepository.save(log);
    }

    @GetMapping("/contract/{id}")
    public String viewTraceability(@PathVariable("id") Long contractId, Model model, HttpSession session) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }
        Optional<Contract> contractOpt = contractRepository.findById(contractId);
        if (contractOpt.isPresent()) {
            Contract contract = contractOpt.get();
            List<TraceabilityLog> logs = traceabilityLogRepository.findByContractIdOrderByTimestampDesc(contractId);
            model.addAttribute("contract", contract);
            model.addAttribute("traceabilityLogs", logs);
            return "inspector/view_traceability";
        }
        return "redirect:/contracts";
    }

    @PostMapping("/simulate/timely-delivery")
    public String simulateTimelyDelivery(@RequestParam("contract_id") Long contractId, HttpSession session) {
        if (!"admin".equals(session.getAttribute("role")) && !"inspector".equals(session.getAttribute("role"))) return "redirect:/login";
        
        Optional<Contract> contractOpt = contractRepository.findById(contractId);
        if (contractOpt.isPresent()) {
            Contract contract = contractOpt.get();
            contract.setActualDeliveryDate(contract.getDeliveryDeadline());
            contract.setQualityRating(100);
            contract.setContractStatus("Completed");
            contract.setPaymentStatus("Paid");
            contractRepository.save(contract);
            
            // Release escrow to farmer
            // For simulation, we assume escrowService.releaseEscrow works
            addTraceabilityLog(contractId, "Delivered", "Timely delivery met. Top quality confirmed.");
            addTraceabilityLog(contractId, "Payment Released", "Escrow 100% released to farmer.");
        }
        return "redirect:/admin/contracts?success=TimelyDeliverySimulated";
    }

    @PostMapping("/simulate/delayed-delivery")
    public String simulateDelayedDelivery(@RequestParam("contract_id") Long contractId, HttpSession session) {
        if (!"admin".equals(session.getAttribute("role")) && !"inspector".equals(session.getAttribute("role"))) return "redirect:/login";
        
        Optional<Contract> contractOpt = contractRepository.findById(contractId);
        if (contractOpt.isPresent()) {
            Contract contract = contractOpt.get();
            contract.setActualDeliveryDate("2026-12-31"); // Simulated delay
            contract.setQualityRating(90);
            contract.setPenaltyAmount(contract.getFinalPrice() * 0.10); // 10% penalty
            contract.setFinalPrice(contract.getFinalPrice() - contract.getPenaltyAmount());
            contract.setContractStatus("Completed_With_Penalty");
            contract.setPaymentStatus("Paid_Partial");
            contractRepository.save(contract);
            
            addTraceabilityLog(contractId, "Delivered (Delayed)", "Delivery arrived past deadline. 10% Penalty applied.");
            addTraceabilityLog(contractId, "Payment Released", "Escrow released to farmer minus penalty.");
        }
        return "redirect:/admin/contracts?warning=DelayedDeliverySimulated";
    }

    @PostMapping("/simulate/quality-degradation")
    public String simulateQualityDegradation(@RequestParam("contract_id") Long contractId, HttpSession session) {
        if (!"admin".equals(session.getAttribute("role")) && !"inspector".equals(session.getAttribute("role"))) return "redirect:/login";

        Optional<Contract> contractOpt = contractRepository.findById(contractId);
        if (contractOpt.isPresent()) {
            Contract contract = contractOpt.get();
            contract.setActualDeliveryDate(contract.getDeliveryDeadline());
            contract.setQualityRating(50); // Poor quality
            contract.setPenaltyAmount(contract.getFinalPrice() * 0.40); // 40% penalty
            contract.setFinalPrice(contract.getFinalPrice() - contract.getPenaltyAmount());
            contract.setContractStatus("Completed_Quality_Adjusted");
            contract.setPaymentStatus("Paid_Adjusted");
            contractRepository.save(contract);

            addTraceabilityLog(contractId, "Quality Checked", "Quality standard failed. Rating: 50/100. 40% Price reduction applied.");
            addTraceabilityLog(contractId, "Payment Released", "Escrow partially released to farmer. Remaining refunded to buyer.");
        }
        return "redirect:/admin/contracts?danger=QualityIssueSimulated";
    }
}
