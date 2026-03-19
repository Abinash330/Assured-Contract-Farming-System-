package com.example.CFS.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "wallets")
public class Wallet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id", unique = true, nullable = false)
    private Long userId;

    private Double balance = 0.0;

    @Column(name = "locked_amount")
    private Double lockedAmount = 0.0;

    public Wallet() {
    }

    public Wallet(Long userId) {
        this.userId = userId;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public Double getLockedAmount() {
        return lockedAmount;
    }

    public void setLockedAmount(Double lockedAmount) {
        this.lockedAmount = lockedAmount;
    }
}
