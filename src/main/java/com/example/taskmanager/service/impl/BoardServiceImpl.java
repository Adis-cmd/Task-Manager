package com.example.taskmanager.service.impl;

import com.example.taskmanager.dto.*;
import com.example.taskmanager.entity.project.Board;
import com.example.taskmanager.entity.project.Project;
import com.example.taskmanager.exception.BoardNotFoundException;
import com.example.taskmanager.exception.ProjectNotFountException;
import com.example.taskmanager.repo.BoardRepository;
import com.example.taskmanager.repo.ProjectRepository;
import com.example.taskmanager.service.BoardColumnService;
import com.example.taskmanager.service.BoardService;
import com.example.taskmanager.service.TaskService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
    private final BoardRepository repository;
    private final ProjectRepository projectRepository;
    private final BoardColumnService boardColumnService;

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


    @Override
    public void createBoard(CreateBoardDto dto, Long projectId) {
        Project project = projectRepository.findById(projectId)
                .orElseThrow(() -> new ProjectNotFountException("Project not found"));

        repository.save(
                Board.builder()
                        .name(dto.getName())
                        .project(project)
                        .build()
        );
    }


    @Override
    public BoardDetailsDto showBoard(Long id) {
        Board board = repository.findById(id)
                .orElseThrow(() -> new BoardNotFoundException("Board not Fount!!"));
        List<BoardColumnDetailsDto> columnDto = boardColumnService.getAllColumnByBoardId(board.getId());

        return BoardDetailsDto.builder()
                .id(board.getId())
                .name(board.getName())
                .columnDto(columnDto)
                .build();
    }


    @Override
    public Board findById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new BoardNotFoundException("Board Not Found!!"));
    }

}
