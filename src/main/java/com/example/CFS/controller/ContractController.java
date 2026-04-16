package com.example.CFS.controller;

import com.example.CFS.entity.Contract;
import com.example.CFS.entity.Crop;
import com.example.CFS.entity.User;
import com.example.CFS.repository.ContractRepository;
import com.example.CFS.repository.CropRepository;
import com.example.CFS.repository.DeliveryRepository;
import com.example.CFS.repository.InspectionRepository;
import com.example.CFS.repository.UserRepository;
import com.example.CFS.service.EscrowService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import com.example.CFS.dto.ContractViewDto;

@Controller
public class ContractController {

    @Autowired
    private ContractRepository contractRepository;

    @Autowired
    private CropRepository cropRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EscrowService escrowService;

    @Autowired
    private InspectionRepository inspectionRepository;

    @Autowired
    private DeliveryRepository deliveryRepository;

    @GetMapping("/contracts")
    public String viewContracts(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        String role = (String) session.getAttribute("role");
        Long userId = (Long) session.getAttribute("userId");

        if (username == null) {
            return "redirect:/login";
        }

        List<ContractViewDto> dtos = new ArrayList<>();
        List<Contract> contractsFiltered = new ArrayList<>();

        if ("farmer".equals(role)) {
            // Find crops listed by farmer
            List<Crop> listedCrops = cropRepository.findByFarmerId(userId);
            List<Long> cropIds = listedCrops.stream().map(Crop::getId).collect(Collectors.toList());
            if (!cropIds.isEmpty()) {
                contractsFiltered = contractRepository.findByCropIdIn(cropIds);
            }
        } else if ("buyer".equals(role)) {
            contractsFiltered = contractRepository.findByBuyerId(userId);
        } else if ("inspector".equals(role)) {
            contractsFiltered = contractRepository.findAll();
        }

        for (Contract c : contractsFiltered) {
            Optional<Crop> crOpt = cropRepository.findById(c.getCropId());
            if (crOpt.isPresent()) {
                Crop cr = crOpt.get();
                ContractViewDto dto = new ContractViewDto();
                dto.setContractId(c.getId());
                dto.setCropName(cr.getCropName());
                dto.setQuantity(cr.getQuantity());
                dto.setPricePerUnit(cr.getPricePerUnit());
                dto.setContractStatus(c.getContractStatus());
                dto.setPaymentStatus(c.getPaymentStatus());
                dto.setFinalPrice(c.getFinalPrice());
                dto.setDeliveryDeadline(c.getDeliveryDeadline());

                inspectionRepository.findByContractId(c.getId())
                        .ifPresent(ins -> dto.setInspectionResult(ins.getResult()));
                deliveryRepository.findByContractId(c.getId()).ifPresent(del -> dto.setDeliveryStatus(del.getStatus()));

                Optional<User> farmerOpt = userRepository.findById(cr.getFarmerId());
                farmerOpt.ifPresent(u -> dto.setFarmerName(u.getUsername()));

                Optional<User> buyerOpt = userRepository.findById(c.getBuyerId());
                buyerOpt.ifPresent(u -> dto.setBuyerName(u.getUsername()));

                dtos.add(dto);
            }
        }

        model.addAttribute("contracts", dtos);
        model.addAttribute("role", role);
        if ("farmer".equals(role)) return "farmer/view_contracts";
        if ("buyer".equals(role)) return "buyer/view_contracts";
        if ("inspector".equals(role)) return "inspector/view_contracts";

        return "redirect:/login";
    }

    @PostMapping("/contract/create")
    public String createContract(@RequestParam("crop_id") Long cropId,
            @RequestParam("final_price") Double finalPrice,
            @RequestParam("delivery_deadline") String deliveryDeadline,
            @RequestParam("terms") String terms,
            HttpSession session) {
        Long buyerId = (Long) session.getAttribute("userId");
        if (buyerId == null || !"buyer".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        Optional<Crop> cropOpt = cropRepository.findById(cropId);
        if (cropOpt.isPresent()) {
            Crop crop = cropOpt.get();
            Contract contract = new Contract();
            contract.setBuyerId(buyerId);
            contract.setCropId(cropId);
            contract.setContractStatus("Pending");
            contract.setPaymentStatus("Pending");
            contract.setFinalPrice(finalPrice);
            contract.setDeliveryDeadline(deliveryDeadline);
            contract.setTerms(terms);
            contract = contractRepository.save(contract);

            boolean fundsLocked = escrowService.createEscrow(contract.getId(), buyerId, finalPrice);
            if (!fundsLocked) {
                contractRepository.delete(contract);
                return "redirect:/crop/browse?error=Insufficient+Wallet+Balance+for+Escrow";
            }

            crop.setStatus("Under_Contract");
            cropRepository.save(crop);
        }
        return "redirect:/crop/browse?success=Contract+Initiated+and+Funds+Locked";
    }

    @PostMapping("/contract/approve")
    public String approveContract(@RequestParam("contract_id") Long contractId, HttpSession session) {
        if (!"farmer".equals(session.getAttribute("role")))
            return "redirect:/login";
        Optional<Contract> cOpt = contractRepository.findById(contractId);
        if (cOpt.isPresent()) {
            Contract c = cOpt.get();
            c.setContractStatus("Accepted");
            contractRepository.save(c);
        }
        return "redirect:/contracts";
    }

    @PostMapping("/contract/reject")
    public String rejectContract(@RequestParam("contract_id") Long contractId, HttpSession session) {
        if (!"farmer".equals(session.getAttribute("role")))
            return "redirect:/login";
        Optional<Contract> cOpt = contractRepository.findById(contractId);
        if (cOpt.isPresent()) {
            Contract c = cOpt.get();
            c.setContractStatus("Rejected");
            contractRepository.save(c);

            escrowService.refundEscrow(c.getId(), c.getBuyerId());

            Optional<Crop> crOpt = cropRepository.findById(c.getCropId());
            crOpt.ifPresent(cr -> {
                cr.setStatus("Available");
                cropRepository.save(cr);
            });
        }
        return "redirect:/contracts";
    }

    @PostMapping("/contract/delete")
    public String deleteContract(@RequestParam("contract_id") Long contractId, HttpSession session) {
        if (!"buyer".equals(session.getAttribute("role")))
            return "redirect:/login";
        Optional<Contract> cOpt = contractRepository.findById(contractId);
        if (cOpt.isPresent()) {
            Contract c = cOpt.get();
            if ("Pending".equals(c.getContractStatus())) {
                escrowService.refundEscrow(c.getId(), c.getBuyerId());
            }
            Optional<Crop> crOpt = cropRepository.findById(c.getCropId());
            crOpt.ifPresent(cr -> {
                cr.setStatus("Available");
                cropRepository.save(cr);
            });
            contractRepository.deleteById(contractId);
        }
        return "redirect:/contracts";
    }

    // Removed inner ContractViewDto class

}
