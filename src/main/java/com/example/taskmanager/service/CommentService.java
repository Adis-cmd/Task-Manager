package com.example.taskmanager.service;

import com.example.taskmanager.dto.CreateCommentDto;

public interface CommentService {
    void createComment(CreateCommentDto dto, String authorEmail, Long taskId);
}
