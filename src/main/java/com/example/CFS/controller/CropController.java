package com.example.CFS.controller;

import com.example.CFS.entity.Crop;
import com.example.CFS.repository.ContractRepository;
import com.example.CFS.repository.CropRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/crop")
public class CropController {

    @Autowired
    private CropRepository cropRepository;

    @Autowired
    private ContractRepository contractRepository;

    @GetMapping("/add")
    public String showAddCropForm(HttpSession session) {
        if (session.getAttribute("username") == null || !"farmer".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }
        return "list_crops";
    }

    @PostMapping("/add")
    public String addCrop(@RequestParam String crop_name,
            @RequestParam Integer quantity,
            @RequestParam Double price_per_unit,
            @RequestParam String location,
            @RequestParam String harvest_date,
            HttpSession session,
            Model model) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        Crop crop = new Crop();
        crop.setCropName(crop_name);
        crop.setQuantity(quantity);
        crop.setPricePerUnit(price_per_unit);
        crop.setLocation(location);
        crop.setHarvestDate(harvest_date);
        crop.setFarmerId(userId);
        crop.setStatus("Available");

        cropRepository.save(crop);
        return "redirect:/dashboard";
    }

    @GetMapping("/update")
    public String showUpdateCropForm(@RequestParam("crop_id") Long cropId, HttpSession session, Model model) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }
        Optional<Crop> cropOpt = cropRepository.findById(cropId);
        if (cropOpt.isPresent()) {
            model.addAttribute("crop", cropOpt.get());
            return "update_crop";
        }
        return "redirect:/dashboard";
    }

    @PostMapping("/update")
    public String updateCrop(@RequestParam("crop_id") Long cropId,
            @RequestParam Integer quantity,
            @RequestParam Double price_per_unit,
            @RequestParam String location,
            @RequestParam String harvest_date,
            HttpSession session) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }
        Optional<Crop> cropOpt = cropRepository.findById(cropId);
        if (cropOpt.isPresent()) {
            Crop crop = cropOpt.get();
            // Verify farmer matches
            Long userId = (Long) session.getAttribute("userId");
            if (crop.getFarmerId().equals(userId)) {
                crop.setQuantity(quantity);
                crop.setPricePerUnit(price_per_unit);
                crop.setLocation(location);
                crop.setHarvestDate(harvest_date);
                cropRepository.save(crop);
            }
        }
        return "redirect:/dashboard";
    }

    @Transactional
    @PostMapping("/delete")
    public String deleteCrop(@RequestParam("crop_id") Long cropId, HttpSession session) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }
        Optional<Crop> cropOpt = cropRepository.findById(cropId);
        if (cropOpt.isPresent()) {
            Crop crop = cropOpt.get();
            Long userId = (Long) session.getAttribute("userId");
            if (crop.getFarmerId().equals(userId)) {
                // Delete Contracts related to crop first
                contractRepository.deleteByCropId(cropId);
                // Then delete the crop
                cropRepository.deleteById(cropId);
            }
        }
        return "redirect:/dashboard";
    }

    @GetMapping("/browse")
    public String browseCrops(@RequestParam(value = "search", required = false) String search, HttpSession session,
            Model model) {
        if (session.getAttribute("username") == null || !"buyer".equals(session.getAttribute("role"))) {
            return "redirect:/login";
        }

        List<Crop> allCrops = cropRepository.findAll();

        // Filter out crops that are not available/under_contract
        // And match the search query
        List<Crop> filteredCrops = allCrops.stream().filter(crop -> {
            boolean statusMatches = "Available".equalsIgnoreCase(crop.getStatus())
                    || "Under_Contract".equalsIgnoreCase(crop.getStatus());
            boolean searchMatches = search == null || search.trim().isEmpty() ||
                    (crop.getCropName() != null && crop.getCropName().toLowerCase().contains(search.toLowerCase())) ||
                    (crop.getLocation() != null && crop.getLocation().toLowerCase().contains(search.toLowerCase()));

            // Note: In real logic we shouldn't show accepted contracts.
            // But since contracts logic will be built next, we'll keep it simple for now
            // based on Crop status string
            return statusMatches && searchMatches;
        }).collect(Collectors.toList());

        model.addAttribute("crops", filteredCrops);
        model.addAttribute("search", search);

        return "browse_crops";
    }
}
