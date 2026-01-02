package com.example.taskmanager.service;

import com.example.taskmanager.entity.ProjectMember;

import java.util.List;

public interface ProjectMemberService {
    List<ProjectMember> findAllProjectWithUser(Long userId);
}
