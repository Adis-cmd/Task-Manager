package com.example.taskmanager.service.impl;

import com.example.taskmanager.repo.BoardColumnRepository;
import com.example.taskmanager.service.BoardColumnService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BoardColumnServiceImpl implements BoardColumnService {
    private final BoardColumnRepository repository;
}
