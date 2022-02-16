package com.Rpg.controller;

import com.Rpg.service.HeroService;
import com.Rpg.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RequestMapping("{userName}/hero/{heroName}/location")
@Controller
public class LocationController {

    private LocationService locationService;

    private HeroService heroService;

    @Autowired
    public LocationController(LocationService locationService, HeroService heroService) {
        this.locationService = locationService;
        this.heroService = heroService;
    }

    @GetMapping("/choose")
    public String choose(Model model,
                         @PathVariable("heroName") String heroName,
                         @PathVariable("userName") String userName) {
        model.addAttribute("userName", userName);
        model.addAttribute("heroName", heroName);
        model.addAttribute("locations", locationService.getAll());
        return "chooseLocation";
    }

    @PostMapping("/choose")
    public String choose(@PathVariable("heroName") String heroName,
                         @PathVariable("userName") String userName,
                         @RequestParam(name = "chooseLocation") String chooseLocation) {
        return "redirect:/" + userName + "/hero/" + heroName + "/location/" + chooseLocation + "/fight";
    }


//    @ModelAttribute("location")
//    public LocationDTO getModel() {
//        return new LocationDTO();
//    }
//
//    @GetMapping("/control")
//    public String control() {
//        return "controlLocations";
//    }
//
//    @GetMapping("/get")
//    public String getAll(Model model) {
//        model.addAttribute("locationsDTO", locationService.getAll());
//        return "getLocations";
//    }
//
//    @GetMapping("/create")
//    public String create() {
//        return "createLocation";
//    }
//
//    @PostMapping("/create")
//    public String create(@ModelAttribute("locationDTO") LocationDTO locationDTO) {
//        locationService.create(locationDTO);
//        return "redirect:/locations/get";
//    }

//    @GetMapping("/delete/{id}")
//    public String deleteByName(@PathVariable("id") String name) {
//        locationService.deleteByName(name);
//        return "redirect:/locations/get";
//    }

//    @GetMapping("/get/{name}")
//    public String getByName(@PathVariable("name") String name, Model model) {
//        model.addAttribute("locationDTO", locationService.getByName(name));
//        return "getLocation";
//    }
//    @GetMapping("getLocation/{id}")
//    @ResponseBody
//    public String getOne(@PathVariable(name = "id") Integer id) {
//        Gson gson = new Gson();
//        return gson.toJson(new LocationDto(locationService.getOne(id)));
//    }
//
//    @GetMapping("saveLoc")
//    @ResponseBody
//    public String save(){
//        Gson gson = new Gson();
//        Location location = new Location();
////        location.setName("New Location");
//        return gson.toJson(new LocationDto(locationService.save(location)));
//    }
}
