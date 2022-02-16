package com.Rpg.dto;

import com.Rpg.entity.Location;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MonsterDTO {

    private Long id;

    private String name;

    private Integer hp;

    private Integer currentHp;

    private Integer mp;

    private Integer power;

    private Location location;

    private String image;
}
