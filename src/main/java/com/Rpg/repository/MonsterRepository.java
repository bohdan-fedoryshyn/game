package com.Rpg.repository;

import com.Rpg.entity.Monster;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MonsterRepository extends JpaRepository<Monster, Long> {

    Monster findByName(String name);

    void deleteByName(String name);

}
