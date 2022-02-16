package com.Rpg.controller;


import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller

@RequestMapping("/admin")
public class AdminControlPanel {

    @GetMapping("/control")
    public String adminCharacter(){
        return "admin";
    }

    @PostMapping("/control")
    public String control(@RequestParam("choose") String choose){
        return "redirect:/admin/control/" + choose;
    }
}
