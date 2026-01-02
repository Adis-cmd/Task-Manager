package com.example.taskmanager.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Builder
@Setter
public class ViewProfileDto {
    private String name;
    private String avatar;
    private List<ProjectDto> projectDto;
}
