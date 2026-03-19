package com.example.CFS.service;

import com.example.CFS.entity.Wallet;
import com.example.CFS.repository.WalletRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class WalletService {

    @Autowired
    private WalletRepository walletRepository;

    @Transactional
    public Wallet createWalletForUser(Long userId) {
        Wallet wallet = new Wallet(userId);
        return walletRepository.save(wallet);
    }

    public Wallet getWalletByUserId(Long userId) {
        return walletRepository.findByUserId(userId).orElse(null);
    }

    @Transactional
    public boolean lockFunds(Long userId, Double amount) {
        Wallet wallet = getWalletByUserId(userId);
        if (wallet != null && wallet.getBalance() >= amount) {
            wallet.setBalance(wallet.getBalance() - amount);
            wallet.setLockedAmount(wallet.getLockedAmount() + amount);
            walletRepository.save(wallet);
            return true;
        }
        return false;
    }

    @Transactional
    public void releaseFunds(Long buyerId, Long farmerId, Double amount) {
        Wallet buyerWallet = getWalletByUserId(buyerId);
        Wallet farmerWallet = getWalletByUserId(farmerId);

        if (buyerWallet != null && farmerWallet != null) {
            buyerWallet.setLockedAmount(buyerWallet.getLockedAmount() - amount);
            farmerWallet.setBalance(farmerWallet.getBalance() + amount);

            walletRepository.save(buyerWallet);
            walletRepository.save(farmerWallet);
        }
    }

    @Transactional
    public void refundFunds(Long buyerId, Double amount) {
        Wallet buyerWallet = getWalletByUserId(buyerId);
        if (buyerWallet != null) {
            buyerWallet.setLockedAmount(buyerWallet.getLockedAmount() - amount);
            buyerWallet.setBalance(buyerWallet.getBalance() + amount);
            walletRepository.save(buyerWallet);
        }
    }

    @Transactional
    public void addFunds(Long userId, Double amount) {
        Wallet wallet = getWalletByUserId(userId);
        if (wallet != null) {
            wallet.setBalance(wallet.getBalance() + amount);
            walletRepository.save(wallet);
        }
    }
}
