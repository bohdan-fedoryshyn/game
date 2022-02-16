package com.Rpg.entity;

import lombok.*;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "monsters")
public class Monster {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name",unique = true, nullable = false)
    private String name;

    @Column(name = "hp", nullable = false)
    private Integer hp;

    @Column(name = "mp", nullable = false)
    private Integer mp;

    @Column(name = "power",nullable = false)
    private Integer power;

    @Column(name = "currentHp", nullable = false)
    private Integer currentHp;

    @ManyToOne
    @JoinColumn(name = "location_id", nullable = false)
    private Location location;

    @Column(name = "image", nullable = false)
    private String image;

    @PrePersist
    public void onCreate(){
        this.currentHp = hp;
    }

    //    @PrePersist
//    public void onCreate(){
//        this.currentHp = monsterHP;
//    }

}
