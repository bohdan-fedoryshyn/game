package com.Rpg.controller;

import com.Rpg.dto.HeroDTO;
import com.Rpg.dto.MonsterDTO;
import com.Rpg.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("{userName}/hero/{heroName}/location")
public class FightController {

    private HeroService heroService;

    private LocationService locationService;

    private FightService fightService;

    private MonsterService monsterService;

    @Autowired
    public FightController(HeroService heroService, LocationService locationService, FightService fightService, MonsterService monsterService) {
        this.heroService = heroService;
        this.locationService = locationService;
        this.fightService = fightService;
        this.monsterService = monsterService;
    }


    @GetMapping("/{locationName}/fight")
    public String fight(@PathVariable("heroName") String heroName,
                        @PathVariable("userName") String userName,
                        @PathVariable("locationName") String locationName,
                        Model model) {


        HeroDTO hero = heroService.getByName(heroName);
        List<MonsterDTO> monsters = monsterService.get(locationService.getByName(locationName).getMonsters());
        MonsterDTO monster = monsterService.monsterInMemory(monsters);

        model.addAttribute("hero", hero);
        model.addAttribute("location", locationService.getByName(locationName));
        model.addAttribute("monster", monster);

        if (monster == null || hero.getCurrentHp() <= 0) {
            monsterService.monstersAlive(monsters);
            heroService.heroAlive(hero);
            return "redirect:/" + userName + "/hero/" + heroName + "/lobby";
        }
        return "fight";

    }


    @PostMapping("/{locationName}/fight")
    public String fight(@PathVariable("heroName") String heroName,
                        @PathVariable("userName") String userName,
                        @PathVariable("locationName") String locationName,
                        @RequestParam(name = "choose") String choose) {

        HeroDTO hero = heroService.getByName(heroName);
        List<MonsterDTO> monsters = monsterService.get(locationService.getByName(locationName).getMonsters());

        MonsterDTO monster = monsterService.monsterInMemory(monsters);
        if (choose.equals("kick")) {
            fightService.fight(hero, monster);
        }
        return "redirect:/" + userName + "/hero/" + heroName + "/location/" + locationName + "/fight";

    }

    @PostMapping("/{locationName}/fight/kick")
    public String kick(){

        return "redirect";
    }

}
