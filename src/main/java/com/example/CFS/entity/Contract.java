package com.example.CFS.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "contracts")
public class Contract {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "crop_id")
    private Long cropId;

    @Column(name = "buyer_id")
    private Long buyerId;

    @Column(name = "contract_status")
    private String contractStatus = "Pending";

    @Column(name = "payment_status")
    private String paymentStatus = "Pending";

    @Column(name = "final_price")
    private Double finalPrice;

    @Column(name = "delivery_deadline")
    private String deliveryDeadline;

    private String terms;

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getCropId() {
        return cropId;
    }

    public void setCropId(Long cropId) {
        this.cropId = cropId;
    }

    public Long getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Long buyerId) {
        this.buyerId = buyerId;
    }

    public String getContractStatus() {
        return contractStatus;
    }

    public void setContractStatus(String contractStatus) {
        this.contractStatus = contractStatus;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Double getFinalPrice() {
        return finalPrice;
    }

    public void setFinalPrice(Double finalPrice) {
        this.finalPrice = finalPrice;
    }

    public String getDeliveryDeadline() {
        return deliveryDeadline;
    }

    public void setDeliveryDeadline(String deliveryDeadline) {
        this.deliveryDeadline = deliveryDeadline;
    }

    public String getTerms() {
        return terms;
    }

    public void setTerms(String terms) {
        this.terms = terms;
    }
}
