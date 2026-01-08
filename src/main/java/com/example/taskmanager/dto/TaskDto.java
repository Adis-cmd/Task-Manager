package com.example.taskmanager.dto;

import com.example.taskmanager.entity.enums.Priority;
import com.example.taskmanager.entity.enums.Status;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.FieldDefaults;

import java.util.List;

@Getter
@Setter
@FieldDefaults(level = AccessLevel.PRIVATE)
@Builder
public class TaskDto {
    Long id;
    String name;
    UserDto author;
    List<UserDto> participants;
    String description;
    Status status;
    Priority priority;
    List<CommentDto> comments;
    Long columnId;
}
