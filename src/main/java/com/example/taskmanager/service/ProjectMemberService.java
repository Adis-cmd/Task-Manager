package com.example.taskmanager.service;

import com.example.taskmanager.dto.ProjectUserDto;
import com.example.taskmanager.entity.project.Project;
import com.example.taskmanager.entity.project.ProjectMember;
import com.example.taskmanager.entity.user.User;

import java.util.List;

public interface ProjectMemberService {
    List<ProjectMember> findAllProjectWithUser(Long userId);

    List<ProjectUserDto> getUsersForProject(Long projectId);

    void save(ProjectMember projectMember);

    void checkTaskEditPermission(User user, Project project);
}
