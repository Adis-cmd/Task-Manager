package com.example.taskmanager.service;

import com.example.taskmanager.exception.advice.ErrorResponseBody;
import org.springframework.validation.BindingResult;

public interface ErrorService {
    ErrorResponseBody makeResponse(Exception ex);

    ErrorResponseBody makeResponse(BindingResult bindingResult);
}
