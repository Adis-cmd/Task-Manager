package com.example.taskmanager.service;

import com.example.taskmanager.dto.AddProjectMemberRequest;
import com.example.taskmanager.dto.ProjectDetailDto;
import com.example.taskmanager.dto.ProjectDto;
import com.example.taskmanager.entity.project.Project;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.transaction.annotation.Transactional;

public interface ProjectService {
    void createProject(String email, String name);

    ProjectDetailDto detailProject(Long id);

    Project findById(Long projectId);

    @Transactional
    void addMemberForProject(AddProjectMemberRequest request, String email);

    Page<ProjectDto> getProjectByEmail(String email, Pageable pageable);
}
