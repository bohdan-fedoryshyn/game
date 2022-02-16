package com.Rpg.repository;

import com.Rpg.entity.Hero;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HeroRepository extends JpaRepository<Hero, Long> {

    Hero findByName(String name);

    void deleteByName(String name);

    List<Hero> findAllByUserLogin(String name);

}
