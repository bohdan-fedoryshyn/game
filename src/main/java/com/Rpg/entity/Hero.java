package com.Rpg.entity;

import lombok.*;

import javax.persistence.*;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "heroes")
public class Hero {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name", unique = true, nullable = false)
    private String name;

    @Column(name = "currentHp", nullable = false)
    private Integer currentHp;

//    @Column(name = "hp")
//    private Integer hp;
//
//    @Column(name = "mp")
//    private Integer mp;

    @ManyToOne
    private Character character;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;


    @PrePersist
    public void onCreate(){
        this.currentHp = character.getHp();
    }

}
