package com.example.taskmanager.service.impl;

import com.example.taskmanager.repo.CommentRepository;
import com.example.taskmanager.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class CommentServiceImpl implements CommentService {
    private final CommentRepository commentRepository;
}
