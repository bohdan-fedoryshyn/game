package com.Rpg.repository;

import com.Rpg.entity.Character;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CharacterRepository extends JpaRepository<Character, Long> {

    Character findByName(String name);

    void deleteByName(String name);



}
