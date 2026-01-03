package com.example.taskmanager.service;

import com.example.taskmanager.dto.AddProjectMemberRequest;
import com.example.taskmanager.dto.ProjectDetailDto;
import com.example.taskmanager.entity.project.Project;
import org.springframework.transaction.annotation.Transactional;

public interface ProjectService {
    void createProject(String email, String name);

    ProjectDetailDto detailProject(Long id);

    Project findById(Long projectId);

    @Transactional
    void addMemberForProject(AddProjectMemberRequest request, String email);
}
