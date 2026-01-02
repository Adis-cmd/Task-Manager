package com.example.taskmanager.service;


import com.example.taskmanager.entity.Authority;

public interface AuthorityService {
    Authority findAuthorityByName(String name);
}
