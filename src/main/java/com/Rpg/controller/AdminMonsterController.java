package com.Rpg.controller;

import com.Rpg.dto.LocationDTO;
import com.Rpg.dto.MonsterDTO;
import com.Rpg.entity.Monster;
import com.Rpg.service.LocationService;
import com.Rpg.service.MonsterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RequestMapping("/admin/control")
@Controller
public class AdminMonsterController {

    private MonsterService monsterService;

    private LocationService locationService;

    @Autowired
    public AdminMonsterController(MonsterService monsterService, LocationService locationService) {
        this.monsterService = monsterService;
        this.locationService = locationService;
    }

    @ModelAttribute("monster")
    public MonsterDTO getModel() {
        return new MonsterDTO();
    }


    @GetMapping("/monster")
    public String getAll(Model model) {
        model.addAttribute("locations", locationService.getAll());
        model.addAttribute("monsters", monsterService.getAll());
        return "getMonsters";
    }

    @PostMapping("/monster")
    public String create(@ModelAttribute("monster") MonsterDTO monsterDTO,
                         @RequestParam(name = "chooseLocation") String chooseLocation,
                         @RequestParam("file") MultipartFile multipartFile) throws IOException {
        monsterDTO.setLocation(locationService.get(chooseLocation));
        monsterService.create(monsterDTO, multipartFile);
        return "redirect:/admin/control/monster";
    }

    @GetMapping("/monster/{name}/delete")
    public String deleteByName(@PathVariable("name") String name) {
        monsterService.deleteByName(name);
        return "redirect:/admin/control/monster";
    }

    @GetMapping("/monster/{name}/edit")
    public String getOne(Model model,
                         @PathVariable("name") String name) {
        MonsterDTO monsterDTO = monsterService.getByName(name);
        model.addAttribute("monster", monsterDTO);
        List<LocationDTO> locationDTOS = locationService.getAll();
        model.addAttribute("locations", locationDTOS);
        return "updateAdminMonster";
    }

    @PostMapping("/monster/{name}/edit/name")
    public String updateName(@PathVariable("name") String name,
                             @RequestParam("updateName") String updateName) {
        monsterService.updateName(name, updateName);
        return "redirect:/admin/control/monster/" + updateName + "/edit";
    }

    @PostMapping("/monster/{name}/edit/hp")
    public String updateHp(@PathVariable("name") String name,
                           @RequestParam("updateHp") Integer updateHp) {
        monsterService.updateHp(name, updateHp);
        return "redirect:/admin/control/monster/" + name + "/edit";
    }

    @PostMapping("/monster/{name}/edit/mp")
    public String updateMp(@PathVariable("name") String name,
                           @RequestParam("updateMp") Integer updateMp) {
        monsterService.updateMp(name, updateMp);
        return "redirect:/admin/control/monster/" + name + "/edit";
    }

    @PostMapping("/monster/{name}/edit/power")
    public String updatePower(@PathVariable("name") String name,
                              @RequestParam("updatePower") Integer updateLocation) {
        monsterService.updatePower(name, updateLocation);
        return "redirect:/admin/control/monster/" + name + "/edit";
    }

    @PostMapping("/monster/{name}/edit/location")
    public String updateLocation(@PathVariable("name") String name,
                                 @RequestParam("updateLocation") String updateLocation) {
        monsterService.updateLocation(name, updateLocation);
        return "redirect:/admin/control/monster/" + name + "/edit";
    }

    @PostMapping("/monster/{name}/edit/image")
    public String updateImage(@PathVariable("name") String name,
                              @RequestParam("updateImage") MultipartFile multipartFile) throws IOException {
        monsterService.updateImage(name, multipartFile);
        return "redirect:/admin/control/monster/" + name + "/edit";
    }

//    @GetMapping("/monster/edit/{name}")
//    public String editAndGetOne(Model model,
//                                @PathVariable("name") String name) {
//        MonsterDTO monsterDTO = monsterService.getByName(name);
//        model.addAttribute("monster", monsterDTO);
//        List<MonsterDTO> monsterDTOS = new ArrayList<>();
//        monsterDTOS.add(monsterDTO);
//        model.addAttribute("monsters", monsterDTOS);
//        List<LocationDTO> locationDTOList = locationService.getAll();
//        model.addAttribute("locations", locationDTOList);
//        return "getMonsters";
//    }
//
//    @PostMapping("/monster/edit/{name}")
//    public String editAndGetOne(@ModelAttribute("monster") MonsterDTO monsterDTO,
//                                @PathVariable("name") String name,
//                                @RequestParam(name = "choose", required = false) String choose) {
//        monsterService.edit(name, monsterDTO, choose);
//        return "redirect:/admin/control/monster";
//    }

    //    @GetMapping("/control")
//    public String control() {
//        return "controlMonsters";
//    }

//    @GetMapping("/get")
//    public String getAll(Model model) {
//        model.addAttribute("allMonster", monsterService.getAll());
//        return "getMonsters";
//    }
    //    @GetMapping("/get/{name}")
//    public String getByName(@PathVariable("name") String name, Model model) {
//        model.addAttribute("monsterDTO", monsterService.getByName(name));
//        return "getMonster";
//    }
}
