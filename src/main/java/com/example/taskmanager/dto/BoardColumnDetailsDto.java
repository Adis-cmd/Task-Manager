package com.example.taskmanager.dto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BoardColumnDetailsDto {
    Long id;
    String name;
    List<TaskDto> taskDtos;
}
