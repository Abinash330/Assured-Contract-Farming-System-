package com.example.CFS.config;

import com.example.CFS.entity.*;
import com.example.CFS.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.mindrot.jbcrypt.BCrypt;

import java.time.LocalDate;
import java.util.Optional;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired private UserRepository userRepository;
    @Autowired private WalletRepository walletRepository;
    @Autowired private CropRepository cropRepository;
    @Autowired private ContractRepository contractRepository;
    @Autowired private EscrowRepository escrowRepository;
    @Autowired private DisputeRepository disputeRepository;
    @Autowired private InspectionRepository inspectionRepository;
    @Autowired private PaymentRepository paymentRepository;

    @Override
    public void run(String... args) throws Exception {
        System.out.println("Starting Data Seeding Process...");

        User admin = userRepository.findByEmail("admin@cfs.com").orElse(null);
        if (admin == null) {
            admin = new User();
            admin.setUsername("admin");
            admin.setEmail("admin@cfs.com");
            admin.setPassword(BCrypt.hashpw("admin123", BCrypt.gensalt()));
            admin.setRole("admin");
            admin.setVerified(true);
            userRepository.save(admin);
        }

        User farmer = userRepository.findByEmail("farmer@cfs.com").orElse(null);
        if (farmer == null) {
            farmer = new User();
            farmer.setUsername("John Farmer");
            farmer.setEmail("farmer@cfs.com");
            farmer.setPassword(BCrypt.hashpw("farmer123", BCrypt.gensalt()));
            farmer.setRole("farmer");
            farmer.setAddress("Green Valley Farms, District A");
            farmer.setKycStatus("APPROVED");
            farmer.setVerified(true);
            farmer.setAadhaarNumber("123456789012");
            farmer.setPanNumber("ABCDE1234F");
            userRepository.save(farmer);

            Wallet fWallet = new Wallet();
            fWallet.setUserId(farmer.getId());
            fWallet.setBalance(15000.0);
            fWallet.setLockedAmount(0.0);
            walletRepository.save(fWallet);
        }

        User buyer = userRepository.findByEmail("buyer@cfs.com").orElse(null);
        if (buyer == null) {
            buyer = new User();
            buyer.setUsername("Corp Buyer Inc.");
            buyer.setEmail("buyer@cfs.com");
            buyer.setPassword(BCrypt.hashpw("buyer123", BCrypt.gensalt()));
            buyer.setRole("buyer");
            buyer.setAddress("Industrial Estate, City Center");
            buyer.setKycStatus("APPROVED");
            buyer.setVerified(true);
            buyer.setAadhaarNumber("987654321098");
            buyer.setPanNumber("XYZPQ9876R");
            userRepository.save(buyer);

            Wallet bWallet = new Wallet();
            bWallet.setUserId(buyer.getId());
            bWallet.setBalance(250000.0);
            bWallet.setLockedAmount(0.0);
            walletRepository.save(bWallet);
        }

        User inspector = userRepository.findByEmail("inspector@cfs.com").orElse(null);
        if (inspector == null) {
            inspector = new User();
            inspector.setUsername("Quality Inspector");
            inspector.setEmail("inspector@cfs.com");
            inspector.setPassword(BCrypt.hashpw("inspector123", BCrypt.gensalt()));
            inspector.setRole("inspector");
            inspector.setAddress("Govt Ag Center");
            inspector.setKycStatus("APPROVED");
            inspector.setVerified(true);
            userRepository.save(inspector);
        }

        if (contractRepository.count() == 0) {
            System.out.println("Seeding Advanced Dummy Data (Crops, Contracts, Disputes, etc.)...");
            
            // Crops
            Crop c1 = new Crop();
            c1.setFarmerId(farmer.getId());
            c1.setCropName("Premium Organic Paddy");
            c1.setQuantity(200);
            c1.setPricePerUnit(1850.0); // reduced to reasonable amount
            c1.setLocation("Green Valley Farms");
            c1.setStatus("CONTRACTED");
            c1.setHarvestDate(LocalDate.now().plusMonths(1).toString());
            cropRepository.save(c1);

            Crop c2 = new Crop();
            c2.setFarmerId(farmer.getId());
            c2.setCropName("BT Cotton Export Quality");
            c2.setQuantity(500);
            c2.setPricePerUnit(5600.0);
            c2.setLocation("Green Valley Farms");
            c2.setStatus("AVAILABLE");
            c2.setHarvestDate(LocalDate.now().plusMonths(3).toString());
            cropRepository.save(c2);
            
            Crop c3 = new Crop();
            c3.setFarmerId(farmer.getId());
            c3.setCropName("Grade A Wheat");
            c3.setQuantity(1000);
            c3.setPricePerUnit(2200.0);
            c3.setLocation("Northern Fields");
            c3.setStatus("CONTRACTED");
            c3.setHarvestDate(LocalDate.now().minusDays(5).toString()); // Ready for delivery
            cropRepository.save(c3);

            // ACTIVE CONTRACT (Pending Delivery/Inspection)
            Contract activeContract = new Contract();
            activeContract.setCropId(c1.getId());
            activeContract.setBuyerId(buyer.getId());
            activeContract.setContractStatus("Active");
            activeContract.setPaymentStatus("Escrow Locked");
            activeContract.setFinalPrice(c1.getQuantity() * c1.getPricePerUnit());
            activeContract.setDeliveryDeadline(c1.getHarvestDate());
            activeContract.setTerms("Standard quality check upon delivery. Moisture < 14%.");
            contractRepository.save(activeContract);

            Escrow escrow1 = new Escrow();
            escrow1.setContractId(activeContract.getId());
            escrow1.setAmount(activeContract.getFinalPrice());
            escrow1.setStatus("LOCKED");
            escrowRepository.save(escrow1);

            // COMPLETED CONTRACT & PAYMENT
            Contract completedContract = new Contract();
            completedContract.setCropId(c3.getId());
            completedContract.setBuyerId(buyer.getId());
            completedContract.setContractStatus("Completed");
            completedContract.setPaymentStatus("Paid");
            completedContract.setFinalPrice(c3.getQuantity() * c3.getPricePerUnit());
            completedContract.setDeliveryDeadline(LocalDate.now().minusDays(10).toString());
            completedContract.setTerms("Delivered to Central Warehouse.");
            contractRepository.save(completedContract);
            
            Payment payment = new Payment();
            payment.setContractId(completedContract.getId());
            payment.setPaymentMethod("BANK_TRANSFER");
            payment.setTransactionId("TXN" + System.currentTimeMillis());
            paymentRepository.save(payment);

            // INSPECTION on Active Contract
            Inspection inspection = new Inspection();
            inspection.setContractId(activeContract.getId());
            inspection.setInspectorId(inspector.getId());
            inspection.setResult("PENDING");
            inspection.setComments("Scheduled review for next week. Awaiting harvest.");
            inspectionRepository.save(inspection);

            // DISPUTE on another dummy contract (Let's make a disputed one)
            Crop c4 = new Crop();
            c4.setFarmerId(farmer.getId());
            c4.setCropName("Sugarcane");
            c4.setQuantity(50);
            c4.setPricePerUnit(3500.0);
            c4.setLocation("Eastern Fields");
            c4.setStatus("CONTRACTED");
            c4.setHarvestDate(LocalDate.now().minusDays(2).toString());
            cropRepository.save(c4);

            Contract disputedContract = new Contract();
            disputedContract.setCropId(c4.getId());
            disputedContract.setBuyerId(buyer.getId());
            disputedContract.setContractStatus("Disputed");
            disputedContract.setPaymentStatus("Escrow Frozen");
            disputedContract.setFinalPrice(c4.getQuantity() * c4.getPricePerUnit());
            disputedContract.setDeliveryDeadline(c4.getHarvestDate());
            disputedContract.setTerms("Strict sugar content > 12%.");
            contractRepository.save(disputedContract);

            Dispute dispute = new Dispute();
            dispute.setContractId(disputedContract.getId());
            dispute.setRaisedBy(buyer.getId());
            dispute.setReason("Quality mismatch: Sugar content measured at 10.5%, significantly below agreed 12% threshold.");
            dispute.setStatus("OPEN");
            disputeRepository.save(dispute);
            
            System.out.println("Advanced Data Seeding Completed!");
        }
    }
}
