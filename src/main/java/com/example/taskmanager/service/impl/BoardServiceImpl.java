package com.example.taskmanager.service.impl;

import com.example.taskmanager.dto.BoardDto;
import com.example.taskmanager.entity.project.Board;
import com.example.taskmanager.repo.BoardRepository;
import com.example.taskmanager.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
    private final BoardRepository repository;


    @Override
    public List<BoardDto> findAllBoardByProject(Long id) {
        List<Board> boardDtos = repository.findAllBoardByProjectId(id);


        return boardDtos.stream().map(
                        bD -> BoardDto.builder()
                                .name(bD.getName())
                                .id(bD.getId())
                                .build())
                .toList();
    }
}
