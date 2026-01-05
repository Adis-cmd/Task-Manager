package com.example.taskmanager.dto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
public class BoardDetailsDto {
    Long id;
    String name;
    List<BoardColumnDetailsDto> columnDto;
}
