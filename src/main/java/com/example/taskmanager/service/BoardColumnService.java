package com.example.taskmanager.service;

import com.example.taskmanager.dto.BoardColumnDetailsDto;
import com.example.taskmanager.dto.RequestColumnDto;
import com.example.taskmanager.entity.project.BoardColumn;

import java.util.List;

public interface BoardColumnService {
    List<BoardColumnDetailsDto> getAllColumnByBoardId(Long id);

    void createColumn(Long id, RequestColumnDto columnDto);

    BoardColumn findById(Long id);

    void editColumn(Long id, RequestColumnDto dto);
}
