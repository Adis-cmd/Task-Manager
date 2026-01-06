package com.example.taskmanager.service.impl;

import com.example.taskmanager.dto.TaskDto;
import com.example.taskmanager.entity.project.Task;
import com.example.taskmanager.exception.TaskNotFoundException;
import com.example.taskmanager.mapper.TaskMapper;
import com.example.taskmanager.repo.TaskRepository;
import com.example.taskmanager.service.TaskService;
import com.example.taskmanager.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class TaskServiceImpl implements TaskService {
    private final TaskRepository repository;
    private final UserService userService;
    private final TaskMapper taskMapper;



    @Override
    public TaskDto getTaskByBoardColumnId(Long id) {
        Task task = repository.findTaskByColumId(id)
                .orElseThrow(() -> new TaskNotFoundException("Task Not found"));
        return taskMapper.toDto(task);
    }

}
