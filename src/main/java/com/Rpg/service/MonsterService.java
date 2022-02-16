package com.Rpg.service;

import com.Rpg.dto.HeroDTO;
import com.Rpg.dto.MonsterDTO;
import com.Rpg.entity.Monster;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface MonsterService {

    void create(MonsterDTO monsterDTO, MultipartFile multipartFile) throws IOException;

    MonsterDTO getByName(String name);

    List<MonsterDTO> getAll();

    void deleteByName(String name);

    void kick(HeroDTO hero, MonsterDTO monster);

    MonsterDTO monsterInMemory(List<MonsterDTO> monsterDTOS);

    List<MonsterDTO> get(List<Monster> monster);

    void saving(MonsterDTO monsterDTO);

    void monstersAlive(List<MonsterDTO> monsterDTOS);

    void updateName(String name, String updateName);

    void updateHp(String name, Integer updateHp);

    void updateMp(String name, Integer updateMp);

    void updatePower(String name, Integer updatePower);

    void updateLocation(String name, String updateLocation);

    void updateImage(String name, MultipartFile multipartFile) throws IOException;

}
