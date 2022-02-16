package com.Rpg.service;

import com.Rpg.dto.HeroDTO;
import com.Rpg.dto.MonsterDTO;
import com.Rpg.entity.*;
import com.Rpg.repository.HeroRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class HeroServiceImplement implements HeroService {

    private HeroRepository heroRepository;

    private CharacterService characterService;

    private UserService userService;

    @Autowired
    public HeroServiceImplement(HeroRepository heroRepository, CharacterService characterService, UserService userService) {
        this.heroRepository = heroRepository;
        this.characterService = characterService;
        this.userService = userService;
    }

    private Hero map(HeroDTO heroDTO) {
        Hero hero = new Hero();
        hero.setName(heroDTO.getName());
        hero.setCurrentHp(heroDTO.getCurrentHp());
        hero.setCharacter(heroDTO.getCharacter());
        hero.setUser(heroDTO.getUser());
        return hero;
    }

    private HeroDTO map(Hero hero) {
        HeroDTO heroDTO = new HeroDTO();
        heroDTO.setName(hero.getName());
        heroDTO.setCurrentHp(hero.getCurrentHp());
        heroDTO.setCharacter(hero.getCharacter());
        heroDTO.setUser(hero.getUser());
        return heroDTO;
    }

    private List<HeroDTO> map(List<Hero> heroes) {
        List<HeroDTO> heroDtos = new ArrayList<>();
        for (Hero hero : heroes) {
            heroDtos.add(map(hero));
        }
        return heroDtos;
    }

    @Override
    public void create(HeroDTO heroDTO, String chooseCharacter, String name) {
        heroDTO.setCharacter(characterService.get(chooseCharacter));
        heroDTO.setUser(userService.get(name));
        save(map(heroDTO));
    }

    private void save(Hero hero) {
        heroRepository.save(hero);
    }

    @Override
    public HeroDTO getByName(String name) {
        return map(findOne(name));
    }

    private Hero findOne(String name) {
        return heroRepository.findByName(name);
    }

    @Override
    public List<HeroDTO> getAll() {
        return map(findAll());
    }

    private List<Hero> findAll() {
        return heroRepository.findAll();
    }

    @Override
    @Transactional
    public void deleteByName(String name) {
        heroRepository.deleteByName(name);
    }

    @Override
    public List<HeroDTO> getHeroesByUserName(String name) {
        return map(findAllByUserLogin(name));
    }

    private List<Hero> findAllByUserLogin(String name) {
        return heroRepository.findAllByUserLogin(name);
    }

    @Override
    public Hero get(String name) {
        return findOne(name);
    }

    @Override
    public void saving(HeroDTO heroDTO) {
        Hero hero = findOne(heroDTO.getName());
        hero.setCurrentHp(heroDTO.getCurrentHp());
        save(hero);
    }

    @Override
    public void kick(HeroDTO heroDTO, MonsterDTO monsterDTO) {

        if (heroDTO.getCurrentHp() > 0) {
            heroDTO.setCurrentHp(heroDTO.getCurrentHp() - monsterDTO.getPower());
        }
        saving(heroDTO);
    }

    @Override
    public void heroAlive(HeroDTO heroDTO) {
        heroDTO.setCurrentHp(heroDTO.getCharacter().getHp());
        saving(heroDTO);
    }

    @Override
    public void updateName(String name, String editName) {
        Hero hero = findOne(name);
        hero.setName(editName);
        save(hero);
    }

    @Override
    public void updateCharacter(String name, String editCharacter) {
        Hero hero = findOne(name);
        hero.setCharacter(characterService.get(editCharacter));
        save(hero);
    }

    @Override
    public void updateUser(String name, String editUser) {
        Hero hero = findOne(name);
        hero.setUser(userService.get(editUser));
        save(hero);
    }

}
