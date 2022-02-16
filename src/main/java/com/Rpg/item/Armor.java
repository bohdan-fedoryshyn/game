package com.Rpg.item;

import java.util.HashMap;
import java.util.Map;

public class Armor {
    private String armorName;
    private int armor;

    Map<String, Armor> armorMap = new HashMap<>();

    public Armor() {
    }

    public Armor(String armorName, int armor) {
        this.armorName = armorName;
        this.armor = armor;
    }

    public String getArmorName() {
        return armorName;
    }

    public void setArmorName(String armorName) {
        this.armorName = armorName;
    }

    public int getArmor() {
        return armor;
    }

    public void setArmor(int armor) {
        this.armor = armor;
    }

}

