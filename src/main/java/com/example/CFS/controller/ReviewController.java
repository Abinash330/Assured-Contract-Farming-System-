package com.example.CFS.controller;

import com.example.CFS.entity.Contract;
import com.example.CFS.entity.Crop;
import com.example.CFS.entity.Review;
import com.example.CFS.repository.ContractRepository;
import com.example.CFS.repository.CropRepository;
import com.example.CFS.repository.ReviewRepository;
import com.example.CFS.service.CreditScoreService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Controller
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    private ReviewRepository reviewRepository;

    @Autowired
    private ContractRepository contractRepository;

    @Autowired
    private CropRepository cropRepository;

    @Autowired
    private CreditScoreService creditScoreService;

    @PostMapping("/submit")
    public String submitReview(@RequestParam("contract_id") Long contractId,
            @RequestParam("rating") Integer rating,
            @RequestParam("comments") String comments,
            HttpSession session) {
        Long reviewerId = (Long) session.getAttribute("userId");
        if (reviewerId == null) {
            return "redirect:/login";
        }

        Optional<Contract> cOpt = contractRepository.findById(contractId);
        if (cOpt.isPresent()) {
            Contract c = cOpt.get();
            Long farmerId = null;
            Optional<Crop> crOpt = cropRepository.findById(c.getCropId());
            if (crOpt.isPresent())
                farmerId = crOpt.get().getFarmerId();

            Long revieweeId = (farmerId != null && farmerId.equals(reviewerId)) ? c.getBuyerId() : farmerId;

            if (revieweeId != null) {
                Review review = new Review();
                review.setContractId(contractId);
                review.setReviewerId(reviewerId);
                review.setRevieweeId(revieweeId);
                review.setRating(rating);
                review.setComments(comments);
                reviewRepository.save(review);

                creditScoreService.updateScoreFromReview(revieweeId, rating);
            }
        }
        return "redirect:/contracts?success=Review+Submitted";
    }
}
