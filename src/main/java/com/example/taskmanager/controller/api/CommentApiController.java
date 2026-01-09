package com.example.taskmanager.controller.api;


import com.example.taskmanager.dto.CreateCommentDto;
import com.example.taskmanager.service.CommentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@RestController
@RequestMapping("/api/comment")
@RequiredArgsConstructor
public class CommentApiController {

    private final CommentService commentService;


    @PostMapping("/tasks/{taskId}/comments")
    public ResponseEntity<Void> createComment(
            @RequestBody CreateCommentDto dto,
            @PathVariable Long taskId,
            Principal principal
    ) {
        commentService.createComment(dto, principal.getName(), taskId);
        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

}
