package com.Rpg.service;

import com.Rpg.dto.HeroDTO;
import com.Rpg.dto.MonsterDTO;
import com.Rpg.entity.Hero;

import java.util.List;

public interface HeroService {

    void create(HeroDTO heroDTO, String chooseCharacter, String name);

    HeroDTO getByName(String name);

    List<HeroDTO> getAll();

    void deleteByName(String name);

    List<HeroDTO> getHeroesByUserName(String name);

    void kick(HeroDTO heroDTO, MonsterDTO monster);

    Hero get(String name);

    void saving(HeroDTO heroDTO);

    void heroAlive(HeroDTO heroDTO);

    void updateName(String name, String editName);

    void updateCharacter(String name, String editCharacter);

    void updateUser(String name, String updateUser);

//    Hero getOneWithHeroBonus(Integer id);

}
