package com.example.taskmanager.service.impl;

import com.example.taskmanager.dto.BoardColumnDetailsDto;
import com.example.taskmanager.dto.RequestColumnDto;
import com.example.taskmanager.entity.project.BoardColumn;
import com.example.taskmanager.entity.project.Project;
import com.example.taskmanager.exception.BoardNotFoundException;
import com.example.taskmanager.exception.ColumnNotFoundException;
import com.example.taskmanager.exception.ProjectNotFountException;
import com.example.taskmanager.mapper.BoardColumnMapper;
import com.example.taskmanager.repo.BoardColumnRepository;
import com.example.taskmanager.repo.ProjectRepository;
import com.example.taskmanager.service.BoardColumnService;
import com.example.taskmanager.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardColumnServiceImpl implements BoardColumnService {

    private final BoardColumnRepository repository;
    private final BoardColumnMapper columnMapper;
    private final ProjectRepository projectRepository;

    @Override
    public List<BoardColumnDetailsDto> getAllColumnByProjectIdId(Long id) {
        List<BoardColumn> column = repository.findByProjectId(id);
        return columnMapper.toDtoDetailsList(column);
    }

    @Override
    public void createColumn(Long id, RequestColumnDto columnDto) {
        Project project = projectRepository.findById(id)
                .orElseThrow(() -> new ProjectNotFountException("Project Not found!!"));

        BoardColumn column = BoardColumn.builder()
                .name(columnDto.getName())
                .project(project)
                .build();

        repository.save(column);
    }


    @Override
    public BoardColumn findById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ColumnNotFoundException("Column not found!!"));
    }


    @Override
    public void editColumn(Long id, RequestColumnDto dto) {
        BoardColumn boardColumn = repository.findById(id).orElseThrow(
                () -> new ColumnNotFoundException("Column not found!!")
        );

        boardColumn.setName(dto.getName());

        repository.save(boardColumn);
    }
}
