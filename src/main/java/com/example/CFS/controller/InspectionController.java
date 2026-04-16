package com.example.CFS.controller;

import com.example.CFS.entity.Inspection;
import com.example.CFS.dto.ContractViewDto;
import com.example.CFS.entity.Contract;
import com.example.CFS.entity.Crop;
import com.example.CFS.entity.User;
import com.example.CFS.repository.ContractRepository;
import com.example.CFS.repository.CropRepository;
import com.example.CFS.repository.UserRepository;
import com.example.CFS.repository.InspectionRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/inspection")
public class InspectionController {

    @Autowired
    private InspectionRepository inspectionRepository;

    @Autowired
    private ContractRepository contractRepository;

    @Autowired
    private CropRepository cropRepository;

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/submit")
    public String submitInspection(@RequestParam("contract_id") Long contractId,
            @RequestParam("result") String result, // PASSED or FAILED
            @RequestParam(value = "moisture", required = false) String moisture,
            @RequestParam(value = "defects", required = false) String defects,
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
        
        // Structure the precise metrics into the legacy comments field
        String structuredComments = String.format("[Metrics] Moisture: %s%% | Defects: %s%%\n[Notes] %s", 
            (moisture != null ? moisture : "N/A"), 
            (defects != null ? defects : "N/A"), 
            comments);
            
        inspection.setComments(structuredComments);
        inspectionRepository.save(inspection);

        return "redirect:/dashboard?success=Lab+Audit+Submitted";
    }

    @GetMapping("/logs")
    public String viewCertificationLogs(HttpSession session, Model model) {
        Long inspectorId = (Long) session.getAttribute("userId");
        if (inspectorId == null || !"inspector".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        List<Inspection> inspections = inspectionRepository.findByInspectorId(inspectorId);
        List<ContractViewDto> auditLogs = new ArrayList<>();

        for (Inspection ins : inspections) {
            Optional<Contract> cOpt = contractRepository.findById(ins.getContractId());
            if (cOpt.isPresent()) {
                Contract c = cOpt.get();
                Optional<Crop> crOpt = cropRepository.findById(c.getCropId());
                if (crOpt.isPresent()) {
                    Crop cr = crOpt.get();
                    ContractViewDto dto = new ContractViewDto();
                    dto.setContractId(c.getId());
                    dto.setCropName(cr.getCropName());
                    dto.setQuantity(cr.getQuantity());
                    dto.setInspectionResult(ins.getResult());
                    dto.setTerms(ins.getComments()); // Overload terms variable for view template
                    
                    Optional<User> farmerOpt = userRepository.findById(cr.getFarmerId());
                    farmerOpt.ifPresent(u -> dto.setFarmerName(u.getUsername()));

                    auditLogs.add(dto);
                }
            }
        }

        model.addAttribute("auditLogs", auditLogs);
        return "inspector/logs";
    }
}
