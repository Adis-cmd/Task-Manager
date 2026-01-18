package com.example.taskmanager.service.impl;


import com.example.taskmanager.exception.advice.ErrorResponseBody;
import com.example.taskmanager.service.ErrorService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ErrorServiceIml implements ErrorService {
    @Override
    public ErrorResponseBody makeResponse(Exception ex) {
        String message = ex.getMessage();
        return ErrorResponseBody.builder()
                .title(message)
                .response(Map.of("errors", List.of(message)))
                .build();
    }

    @Override
    public ErrorResponseBody makeResponse(BindingResult bindingResult) {
        Map<String, List<String>> reasons = new HashMap<>();

        bindingResult.getFieldErrors()
                .stream()
                .filter(err -> err.getDefaultMessage() != null)
                .forEach(err -> {
                    reasons.computeIfAbsent(err.getField(), k -> new ArrayList<>()).add(err.getDefaultMessage());
                });
        return ErrorResponseBody.builder()
                .title("Validation Error")
                .response(reasons)
                .build();
    }
}
