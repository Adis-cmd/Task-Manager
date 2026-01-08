package com.example.taskmanager.exception;

public class ProjectPermissionDeniedException extends RuntimeException {
    public ProjectPermissionDeniedException(String message) {
        super(message);
    }
}
