package com.example.CFS.repository;

import com.example.CFS.entity.Contract;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContractRepository extends JpaRepository<Contract, Long> {
    List<Contract> findByBuyerId(Long buyerId);

    List<Contract> findByCropIdIn(List<Long> cropIds);

    void deleteByCropId(Long cropId);
}
