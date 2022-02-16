package com.Rpg.controller;

import com.Rpg.dto.CharacterDTO;
import com.Rpg.dto.HeroDTO;
import com.Rpg.dto.UserDTO;
import com.Rpg.entity.Hero;
import com.Rpg.service.CharacterService;
import com.Rpg.service.HeroService;
import com.Rpg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/control")
public class AdminHeroController {

    private HeroService heroService;

    private UserService userService;

    private CharacterService characterService;

    @Autowired
    public AdminHeroController(HeroService heroService, UserService userService, CharacterService characterService) {
        this.heroService = heroService;
        this.userService = userService;
        this.characterService = characterService;
    }

    @ModelAttribute("hero")
    public HeroDTO getModel() {
        return new HeroDTO();
    }

    @GetMapping("/hero")
    public String createAndGetAll(Model model) {
        model.addAttribute("heroes", heroService.getAll());
        model.addAttribute("characters", characterService.getAll());
        model.addAttribute("users", userService.getAll());
        return "getHeroes";
    }

    @PostMapping("/hero")
    public String createAndGetAll(@ModelAttribute("createHero") HeroDTO heroDTO,
                                  @RequestParam(name = "chooseCharacter") String chooseCharacter,
                                  @RequestParam(name = "chooseUser") String chooseUser) {
        heroService.create(heroDTO, chooseCharacter, chooseUser);
        return "redirect:/admin/control/hero";
    }

    @GetMapping("/hero/delete/{name}")
    public String delete(@PathVariable("name") String name) {
        heroService.deleteByName(name);
        return "redirect:/admin/control/hero";
    }


    @GetMapping("/hero/{name}/edit")
    public String update(Model model,
                         @PathVariable("name") String name) {
        HeroDTO heroDTO = heroService.getByName(name);
        model.addAttribute("hero", heroDTO);
        List<CharacterDTO> characterDTOS = characterService.getAll();
        model.addAttribute("characters", characterDTOS);
        List<UserDTO> userDTOS = userService.getAll();
        model.addAttribute("users", userDTOS);
        return "updateAdminHero";
    }

    @PostMapping("/hero/{name}/edit/name")
    public String updateName(@PathVariable("name") String name,
                             @RequestParam("updateName") String updateName) {
        heroService.updateName(name, updateName);
        return "redirect:/admin/control/hero/" + updateName + "/edit";
    }

    @PostMapping("/hero/{name}/edit/character")
    public String updateCharacter(@PathVariable("name") String name,
                                  @RequestParam("updateCharacter") String updateCharacter) {
        heroService.updateCharacter(name, updateCharacter);
        return "redirect:/admin/control/hero/" + name + "/edit";
    }

    @PostMapping("/hero/{name}/edit/user")
    public String updateUser(@PathVariable("name") String name,
                             @RequestParam("updateUser") String updateUser) {
        heroService.updateUser(name, updateUser);
        return "redirect:/admin/control/hero/" + name + "/edit";
    }

}
