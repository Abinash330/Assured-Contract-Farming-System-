package com.example.CFS.controller;

import com.example.CFS.entity.Contract;
import com.example.CFS.entity.Delivery;
import com.example.CFS.entity.Inspection;
import com.example.CFS.repository.ContractRepository;
import com.example.CFS.repository.DeliveryRepository;
import com.example.CFS.repository.InspectionRepository;
import com.example.CFS.service.CreditScoreService;
import com.example.CFS.service.EscrowService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/delivery")
public class DeliveryController {

    @Autowired
    private DeliveryRepository deliveryRepository;

    @Autowired
    private ContractRepository contractRepository;

    @Autowired
    private InspectionRepository inspectionRepository;

    @Autowired
    private EscrowService escrowService;

    @Autowired
    private CreditScoreService creditScoreService;

    @PostMapping("/update")
    public String updateDelivery(@RequestParam("contract_id") Long contractId,
            @RequestParam("status") String status, // IN_TRANSIT, DELIVERED
            @RequestParam(value = "tracking_info", required = false) String trackingInfo,
            HttpSession session) {
        Long farmerId = (Long) session.getAttribute("userId");
        if (farmerId == null || !"farmer".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        Optional<Contract> cOpt = contractRepository.findById(contractId);
        if (cOpt.isPresent()) {
            Contract c = cOpt.get();
            Delivery delivery = deliveryRepository.findByContractId(contractId).orElse(new Delivery());
            delivery.setContractId(contractId);
            delivery.setStatus(status);
            if (trackingInfo != null) {
                delivery.setTrackingInfo(trackingInfo);
            }
            deliveryRepository.save(delivery);

            // If Delivered, verify Inspection before releasing funds
            if ("DELIVERED".equalsIgnoreCase(status)) {
                Optional<Inspection> iOpt = inspectionRepository.findByContractId(contractId);
                if (iOpt.isPresent() && "PASSED".equalsIgnoreCase(iOpt.get().getResult())) {
                    escrowService.releaseEscrow(contractId, c.getBuyerId(), farmerId);
                    c.setContractStatus("Completed");
                    c.setPaymentStatus("Paid");
                    contractRepository.save(c);

                    creditScoreService.addSuccessfulContractPoints(farmerId);
                    creditScoreService.addSuccessfulContractPoints(c.getBuyerId());
                }
            }
        }

        return "redirect:/contracts?success=Delivery+Updated";
    }
}
