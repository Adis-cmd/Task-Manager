package com.example.taskmanager.service;

import com.example.taskmanager.dto.RequestTaskDto;
import com.example.taskmanager.dto.TaskDto;

public interface TaskService {
    void createTask(Long id, RequestTaskDto dto, String emailU);

    TaskDto showTask(Long id);

    void editTask(Long id, String userEmail, RequestTaskDto dto, Long columnId);

    TaskDto getById(Long id);
}
