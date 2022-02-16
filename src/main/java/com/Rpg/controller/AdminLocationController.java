package com.Rpg.controller;

import com.Rpg.dto.LocationDTO;
import com.Rpg.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;


@Controller
@RequestMapping("/admin/control")
public class AdminLocationController {

    private LocationService locationService;

    @Autowired
    public AdminLocationController(LocationService locationService) {
        this.locationService = locationService;
    }

    @ModelAttribute("location")
    public LocationDTO getModel() {
        return new LocationDTO();
    }

    @GetMapping("/location")
    public String getAll(Model model) {
        model.addAttribute("locations", locationService.getAll());
        return "getLocations";
    }

    @PostMapping("/location")
    public String create(@ModelAttribute("location") LocationDTO locationDTO,
                         @RequestParam("file")MultipartFile multipartFile) throws IOException {
        locationService.create(locationDTO, multipartFile);

        return "redirect:/admin/control/location";
    }


    @GetMapping("/location/{name}/delete")
    public String deleteByName(@PathVariable("name") String name) {
        locationService.deleteByName(name);
        return "redirect:/admin/control/location";
    }

    @GetMapping("/location/{name}/edit")
    public String update(Model model,
                         @PathVariable("name") String name) {
        LocationDTO locationDTO = locationService.getByName(name);
        model.addAttribute("location", locationDTO);
        return "updateAdminLocation";
    }

    @PostMapping("/location/{name}/edit/name")
    public String updateName(@PathVariable("name") String name,
                             @RequestParam("updateName") String updateName) {
        locationService.updateName(name, updateName);
        return "redirect:/admin/control/location/" + updateName + "/edit";
    }

    @PostMapping("/location/{name}/edit/image")
    public String updateImage(@PathVariable("name") String name,
                             @RequestParam("updateImage") MultipartFile multipartFile) throws IOException {
        locationService.updateImage(name, multipartFile);
        return "redirect:/admin/control/location/" + name + "/edit";
    }



//    @PreAuthorize("hasRole('ROLE_ADMIN')")
//    @GetMapping("/location/edit/{name}")
//    public String editAndGetOne(Model model,
//                                @PathVariable("name") String name) {
//        LocationDTO locationDTO = locationService.getByName(name);
//        model.addAttribute("location", locationDTO);
//        List<LocationDTO> locationDTOS = new ArrayList<>();
//        locationDTOS.add(locationDTO);
//        model.addAttribute("locations", locationDTOS);
//        return "getLocations";
//    }
//
//    @PreAuthorize("hasRole('ROLE_ADMIN')")
//    @PostMapping("/location/edit/{name}")
//    public String editAndGetOne(@ModelAttribute("location") LocationDTO characterDTO,
//                                @PathVariable("name") String name) {
//        locationService.edit(name, characterDTO);
//        return "redirect:/admin/control/location";
//    }
    //    @PreAuthorize("hasRole('ROLE_ADMIN')")
//    @GetMapping("/admin/location")
//    public String locationAdmin(Model model) {
//        model.addAttribute("locations", locationService.locationToDto(locationService.findAll()));
//        return "locationAdmin";
//    }
//
//
//    @PreAuthorize("hasRole('ROLE_ADMIN')")
//    @PostMapping("/addLocation")
//    public String addLocation(@RequestParam(name = "locationName") String name, Model model) {
//        locationService.addLocation(name);
//        return locationAdmin(model);
//    }
//
//
//
//
//    @PreAuthorize("hasRole('ROLE_ADMIN')")
//    @GetMapping("/location/delete/{locationId}")
//    public String delete(@PathVariable(name = "locationId") Integer id, Model model) {
//        locationService.deleteById(id);
//        return locationAdmin(model);
//    }


//    @PreAuthorize("hasRole('ROLE_ADMIN')")
//    @GetMapping("/admin/heroClass")
//    public String heroClassAdmin(Model model){
//        model.addAttribute("heroClasses", heroClassService.heroClassToDto(heroClassService.findAll()));
//        return "heroClassAdmin";
//    }
}
