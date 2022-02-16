package com.Rpg.controller;

import com.Rpg.dto.CharacterDTO;
import com.Rpg.dto.HeroDTO;
import com.Rpg.dto.UserDTO;
import com.Rpg.entity.Hero;
import com.Rpg.entity.User;
import com.Rpg.service.CharacterService;
import com.Rpg.service.HeroService;
import com.Rpg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("{userName}/hero")
public class HeroController {

    private HeroService heroService;


    private CharacterService characterService;

    @Autowired
    public HeroController(HeroService heroService, CharacterService characterService) {
        this.heroService = heroService;

        this.characterService = characterService;
    }

    @ModelAttribute("hero")
    public HeroDTO getModel() {
        return new HeroDTO();
    }

    @GetMapping("/create")
    public String create(Model model) {
        model.addAttribute("characters", characterService.getAll());
        return "createHero";
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("hero") HeroDTO heroDTO,
                         @RequestParam(name = "chooseCharacter") String chooseCharacter,
                         @PathVariable("userName") String name) {
        heroService.create(heroDTO, chooseCharacter, name);
        return "redirect:/" + name + "/hero/choose";
    }

    @GetMapping("/choose")
    public String choose(Model model,
                         @PathVariable("userName") String name) {
        model.addAttribute("userName", name);
        model.addAttribute("heroes", heroService.getHeroesByUserName(name));
        return "chooseHero";
    }

    @PostMapping("/choose")
    public String choose(@RequestParam(name = "chooseHero") String chooseHero,
                         @PathVariable("userName") String name) {
        return "redirect:/" + name + "/hero/" + chooseHero + "/lobby";
    }


    @GetMapping("/{heroName}/lobby")
    public String lobby(@PathVariable("heroName") String name,
                        Model model) {
        HeroDTO hero = heroService.getByName(name);
        model.addAttribute("hero", hero);
        heroService.heroAlive(hero);
        return "lobby";
    }

    @GetMapping("/delete/{name}")
    public String delete(@PathVariable("name") String name,
                         @PathVariable("userName") String userName) {
        heroService.deleteByName(name);
        return "redirect:/" + userName + "/hero/choose";
    }

    @GetMapping("/edit/{name}")
    public String editAndGetOne(Model model,
                                @PathVariable("name") String name) {
        HeroDTO heroDTO = heroService.getByName(name);
        model.addAttribute("hero", heroDTO);
        return "editHero";
    }

    @PostMapping("/edit/{name}/name")
    public String editAndGetOne(@PathVariable("name") String name,
                                @PathVariable("userName") String userName,
                                @RequestParam("editName") String editName) {
        heroService.updateName(name, editName);
        return "redirect:/" + userName + "/hero/edit/" + editName;
    }


}
