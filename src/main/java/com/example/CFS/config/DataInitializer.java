package com.example.CFS.config;

import com.example.CFS.entity.Crop;
import com.example.CFS.entity.User;
import com.example.CFS.entity.Wallet;
import com.example.CFS.repository.CropRepository;
import com.example.CFS.repository.UserRepository;
import com.example.CFS.repository.WalletRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.mindrot.jbcrypt.BCrypt;

import java.time.LocalDate;

@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private WalletRepository walletRepository;

    @Autowired
    private CropRepository cropRepository;

    @Override
    public void run(String... args) throws Exception {
        if (userRepository.count() == 0) {

            // 1. Admin
            User admin = new User();
            admin.setUsername("admin");
            admin.setEmail("admin@cfs.com");
            admin.setPassword(BCrypt.hashpw("admin123", BCrypt.gensalt()));
            admin.setRole("admin");
            admin.setVerified(true);
            userRepository.save(admin);

            // 2. Farmer
            User farmer = new User();
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

            // 3. Buyer
            User buyer = new User();
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

            // 4. Inspector
            User inspector = new User();
            inspector.setUsername("Quality Inspector");
            inspector.setEmail("inspector@cfs.com");
            inspector.setPassword(BCrypt.hashpw("inspector123", BCrypt.gensalt()));
            inspector.setRole("inspector");
            inspector.setAddress("Govt Ag Center");
            inspector.setKycStatus("APPROVED");
            inspector.setVerified(true);
            userRepository.save(inspector);

            // Seed Crops
            Crop c1 = new Crop();
            c1.setFarmerId(farmer.getId());
            c1.setCropName("Paddy");
            c1.setQuantity(200);
            c1.setPricePerUnit(18500.0);
            c1.setLocation("Green Valley Farms");
            c1.setStatus("AVAILABLE");
            c1.setHarvestDate(LocalDate.now().plusMonths(2).toString());
            cropRepository.save(c1);

            Crop c2 = new Crop();
            c2.setFarmerId(farmer.getId());
            c2.setCropName("Cotton");
            c2.setQuantity(50);
            c2.setPricePerUnit(56000.0);
            c2.setLocation("Green Valley Farms");
            c2.setStatus("AVAILABLE");
            c2.setHarvestDate(LocalDate.now().plusMonths(3).toString());
            cropRepository.save(c2);

            System.out.println("Data Seeding Completed!");
        }
    }
}
