package com.example.taskmanager.mapper;

import com.example.taskmanager.dto.TaskDto;
import com.example.taskmanager.entity.project.Task;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class TaskMapper {

    private final UserMapper userMapper;
    private final CommentMapper commentMapper;

    public TaskDto toDto(Task task) {
        if (task == null) {
            return null;
        }

        return TaskDto.builder()
                .id(task.getId())
                .name(task.getName())
                .description(task.getDescription())
                .author(userMapper.toDto(task.getAuthor()))
                .status(task.getStatus())
                .priority(task.getPriority())
                .participants(userMapper.toDtoList(task.getParticipants()))
                .comments(commentMapper.toDtoList(task.getComments()))
                .build();
    }

    public List<TaskDto> toDtoList(List<Task> taskDtos) {
        if (taskDtos == null || taskDtos.isEmpty()) {
            return List.of();
        }


        return taskDtos.stream()
                .map(this::toDto)
                .toList();
    }

}
