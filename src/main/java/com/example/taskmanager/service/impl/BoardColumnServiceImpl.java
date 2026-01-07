package com.example.taskmanager.service.impl;

import com.example.taskmanager.dto.BoardColumnDetailsDto;
import com.example.taskmanager.dto.CreateColumnDto;
import com.example.taskmanager.entity.project.Board;
import com.example.taskmanager.entity.project.BoardColumn;
import com.example.taskmanager.exception.BoardNotFoundException;
import com.example.taskmanager.exception.ColumnNotFoundException;
import com.example.taskmanager.mapper.BoardColumnMapper;
import com.example.taskmanager.repo.BoardColumnRepository;
import com.example.taskmanager.repo.BoardRepository;
import com.example.taskmanager.service.BoardColumnService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardColumnServiceImpl implements BoardColumnService {

    private final BoardColumnRepository repository;
    private final BoardRepository boardRepository;
    private final BoardColumnMapper columnMapper;

    @Override
    public List<BoardColumnDetailsDto> getAllColumnByBoardId(Long id) {
        List<BoardColumn> column = repository.findByBoardId(id);
        return columnMapper.toDtoDetailsList(column);
    }

    @Override
    public void createColumn(Long id, CreateColumnDto columnDto) {
        Board board = boardRepository.findById(id)
                .orElseThrow(() -> new BoardNotFoundException("Board not found"));

        BoardColumn column = BoardColumn.builder()
                .name(columnDto.getName())
                .board(board)
                .build();

        repository.save(column);
    }


    @Override
    public BoardColumn findById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ColumnNotFoundException("Column not found!!"));
    }
}
