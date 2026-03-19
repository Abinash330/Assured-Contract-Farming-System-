package com.example.CFS.controller;

import com.example.CFS.entity.Insurance;
import com.example.CFS.repository.InsuranceRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/insurance")
public class InsuranceController {

    @Autowired
    private InsuranceRepository insuranceRepository;

    @PostMapping("/buy")
    public String buyInsurance(@RequestParam("contract_id") Long contractId, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null)
            return "redirect:/login";

        Insurance insurance = new Insurance();
        insurance.setContractId(contractId);
        insurance.setPremiumAmount(500.0); // Flat premium for demo purposes
        insuranceRepository.save(insurance);

        return "redirect:/contracts?success=Insurance+Purchased";
    }

    @PostMapping("/claim")
    public String claimInsurance(@RequestParam("contract_id") Long contractId,
            @RequestParam("reason") String reason,
            HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null)
            return "redirect:/login";

        Optional<Insurance> iOpt = insuranceRepository.findByContractId(contractId);
        if (iOpt.isPresent()) {
            Insurance ins = iOpt.get();
            ins.setClaimStatus("FILED");
            ins.setClaimReason(reason);
            insuranceRepository.save(ins);
        }
        return "redirect:/contracts?success=Claim+Filed";
    }
}
