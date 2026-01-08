package com.example.taskmanager.service.impl;

import com.example.taskmanager.dto.ProjectUserDto;
import com.example.taskmanager.entity.enums.Role;
import com.example.taskmanager.entity.project.Project;
import com.example.taskmanager.entity.project.ProjectMember;
import com.example.taskmanager.entity.user.User;
import com.example.taskmanager.exception.ProjectPermissionDeniedException;
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

    @Override
    public List<ProjectUserDto> getUsersForProject(Long projectId) {
        List<ProjectMember> members = repository.findAllUsersForProject(projectId);

        return members.stream()
                .map(pm -> ProjectUserDto.builder()
                        .id(pm.getUser().getId())
                        .name(pm.getUser().getName())
                        .avatarUrl(pm.getUser().getAvatar())
                        .role(pm.getRole().name())
                        .build())
                .toList();
    }



//    @Override
//    @Transactional
//    public void addMemberForProject(AddProjectMemberRequest request, String email) {
//        Project project = projectService.findById(request.getProjectId());
//        User userToAdd = userService.findByEmail(request.getEmail());
//        User currentUser = userService.findByEmail(email);
//        Role role;
//        try {
//            role = Role.valueOf(request.getRole().toUpperCase());
//        } catch (IllegalArgumentException e) {
//            throw new IllegalArgumentException("Invalid role: " + request.getRole());
//        }
//
//        if (role == Role.LEADER) {
//            if (!project.getLeader().getId().equals(currentUser.getId())) {
//                throw new RuntimeException("Only the current leader can assign a new leader!");
//            }
//
//            if (project.getLeader() != null && !project.getLeader().getId().equals(userToAdd.getId())) {
//                throw new RuntimeException("Project already has a leader!");
//            }
//            project.setLeader(userToAdd);
//        }
//
//        ProjectMember projectMember = ProjectMember.builder()
//                .project(project)
//                .user(userToAdd)
//                .role(role)
//                .build();
//
//        project.getMembers().add(projectMember);
//        repository.save(projectMember);
//    }


    @Override
    public void save(ProjectMember projectMember) {
        repository.save(projectMember);
    }
    @Override
    public void checkTaskEditPermission(User user, Project project) {
        ProjectMember member = repository.findByUserAndProject(
                user, project
        ).orElseThrow(() -> new ProjectPermissionDeniedException("User is not a project member"));

        if (member.getRole() == Role.VIEWER) {
            throw new ProjectPermissionDeniedException("VIEWER cannot edit tasks");
        }    }
}
