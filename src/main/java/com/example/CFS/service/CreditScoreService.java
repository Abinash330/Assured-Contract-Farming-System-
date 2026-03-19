package com.example.CFS.service;

import com.example.CFS.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CreditScoreService {

    @Autowired
    private UserRepository userRepository;

    @Transactional
    public void addSuccessfulContractPoints(Long userId) {
        userRepository.findById(userId).ifPresent(user -> {
            int currentScore = user.getCreditScore();
            user.setCreditScore(Math.min(850, currentScore + 10)); // Max score 850
            userRepository.save(user);
        });
    }

    @Transactional
    public void deductDisputePoints(Long userId) {
        userRepository.findById(userId).ifPresent(user -> {
            int currentScore = user.getCreditScore();
            user.setCreditScore(Math.max(300, currentScore - 20)); // Min score 300
            userRepository.save(user);
        });
    }

    @Transactional
    public void updateScoreFromReview(Long userId, int rating) {
        userRepository.findById(userId).ifPresent(user -> {
            int currentScore = user.getCreditScore();
            int scoreChange = 0;
            if (rating >= 4) {
                scoreChange = 5;
            } else if (rating <= 2) {
                scoreChange = -10;
            }
            user.setCreditScore(Math.min(850, Math.max(300, currentScore + scoreChange)));
            userRepository.save(user);
        });
    }
}
