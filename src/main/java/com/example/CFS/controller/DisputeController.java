package com.example.CFS.controller;

import com.example.CFS.entity.Contract;
import com.example.CFS.entity.Crop;
import com.example.CFS.entity.Dispute;
import com.example.CFS.repository.ContractRepository;
import com.example.CFS.repository.CropRepository;
import com.example.CFS.repository.DisputeRepository;
import com.example.CFS.service.CreditScoreService;
import com.example.CFS.service.EscrowService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/dispute")
public class DisputeController {

    @Autowired
    private DisputeRepository disputeRepository;

    @Autowired
    private ContractRepository contractRepository;

    @Autowired
    private CropRepository cropRepository;

    @Autowired
    private CreditScoreService creditScoreService;

    @Autowired
    private EscrowService escrowService;

    @PostMapping("/raise")
    public String raiseDispute(@RequestParam("contract_id") Long contractId,
            @RequestParam("reason") String reason,
            HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        Optional<Contract> cOpt = contractRepository.findById(contractId);
        if (cOpt.isPresent()) {
            Contract c = cOpt.get();
            c.setContractStatus("Disputed");
            contractRepository.save(c);

            Dispute dispute = new Dispute();
            dispute.setContractId(contractId);
            dispute.setRaisedBy(userId);
            dispute.setReason(reason);
            disputeRepository.save(dispute);

            Long farmerId = null;
            Optional<Crop> crOpt = cropRepository.findById(c.getCropId());
            if (crOpt.isPresent()) {
                farmerId = crOpt.get().getFarmerId();
            }

            // Deduct points from the other party involved
            Long otherParty = (farmerId != null && farmerId.equals(userId)) ? c.getBuyerId() : farmerId;
            if (otherParty != null) {
                creditScoreService.deductDisputePoints(otherParty);
            }
        }
        return "redirect:/contracts?success=Dispute+Raised";
    }

    @PostMapping("/resolve")
    public String resolveDispute(@RequestParam("dispute_id") Long disputeId,
            @RequestParam("resolution") String resolution, // REFUND_BUYER or PAY_FARMER
            HttpSession session) {
        if (!"admin".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        Optional<Dispute> dOpt = disputeRepository.findById(disputeId);
        if (dOpt.isPresent()) {
            Dispute d = dOpt.get();
            d.setStatus("RESOLVED");
            disputeRepository.save(d);

            Optional<Contract> cOpt = contractRepository.findById(d.getContractId());
            if (cOpt.isPresent()) {
                Contract c = cOpt.get();
                Long farmerId = null;
                Optional<Crop> crOpt = cropRepository.findById(c.getCropId());
                if (crOpt.isPresent())
                    farmerId = crOpt.get().getFarmerId();

                if ("REFUND_BUYER".equals(resolution)) {
                    escrowService.refundEscrow(c.getId(), c.getBuyerId());
                    c.setContractStatus("Resolved_Refunded");
                } else if ("PAY_FARMER".equals(resolution) && farmerId != null) {
                    escrowService.releaseEscrow(c.getId(), c.getBuyerId(), farmerId);
                    c.setContractStatus("Resolved_Paid");
                    c.setPaymentStatus("Paid");
                }
                contractRepository.save(c);
            }
        }
        return "redirect:/admin/dashboard";
    }
}
