package com.Rpg.service;

import com.Rpg.dto.UserDTO;
import com.Rpg.entity.User;

import java.util.List;

public interface UserService {

    User registration(UserDTO userDTO);

    UserDTO getByName(String name);

    List<UserDTO> getAll();

    void deleteByName(String name);

    User get(String name);

}
