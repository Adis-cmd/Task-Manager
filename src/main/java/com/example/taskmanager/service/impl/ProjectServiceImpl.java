package com.example.taskmanager.service.impl;

import com.example.taskmanager.entity.enums.Role;
import com.example.taskmanager.entity.project.Project;
import com.example.taskmanager.entity.project.ProjectMember;
import com.example.taskmanager.entity.user.User;
import com.example.taskmanager.repo.ProjectRepository;
import com.example.taskmanager.service.ProjectMemberService;
import com.example.taskmanager.service.ProjectService;
import com.example.taskmanager.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {

    private final ProjectRepository repository;
    private final UserService userService;
    private final ProjectMemberService projectMemberService;

    @Override
    @Transactional
    public void createProject(String email, String name) {
        User user = userService.findByEmail(email);

        Project project = Project.builder()
                .name(name)
                .leader(user)
                .build();

        ProjectMember leaderMember = ProjectMember.builder()
                .user(user)
                .project(project)
                .role(Role.LEADER)
                .build();

        project.getMembers().add(leaderMember);
        repository.save(project);
    }
}