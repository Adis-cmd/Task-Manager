package com.example.taskmanager.service;

import com.example.taskmanager.dto.AuthRegisterDto;
import com.example.taskmanager.entity.User;

public interface UserService {
    void saveUser(AuthRegisterDto dto);

    User findByEmail(String email);
}
