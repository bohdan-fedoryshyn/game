package com.Rpg.service;

import com.Rpg.dto.HeroDTO;
import com.Rpg.dto.MonsterDTO;
import com.Rpg.entity.Monster;
import com.Rpg.repository.MonsterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class MonsterServiceImplement implements MonsterService {

    @Value("${monsters}")
    private String monstersPath;

    private MonsterRepository monsterRepository;

    private LocationService locationService;

    private ImageService imageService;

    @Autowired
    public MonsterServiceImplement(MonsterRepository monsterRepository, LocationService locationService, ImageService imageService) {
        this.monsterRepository = monsterRepository;
        this.locationService = locationService;
        this.imageService = imageService;
    }

    private Monster map(MonsterDTO monsterDTO) {
        Monster monster = new Monster();
        monster.setName(monsterDTO.getName());
        monster.setHp(monsterDTO.getHp());
        monster.setCurrentHp(monsterDTO.getCurrentHp());
        monster.setMp(monsterDTO.getMp());
        monster.setPower(monsterDTO.getPower());
        monster.setLocation(monsterDTO.getLocation());
        monster.setImage(monsterDTO.getImage());
        return monster;
    }

    private MonsterDTO map(Monster monster) {
        MonsterDTO monsterDTO = new MonsterDTO();
        monsterDTO.setName(monster.getName());
        monsterDTO.setHp(monster.getHp());
        monsterDTO.setCurrentHp(monster.getCurrentHp());
        monsterDTO.setMp(monster.getMp());
        monsterDTO.setPower(monster.getPower());
        monsterDTO.setLocation(monster.getLocation());
        monsterDTO.setImage(monster.getImage());
        return monsterDTO;
    }

    private List<MonsterDTO> map(List<Monster> monsters) {
        List<MonsterDTO> monsterDTOS = new ArrayList<>();
        for (Monster monster : monsters) {
            monsterDTOS.add(map(monster));
        }
        return monsterDTOS;
    }

    @Override
    public void create(MonsterDTO monsterDTO, MultipartFile multipartFile) throws IOException {
        Monster monster = map(monsterDTO);
        String resultFilename = imageService.saveFile(monstersPath, multipartFile);
        monster.setImage(resultFilename);
        save(monster);
    }

    private void save(Monster monster) {
        monsterRepository.save(monster);
    }

    @Override
    public MonsterDTO getByName(String name) {
        return map(findOne(name));
    }

    private Monster findOne(String name) {
        return monsterRepository.findByName(name);
    }

    @Override
    public List<MonsterDTO> getAll() {
        return map(findAll());
    }

    private List<Monster> findAll() {
        return monsterRepository.findAll();
    }

    @Override
    @Transactional
    public void deleteByName(String name) {
        if (imageService.deleteFile(monstersPath, findOne(name).getImage()))
            monsterRepository.deleteByName(name);
    }

    @Override
    public MonsterDTO monsterInMemory(List<MonsterDTO> monsters) {
        for (MonsterDTO monster : monsters) {
            if (monster.getCurrentHp() > 0) {
                return monster;
            }
        }
        return null;
    }

    @Override
    public List<MonsterDTO> get(List<Monster> monsterDTOS) {
        return map(monsterDTOS);
    }

    @Override
    public void kick(HeroDTO heroDTO, MonsterDTO monsterDTO) {
        if (heroDTO.getCurrentHp() > 0) {
            monsterDTO.setCurrentHp(monsterDTO.getCurrentHp() - heroDTO.getCharacter().getPower());
        }

        saving(monsterDTO);
    }

    @Override
    public void saving(MonsterDTO monsterDTO) {
        Monster monster = findOne(monsterDTO.getName());
        monster.setCurrentHp(monsterDTO.getCurrentHp());
        save(monster);
    }

    @Override
    public void updateName(String name, String updateName) {
        Monster monster = findOne(name);
        monster.setName(updateName);
        save(monster);
    }

    @Override
    public void updateHp(String name, Integer updateHp) {
        Monster monster = findOne(name);
        monster.setHp(updateHp);
        save(monster);
    }

    @Override
    public void updateMp(String name, Integer updateMp) {
        Monster monster = findOne(name);
        monster.setMp(updateMp);
        save(monster);
    }

    @Override
    public void updatePower(String name, Integer updatePower) {
        Monster monster = findOne(name);
        monster.setPower(updatePower);
        save(monster);
    }

    @Override
    public void updateLocation(String name, String updateLocation) {
        Monster monster = findOne(name);
        monster.setLocation(locationService.get(updateLocation));
        save(monster);
    }

    @Override
    public void updateImage(String name, MultipartFile multipartFile) throws IOException {
        Monster monster = findOne(name);
        if (monster.getImage() != null && !monster.getImage().isEmpty())
            imageService.deleteFile(monstersPath, monster.getImage());
        monster.setImage(imageService.saveFile(monstersPath, multipartFile));
        save(monster);
    }

    @Override
    public void monstersAlive(List<MonsterDTO> monsterDTOS) {
        for (MonsterDTO monsterDTO : monsterDTOS) {
            monsterDTO.setCurrentHp(monsterDTO.getHp());
            saving(monsterDTO);
        }
    }
}


