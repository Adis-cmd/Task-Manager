package com.example.taskmanager.service;

import com.example.taskmanager.dto.CreateTaskDto;
import com.example.taskmanager.dto.TaskDto;

public interface TaskService {
    void createTask(Long id, CreateTaskDto dto, String emailU);
}
