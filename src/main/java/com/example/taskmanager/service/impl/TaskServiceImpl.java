package com.example.taskmanager.service.impl;

import com.example.taskmanager.dto.RequestTaskDto;
import com.example.taskmanager.dto.TaskDto;
import com.example.taskmanager.entity.enums.Status;
import com.example.taskmanager.entity.project.Project;
import com.example.taskmanager.entity.project.Task;
import com.example.taskmanager.entity.user.User;
import com.example.taskmanager.exception.TaskNotFoundException;
import com.example.taskmanager.mapper.TaskMapper;
import com.example.taskmanager.repo.TaskRepository;
import com.example.taskmanager.service.BoardColumnService;
import com.example.taskmanager.service.ProjectMemberService;
import com.example.taskmanager.service.TaskService;
import com.example.taskmanager.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@RequiredArgsConstructor
@Service
public class TaskServiceImpl implements TaskService {
    private final TaskRepository repository;
    private final UserService userService;
    private final TaskMapper taskMapper;
    private final BoardColumnService boardColumnService;
    private final ProjectMemberService memberService;

    @Override
    public void createTask(Long id, RequestTaskDto dto, String emailU) {

        Task task = Task.builder()
                .column(boardColumnService.findById(id))
                .name(dto.getName())
                .author(userService.findByEmail(emailU))
                .description(dto.getDescription())
                .status(dto.getStatus() != null ? dto.getStatus() : Status.PENDING)
                .priority(dto.getPriority())
                .dueDate(LocalDateTime.now())
                .build();
        repository.save(task);
    }

    @Override
    public TaskDto showTask(Long id) {
        Task task = repository.findById(id)
                .orElseThrow(() -> new TaskNotFoundException("Task Not Found!!"));
        return taskMapper.toDto(task);
    }


    @Override
    public void editTask(Long id, String userEmail, RequestTaskDto dto, Long columnId) {
        User user = userService.findByEmail(userEmail);
        Task task = repository.findById(id)
                .orElseThrow(() -> new TaskNotFoundException("Task Not Found!!!"));

        Project project = task.getColumn().getBoard().getProject();
        memberService.checkTaskEditPermission(user, project);
        task.setName(dto.getName());
        task.setDescription(dto.getDescription());
        task.setColumn(boardColumnService.findById(columnId));
        task.setStatus(dto.getStatus());
        task.setPriority(dto.getPriority());
        task.setDueDate(LocalDateTime.now());


        repository.save(task);
    }


    @Override
    public TaskDto getById(Long id) {
        Task task = repository.findById(id)
                .orElseThrow(() -> new TaskNotFoundException("Task not found"));

        return taskMapper.toDto(task);
    }

}
