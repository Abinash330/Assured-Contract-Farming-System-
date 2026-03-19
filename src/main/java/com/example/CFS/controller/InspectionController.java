package com.example.CFS.controller;

import com.example.CFS.entity.Inspection;
import com.example.CFS.repository.InspectionRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/inspection")
public class InspectionController {

    @Autowired
    private InspectionRepository inspectionRepository;

    @PostMapping("/submit")
    public String submitInspection(@RequestParam("contract_id") Long contractId,
            @RequestParam("result") String result, // PASSED or FAILED
            @RequestParam("comments") String comments,
            HttpSession session) {
        Long inspectorId = (Long) session.getAttribute("userId");
        if (inspectorId == null || !"inspector".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        Inspection inspection = inspectionRepository.findByContractId(contractId).orElse(new Inspection());
        inspection.setContractId(contractId);
        inspection.setInspectorId(inspectorId);
        inspection.setResult(result);
        inspection.setComments(comments);
        inspectionRepository.save(inspection);

        return "redirect:/dashboard?success=Inspection+Submitted";
    }
}
