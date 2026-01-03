package com.example.taskmanager.dto;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ProjectDetailDto {
    Long id;
    String name;
    List<ProjectUserDto> members;
    List<BoardDto> boards;
}
