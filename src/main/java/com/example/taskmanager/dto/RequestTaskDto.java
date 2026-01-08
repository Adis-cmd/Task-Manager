package com.example.taskmanager.dto;

import com.example.taskmanager.entity.enums.Priority;
import com.example.taskmanager.entity.enums.Status;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)

public class RequestTaskDto {
    @NotBlank
    private String name;

    private Status status;

    @NotNull
    private Priority priority;

    private String description;
}
