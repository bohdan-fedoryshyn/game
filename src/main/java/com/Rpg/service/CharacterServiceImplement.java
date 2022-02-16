package com.Rpg.service;

import com.Rpg.dto.CharacterDTO;

import com.Rpg.entity.Character;
import com.Rpg.repository.CharacterRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class CharacterServiceImplement implements CharacterService {

    @Value("${characters}")
    private String charactersPath;

    private CharacterRepository characterRepository;

    private ImageService imageService;

    @Autowired
    public CharacterServiceImplement(CharacterRepository characterRepository, ImageService imageService) {
        this.characterRepository = characterRepository;
        this.imageService = imageService;
    }

    private Character map(CharacterDTO characterDTO) {
        Character character = new Character();
        character.setName(characterDTO.getName());
        character.setHp(characterDTO.getHp());
        character.setMp(characterDTO.getMp());
        character.setPower(characterDTO.getPower());
        character.setImage(characterDTO.getImage());
        return character;
    }

    private CharacterDTO map(Character character) {
        CharacterDTO characterDTO = new CharacterDTO();
        characterDTO.setName(character.getName());
        characterDTO.setHp(character.getHp());
        characterDTO.setMp(character.getMp());
        characterDTO.setPower(character.getPower());
        characterDTO.setImage(character.getImage());
        return characterDTO;
    }

    private List<CharacterDTO> map(List<Character> characters) {
        List<CharacterDTO> characterDTOS = new ArrayList<>();
        for (Character character : characters) {
            characterDTOS.add(map(character));
        }
        return characterDTOS;
    }

    @Override
    public void create(CharacterDTO characterDTO, MultipartFile multipartFile) throws IOException {
        Character character = map(characterDTO);
        String resultFileName = imageService.saveFile(charactersPath, multipartFile);
        character.setImage(resultFileName);
        save(character);
    }

    private void save(Character character) {
        characterRepository.save(character);
    }

    @Override
    public CharacterDTO getByName(String name) {
        return map(findOne(name));
    }

    private Character findOne(String name) {
        return characterRepository.findByName(name);
    }

    @Override
    public List<CharacterDTO> getAll() {
        return map(findAll());
    }

    private List<Character> findAll() {
        return characterRepository.findAll();
    }

    @Override
    @Transactional
    public void deleteByName(String name) {
        if (imageService.deleteFile(charactersPath, findOne(name).getImage()))
            characterRepository.deleteByName(name);
    }

    @Override
    public Character get(String name) {
        return findOne(name);
    }

    @Override
    public void updateName(String name, String updateName) {
        Character character = findOne(name);
        character.setName(updateName);
        save(character);
    }

    @Override
    public void updateHp(String name, Integer updateHp) {
        Character character = findOne(name);
        character.setHp(updateHp);
        save(character);
    }

    @Override
    public void updateMp(String name, Integer updateMp) {
        Character character = findOne(name);
        character.setMp(updateMp);
        save(character);
    }

    @Override
    public void updatePower(String name, Integer updatePower) {
        Character character = findOne(name);
        character.setPower(updatePower);
        save(character);
    }

    @Override
    public void updateImage(String name, MultipartFile multipartFile) throws IOException {
        Character character = findOne(name);
        if (character.getImage() != null)
            imageService.deleteFile(charactersPath, character.getImage());

        character.setImage(imageService.saveFile(charactersPath, multipartFile));
        save(character);
    }

}
