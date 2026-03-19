package com.example.CFS.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "escrows")
public class Escrow {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "contract_id", unique = true, nullable = false)
    private Long contractId;

    private Double amount;

    // LOCKED, RELEASED, REFUNDED
    private String status = "LOCKED";

    public Escrow() {
    }

    public Escrow(Long contractId, Double amount) {
        this.contractId = contractId;
        this.amount = amount;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getContractId() {
        return contractId;
    }

    public void setContractId(Long contractId) {
        this.contractId = contractId;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
