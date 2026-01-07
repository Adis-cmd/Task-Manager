package com.example.taskmanager.mapper;

import com.example.taskmanager.dto.BoardColumnDetailsDto;
import com.example.taskmanager.entity.project.BoardColumn;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class BoardColumnMapper {
    private final TaskMapper taskMapper;


    public BoardColumnDetailsDto toDtoDetails(BoardColumn column) {
        if (column == null) {
        return null;
        }

        return BoardColumnDetailsDto.builder()
                .name(column.getName())
                .id(column.getId())
                .taskDtos(taskMapper.toDtoList(column.getTasks()))
                .build();
    }

    public List<BoardColumnDetailsDto> toDtoDetailsList(List<BoardColumn> columns) {
        if (columns == null || columns.isEmpty()) {
            return List.of();
        }


        return columns.stream()
                .map(this::toDtoDetails)
                .toList();
    }

}
