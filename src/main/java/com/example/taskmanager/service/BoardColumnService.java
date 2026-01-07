package com.example.taskmanager.service;

import com.example.taskmanager.dto.BoardColumnDetailsDto;
import com.example.taskmanager.dto.CreateColumnDto;
import com.example.taskmanager.entity.project.BoardColumn;

import java.util.List;

public interface BoardColumnService {
    List<BoardColumnDetailsDto> getAllColumnByBoardId(Long id);

    void createColumn(Long id, CreateColumnDto columnDto);

    BoardColumn findById(Long id);
}
