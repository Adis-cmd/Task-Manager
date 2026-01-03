package com.example.taskmanager.service;

import com.example.taskmanager.dto.AuthRegisterDto;
import com.example.taskmanager.dto.ViewProfileDto;
import com.example.taskmanager.entity.user.User;
import org.springframework.http.ResponseEntity;

public interface UserService {
    void saveUser(AuthRegisterDto dto);

    User findByEmail(String email);

    ResponseEntity<?> findByName(String imageName);

    ViewProfileDto profile(String email);
}
