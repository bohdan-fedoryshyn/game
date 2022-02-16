package com.Rpg.entity;

import lombok.*;

import javax.persistence.*;
import java.util.List;
import java.util.Objects;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "characters")
public class Character {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name", unique = true, nullable = false)
    private String name;

    @Column(name = "hp", nullable = false)
    private Integer hp;

    @Column(name = "mp", nullable = false)
    private Integer mp;

    @Column(name = "power", nullable = false)
    private Integer power;

    @Column(name = "image", unique = true, nullable = false)
    private String image;

    @OneToMany(mappedBy = "character", cascade=CascadeType.ALL)
    private List<Hero> heroes;


}
