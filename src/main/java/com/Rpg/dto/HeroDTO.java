package com.Rpg.dto;

import com.Rpg.entity.Character;
import com.Rpg.entity.User;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class HeroDTO {

    private Long id;

    private String name;

    private Integer currentHp;

    private Character character;

    private User user;

}
