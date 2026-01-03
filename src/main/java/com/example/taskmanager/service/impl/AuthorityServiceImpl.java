package com.example.taskmanager.service.impl;

import com.example.taskmanager.entity.user.Authority;
import com.example.taskmanager.exception.AuthorityNotFoundException;
import com.example.taskmanager.repo.AuthorityRepository;
import com.example.taskmanager.service.AuthorityService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthorityServiceImpl implements AuthorityService {

    private final AuthorityRepository authorityRepository;

    @Override
    public Authority findAuthorityByName(String name) {
        return authorityRepository.findAuthorityByName(name)
                .orElseThrow(() -> new AuthorityNotFoundException("Authority not found"));
    }
}
