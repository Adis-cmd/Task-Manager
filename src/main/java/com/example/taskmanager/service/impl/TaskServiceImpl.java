package com.example.taskmanager.service.impl;

import com.example.taskmanager.dto.CreateTaskDto;
import com.example.taskmanager.entity.enums.Status;
import com.example.taskmanager.entity.project.Task;
import com.example.taskmanager.mapper.BoardColumnMapper;
import com.example.taskmanager.mapper.TaskMapper;
import com.example.taskmanager.repo.TaskRepository;
import com.example.taskmanager.service.BoardColumnService;
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

    @Override
    public void createTask(Long id, CreateTaskDto dto, String emailU) {

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

}
