package com.example.CFS.repository;

import com.example.CFS.entity.TraceabilityLog;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface TraceabilityLogRepository extends JpaRepository<TraceabilityLog, Long> {
    List<TraceabilityLog> findByContractIdOrderByTimestampDesc(Long contractId);
}
