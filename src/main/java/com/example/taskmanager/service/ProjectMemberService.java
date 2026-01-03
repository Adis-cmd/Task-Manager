package com.example.taskmanager.service;

import com.example.taskmanager.dto.ProjectUserDto;
import com.example.taskmanager.entity.project.ProjectMember;

import java.util.List;

public interface ProjectMemberService {
    List<ProjectMember> findAllProjectWithUser(Long userId);

    List<ProjectUserDto> getUsersForProject(Long projectId);

    void save(ProjectMember projectMember);
}
