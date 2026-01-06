package com.example.taskmanager.mapper;

import com.example.taskmanager.dto.CommentDto;
import com.example.taskmanager.entity.project.Comment;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class CommentMapper {

    private final UserMapper userMapper;

    public CommentDto toDto(Comment comment) {
        if (comment == null) {
            return null;
        }

        return CommentDto.builder()
                .id(comment.getId())
                .author(userMapper.toDto(comment.getAuthor()))
                .text(comment.getText())
                .createdAt(comment.getCreatedAt())
                .updatedAt(comment.getUpdatedAt())
                .build();
    }

    public List<CommentDto> toDtoList(List<Comment> comments) {
        if (comments == null || comments.isEmpty()) {
            return List.of();
        }

        return comments.stream()
                .map(this::toDto)
                .toList();
    }
}