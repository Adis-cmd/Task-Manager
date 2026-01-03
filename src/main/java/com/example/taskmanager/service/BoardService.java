package com.example.taskmanager.service;

import com.example.taskmanager.dto.BoardDto;
import com.example.taskmanager.entity.project.Board;

import java.util.List;

public interface BoardService {
    List<BoardDto> findAllBoardByProject(Long id);
}
