package com.Rpg.service;

import com.Rpg.dto.UserDTO;
import com.Rpg.entity.Role;
import com.Rpg.entity.User;
import com.Rpg.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("userDetailsService")
public class UserServiceImplement implements UserService, UserDetailsService {

    private UserRepository userRepository;

    private PasswordEncoder passwordEncoder;

    @Autowired
    public UserServiceImplement(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    private User map(UserDTO userDTO) {
        User user = new User();
        user.setLogin(userDTO.getLogin());
        return user;
    }

    private UserDTO map(User user) {
        UserDTO userDTO = new UserDTO();
        userDTO.setLogin(user.getLogin());
        return userDTO;
    }

    private List<UserDTO> map(List<User> users) {
        List<UserDTO> userDTOS = new ArrayList<>();
        for (User user : users) {
            userDTOS.add(map(user));
        }
        return userDTOS;
    }

    @Override
    public User registration(UserDTO userDTO) {
        if (!registrationValidation(userDTO)) ;
        User user = new User();
        user.setPassword(passwordEncoder.encode(userDTO.getPassword()));
        user.setLogin(userDTO.getLogin());
        if (userDTO.getLogin().equals("admin")) user.setRole(Role.ADMIN);
        else user.setRole(Role.USER);
        return save(user);
    }

    private User save(User user) {
        return userRepository.save(user);
    }

    @Override
    public UserDTO getByName(String name) {
        return map(findOne(name));
    }

    private User findOne(String name) {
        return userRepository.findUserByLogin(name);
    }

    @Override
    public List<UserDTO> getAll() {
        return map(findAll());
    }

    private List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public void deleteByName(String name) {
        userRepository.deleteByLogin(name);
    }

    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        User byName = userRepository.findUserByLogin(s);
        ArrayList<SimpleGrantedAuthority> simpleGrantedAuthorities = new ArrayList<>();
        simpleGrantedAuthorities.add(new SimpleGrantedAuthority("ROLE_" + byName.getRole().toString()));
        return new org.springframework.security.core.userdetails.User(
                byName.getLogin(),
                byName.getPassword(),
                simpleGrantedAuthorities
        );
    }

    private Boolean registrationValidation(UserDTO userDTO) {
        if (!userDTO.getPassword().equals(userDTO.getPasswordRepeat())) return false;
        if (userRepository.countByLogin(userDTO.getLogin()) > 0) return false;
        return true;
    }

    @Override
    public User get(String name) {
        return findOne(name);
    }
}
