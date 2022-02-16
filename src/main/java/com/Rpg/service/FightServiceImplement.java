package com.Rpg.service;

import com.Rpg.dto.HeroDTO;
import com.Rpg.dto.MonsterDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FightServiceImplement implements FightService {

    private HeroService heroService;

    private MonsterService monsterService;

    @Autowired
    public FightServiceImplement(HeroService heroService, MonsterService monsterService) {
        this.heroService = heroService;
        this.monsterService = monsterService;
    }

    @Override
    public void fight(HeroDTO hero, MonsterDTO monster) {
        monsterService.kick(hero, monster);
        if (monster.getCurrentHp() > 0) {
            heroService.kick(hero, monster);

        }
    }
}
