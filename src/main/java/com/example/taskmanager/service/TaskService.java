package com.example.taskmanager.service;

import com.example.taskmanager.dto.RequestTaskDto;
import com.example.taskmanager.dto.TaskDto;
import com.example.taskmanager.entity.project.Task;

public interface TaskService {
    void createTask(Long id, RequestTaskDto dto, String emailU);

    TaskDto showTask(Long id);

    void editTask(Long id, String userEmail, RequestTaskDto dto, Long columnId);

    TaskDto getById(Long id);

    Task findById(Long id);
}
