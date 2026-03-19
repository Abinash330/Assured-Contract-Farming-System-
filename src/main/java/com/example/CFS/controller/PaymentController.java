package com.example.CFS.controller;

import com.example.CFS.entity.Contract;
import com.example.CFS.entity.Crop;
import com.example.CFS.entity.Payment;
import com.example.CFS.entity.User;
import com.example.CFS.repository.ContractRepository;
import com.example.CFS.repository.CropRepository;
import com.example.CFS.repository.PaymentRepository;
import com.example.CFS.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/payment")
public class PaymentController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ContractRepository contractRepository;

    @Autowired
    private CropRepository cropRepository;

    @Autowired
    private PaymentRepository paymentRepository;

    @GetMapping("/add-details")
    public String showAddDetailsForm(HttpSession session, Model model,
            @RequestParam(value = "edit", required = false) String edit) {
        if (!"farmer".equals(session.getAttribute("role")))
            return "redirect:/login";

        Long userId = (Long) session.getAttribute("userId");
        Optional<User> uOpt = userRepository.findById(userId);
        if (uOpt.isPresent()) {
            User user = uOpt.get();
            boolean hasDetails = user.getUpi_id() != null || user.getAccount_number() != null
                    || user.getIfsc_code() != null;
            model.addAttribute("user", user);
            model.addAttribute("hasDetails", hasDetails);
            model.addAttribute("isEditing", "true".equals(edit));
        }
        return "add_payment_details";
    }

    @PostMapping("/add-details")
    public String savePaymentDetails(@RequestParam String upi_id,
            @RequestParam String account_number,
            @RequestParam String ifsc_code,
            HttpSession session,
            Model model) {
        if (!"farmer".equals(session.getAttribute("role")))
            return "redirect:/login";

        Long userId = (Long) session.getAttribute("userId");
        Optional<User> uOpt = userRepository.findById(userId);
        if (uOpt.isPresent()) {
            User user = uOpt.get();
            user.setUpi_id(upi_id);
            user.setAccount_number(account_number);
            user.setIfsc_code(ifsc_code);
            userRepository.save(user);

            model.addAttribute("message", "Payment details updated successfully!");
            model.addAttribute("user", user);
            model.addAttribute("hasDetails", true);
            model.addAttribute("isEditing", false);
        }
        return "add_payment_details";
    }

    @PostMapping("/form")
    public String showPaymentForm(@RequestParam("contract_id") Long contractId, HttpSession session, Model model) {
        if (!"buyer".equals(session.getAttribute("role")))
            return "redirect:/login";

        Long buyerId = (Long) session.getAttribute("userId");

        // We fetch the accepted contracts for this buyer
        List<Contract> contracts = contractRepository.findByBuyerId(buyerId);
        List<PaymentFormDto> contractDtos = new ArrayList<>();

        for (Contract c : contracts) {
            if ("Accepted".equalsIgnoreCase(c.getContractStatus())) {
                Optional<Crop> crOpt = cropRepository.findById(c.getCropId());
                if (crOpt.isPresent()) {
                    Crop cr = crOpt.get();
                    Optional<User> fOpt = userRepository.findById(cr.getFarmerId());
                    if (fOpt.isPresent()) {
                        User farmer = fOpt.get();

                        PaymentFormDto dto = new PaymentFormDto();
                        dto.setContractId(c.getId());
                        dto.setCropName(cr.getCropName());
                        dto.setTotalPrice(cr.getQuantity() * cr.getPricePerUnit());
                        dto.setUpiId(farmer.getUpi_id());
                        dto.setIfscCode(farmer.getIfsc_code());
                        dto.setAccountNumber(farmer.getAccount_number());

                        contractDtos.add(dto);
                    }
                }
            }
        }

        model.addAttribute("contractsToPay", contractDtos);
        model.addAttribute("selectedContractId", contractId);
        return "payment_form";
    }

    @Transactional
    @PostMapping("/process")
    public String processPayment(@RequestParam("contract_id") Long contractId,
            @RequestParam("payment_method") String paymentMethod,
            @RequestParam("transaction_id") String transactionId,
            HttpSession session) {
        if (!"buyer".equals(session.getAttribute("role")))
            return "redirect:/login";

        Payment payment = new Payment();
        payment.setContractId(contractId);
        payment.setPaymentMethod(paymentMethod);
        payment.setTransactionId(transactionId);
        paymentRepository.save(payment);

        Optional<Contract> cOpt = contractRepository.findById(contractId);
        if (cOpt.isPresent()) {
            Contract c = cOpt.get();
            c.setPaymentStatus("Paid");
            contractRepository.save(c);

            Optional<Crop> crOpt = cropRepository.findById(c.getCropId());
            if (crOpt.isPresent()) {
                Crop cr = crOpt.get();
                cr.setStatus("Sold");
                cropRepository.save(cr);
            }
        }
        return "redirect:/contracts";
    }

    public static class PaymentFormDto {
        private Long contractId;
        private String cropName;
        private Double totalPrice;
        private String upiId;
        private String ifscCode;
        private String accountNumber;

        public Long getContractId() {
            return contractId;
        }

        public void setContractId(Long contractId) {
            this.contractId = contractId;
        }

        public String getCropName() {
            return cropName;
        }

        public void setCropName(String cropName) {
            this.cropName = cropName;
        }

        public Double getTotalPrice() {
            return totalPrice;
        }

        public void setTotalPrice(Double totalPrice) {
            this.totalPrice = totalPrice;
        }

        public String getUpiId() {
            return upiId;
        }

        public void setUpiId(String upiId) {
            this.upiId = upiId;
        }

        public String getIfscCode() {
            return ifscCode;
        }

        public void setIfscCode(String ifscCode) {
            this.ifscCode = ifscCode;
        }

        public String getAccountNumber() {
            return accountNumber;
        }

        public void setAccountNumber(String accountNumber) {
            this.accountNumber = accountNumber;
        }
    }
}
