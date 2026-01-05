package com.example.taskmanager.service.impl;

import com.example.taskmanager.dto.TaskDto;
import com.example.taskmanager.entity.project.Task;
import com.example.taskmanager.exception.TaskNotFoundException;
import com.example.taskmanager.repo.TaskRepository;
import com.example.taskmanager.service.TaskService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class TaskServiceImpl implements TaskService {
    private final TaskRepository repository;




    @Override
    public TaskDto getTaskByBoardColumnId(Long id) {
        Task task = repository.findTaskByColumId(id).orElseThrow(()-> new TaskNotFoundException("Task Not found"));

        return TaskDto.builder()
                .name(task.getName())
                .description(task.getDescription())
                .author(null)
                .status(task.getStatus())
                .priority(task.getPriority())
                .participants(null)
                .comments(null)
                .build();
    }

}
