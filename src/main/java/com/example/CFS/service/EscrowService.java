package com.example.CFS.service;

import com.example.CFS.entity.Escrow;
import com.example.CFS.repository.EscrowRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EscrowService {

    @Autowired
    private EscrowRepository escrowRepository;

    @Autowired
    private WalletService walletService;

    @Transactional
    public boolean createEscrow(Long contractId, Long buyerId, Double amount) {
        boolean fundsLocked = walletService.lockFunds(buyerId, amount);
        if (fundsLocked) {
            Escrow escrow = new Escrow(contractId, amount);
            escrowRepository.save(escrow);
            return true;
        }
        return false;
    }

    @Transactional
    public void releaseEscrow(Long contractId, Long buyerId, Long farmerId) {
        Escrow escrow = escrowRepository.findByContractId(contractId).orElse(null);
        if (escrow != null && "LOCKED".equals(escrow.getStatus())) {
            walletService.releaseFunds(buyerId, farmerId, escrow.getAmount());
            escrow.setStatus("RELEASED");
            escrowRepository.save(escrow);
        }
    }

    @Transactional
    public void refundEscrow(Long contractId, Long buyerId) {
        Escrow escrow = escrowRepository.findByContractId(contractId).orElse(null);
        if (escrow != null && "LOCKED".equals(escrow.getStatus())) {
            walletService.refundFunds(buyerId, escrow.getAmount());
            escrow.setStatus("REFUNDED");
            escrowRepository.save(escrow);
        }
    }
}
