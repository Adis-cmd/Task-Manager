package com.example.taskmanager.service.impl;

import com.example.taskmanager.entity.project.Comment;
import com.example.taskmanager.repo.CommentRepository;
import com.example.taskmanager.service.CommentService;
import com.example.taskmanager.service.ProjectMemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.example.taskmanager.service.TaskService;
import com.example.taskmanager.service.UserService;
import com.example.taskmanager.dto.CreateCommentDto;
import com.example.taskmanager.entity.project.Task;
import com.example.taskmanager.entity.user.User;

import java.time.LocalDateTime;


@RequiredArgsConstructor
@Service
public class CommentServiceImpl implements CommentService {
    private final CommentRepository commentRepository;
    private final ProjectMemberService projectMemberService;
    private final UserService userService;
    private final TaskService taskService;

    @Override
    public void createComment(CreateCommentDto dto, String authorEmail, Long taskId) {
        User user = userService.findByEmail(authorEmail);
        Task task = taskService.findById(taskId);

        projectMemberService.checkTaskEditPermission(user, task.getColumn().getBoard().getProject());

        Comment comment = Comment.builder()
                .author(user)
                .text(dto.getText())
                .updatedAt(LocalDateTime.now())
                .createdAt(LocalDateTime.now())
                .task(task)
                .build();

        commentRepository.save(comment);
    }
}
