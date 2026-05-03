package com.example.taskmanager.mapper;


import com.example.taskmanager.dto.ProjectDto;
import com.example.taskmanager.dto.UserDto;
import com.example.taskmanager.entity.project.Project;
import com.example.taskmanager.entity.project.ProjectMember;
import com.example.taskmanager.entity.user.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ProjectMapper {

    public ProjectDto toProjectDto(ProjectMember projectMember) {
        Project project = projectMember.getProject();
        User leader = project.getLeader();
        return ProjectDto.builder()
                .id(project.getId())
                .name(project.getName())
                .leader(UserDto.builder()
                        .id(leader.getId())
                        .name(leader.getName())
                        .avatar(leader.getAvatar())
                        .build())
                .userRole(projectMember.getRole().name())
                .build();
    }

    public ProjectDto toProjectDto(Project project) {
        return ProjectDto.builder()
                .id(project.getId())
                .name(project.getName())
                .leader(UserDto.builder()
                        .id(project.getLeader().getId())
                        .name(project.getLeader().getName())
                        .avatar(project.getLeader().getAvatar())
                        .build())
                .build();
    }

}