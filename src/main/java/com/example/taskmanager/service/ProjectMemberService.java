package com.example.taskmanager.service;

import com.example.taskmanager.entity.project.ProjectMember;

import java.util.List;

public interface ProjectMemberService {
    List<ProjectMember> findAllProjectWithUser(Long userId);
}
