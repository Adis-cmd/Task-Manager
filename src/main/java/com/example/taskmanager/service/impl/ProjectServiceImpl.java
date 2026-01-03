package com.example.taskmanager.service.impl;

import com.example.taskmanager.dto.AddProjectMemberRequest;
import com.example.taskmanager.dto.BoardDto;
import com.example.taskmanager.dto.ProjectDetailDto;
import com.example.taskmanager.dto.ProjectUserDto;
import com.example.taskmanager.entity.enums.Role;
import com.example.taskmanager.entity.project.Project;
import com.example.taskmanager.entity.project.ProjectMember;
import com.example.taskmanager.entity.user.User;
import com.example.taskmanager.exception.ProjectNotFountException;
import com.example.taskmanager.repo.ProjectRepository;
import com.example.taskmanager.service.BoardService;
import com.example.taskmanager.service.ProjectMemberService;
import com.example.taskmanager.service.ProjectService;
import com.example.taskmanager.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {

    private final ProjectRepository repository;
    private final UserService userService;
    private final BoardService boardService;
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


    @Override
    public ProjectDetailDto detailProject(Long id){
        Project project = repository.findById(id)
                .orElseThrow(() -> new ProjectNotFountException("Project not found!!"));
        List<BoardDto> boards = boardService.findAllBoardByProject(project.getId());
        List<ProjectUserDto> members = projectMemberService.getUsersForProject(project.getId());


        return ProjectDetailDto.builder()
                .id(project.getId())
                .name(project.getName())
                .members(members)
                .boards(boards)
                .build();

    }

    @Override
    public Project findById(Long projectId) {
        return repository.findById(projectId)
                .orElseThrow(() -> new ProjectNotFountException("project not found!!"));
    }




    @Transactional
    @Override
    public void addMemberForProject(AddProjectMemberRequest request, String email) {
        Project project = repository.findById(request.getProjectId())
                .orElseThrow(() -> new ProjectNotFountException("Project Not Found!!!"));
        User userToAdd = userService.findByEmail(request.getEmail());
        User currentUser = userService.findByEmail(email);
        Role role;
        try {
            role = Role.valueOf(request.getRole().toUpperCase());
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException("Invalid role: " + request.getRole());
        }

        if (role == Role.LEADER) {
            if (!project.getLeader().getId().equals(currentUser.getId())) {
                throw new RuntimeException("Only the current leader can assign a new leader!");
            }

            if (project.getLeader() != null && !project.getLeader().getId().equals(userToAdd.getId())) {
                throw new RuntimeException("Project already has a leader!");
            }
            project.setLeader(userToAdd);
        }

        ProjectMember projectMember = ProjectMember.builder()
                .project(project)
                .user(userToAdd)
                .role(role)
                .build();

        project.getMembers().add(projectMember);
        projectMemberService.save(projectMember);

    }

}