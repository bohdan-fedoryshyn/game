package com.Rpg.controller;

import com.Rpg.dto.CharacterDTO;
import com.Rpg.service.CharacterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequestMapping("/admin/control")
public class AdminCharacterController {

    private CharacterService characterService;

    @Autowired
    public AdminCharacterController(CharacterService characterService) {
        this.characterService = characterService;
    }

    @ModelAttribute("character")
    public CharacterDTO getModel() {
        return new CharacterDTO();
    }

    @GetMapping("/character")
    public String getAll(Model model) {
        model.addAttribute("characters", characterService.getAll());
        return "getCharacters";
    }

    @PostMapping("/character")
    public String create(@ModelAttribute(name = "character") CharacterDTO characterDTO,
                         @RequestParam(name = "file") MultipartFile image) throws IOException {
        characterService.create(characterDTO, image);

        return "redirect:/admin/control/character";
    }

    @GetMapping("/character/{name}/delete")
    public String delete(@PathVariable("name") String name) {
        characterService.deleteByName(name);
        return "redirect:/admin/control/character";
    }

    @GetMapping("/character/{name}/edit")
    public String update(Model model,
                         @PathVariable("name") String name) {
        CharacterDTO characterDTO = characterService.getByName(name);
        model.addAttribute("character", characterDTO);
        return "updateAdminCharacter";
    }

    @PostMapping("/character/{name}/edit/name")
    public String updateName(@PathVariable("name") String name,
                             @RequestParam("updateName") String updateName) {
        characterService.updateName(name, updateName);
        return "redirect:/admin/control/character/" + updateName + "/edit";
    }

    @PostMapping("/character/{name}/edit/hp")
    public String updateHp(@PathVariable("name") String name,
                           @RequestParam("updateHp") Integer updateHp) {
        characterService.updateHp(name, updateHp);
        return "redirect:/admin/control/character/" + name + "/edit";
    }

    @PostMapping("/character/{name}/edit/mp")
    public String updateMp(@PathVariable("name") String name,
                           @RequestParam("updateMp") Integer updateMp) {
        characterService.updateMp(name, updateMp);
        return "redirect:/admin/control/character/" + name + "/edit";
    }

    @PostMapping("/character/{name}/edit/power")
    public String updatePower(@PathVariable("name") String name,
                              @RequestParam("updatePower") Integer updatePower) {
        characterService.updatePower(name, updatePower);
        return "redirect:/admin/control/character/" + name + "/edit";
    }

    @PostMapping("/character/{name}/edit/image")
    public String updateImage(@PathVariable("name") String name,
                              @RequestParam("updateImage") MultipartFile multipartFile) throws IOException {
        characterService.updateImage(name, multipartFile);
        return "redirect:/admin/control/character/" + name + "/edit";
    }

}
