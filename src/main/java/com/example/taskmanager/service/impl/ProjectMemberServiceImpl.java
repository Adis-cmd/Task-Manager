package com.example.taskmanager.service.impl;

import com.example.taskmanager.entity.ProjectMember;
import com.example.taskmanager.repo.ProjectMemberRepository;
import com.example.taskmanager.service.ProjectMemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProjectMemberServiceImpl implements ProjectMemberService {
    private final ProjectMemberRepository repository;

    @Override
    public List<ProjectMember> findAllProjectWithUser(Long userId) {
        return repository.findByUserId(userId);
    }
}
