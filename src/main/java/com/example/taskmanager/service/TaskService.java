package com.example.taskmanager.service;

import com.example.taskmanager.dto.TaskDto;

public interface TaskService {
    TaskDto getTaskByBoardColumnId(Long id);
}
