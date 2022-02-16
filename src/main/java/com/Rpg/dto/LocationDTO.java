package com.Rpg.dto;

import com.Rpg.entity.Monster;
import lombok.*;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class LocationDTO {

    private Long id;

    private String name;

    private List<Monster> monsters;

    private String image;

}
