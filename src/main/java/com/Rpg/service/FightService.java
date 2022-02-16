package com.Rpg.service;

import com.Rpg.dto.HeroDTO;
import com.Rpg.dto.MonsterDTO;
import org.springframework.stereotype.Service;

@Service
public interface FightService {

    void fight(HeroDTO hero, MonsterDTO monster);

}
