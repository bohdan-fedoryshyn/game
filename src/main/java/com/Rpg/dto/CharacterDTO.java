package com.Rpg.dto;

import com.Rpg.entity.Hero;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Objects;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CharacterDTO {

    private Long id;

    private String name;

    private Integer hp;

    private Integer mp;

    private Integer power;

    private String image;

    private List<Hero> heroes;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CharacterDTO that = (CharacterDTO) o;
        return Objects.equals(name, that.name) &&
                Objects.equals(hp, that.hp) &&
                Objects.equals(mp, that.mp) &&
                Objects.equals(power, that.power);
    }

    @Override
    public int hashCode() {

        return Objects.hash(name, hp, mp, power);
    }
}
