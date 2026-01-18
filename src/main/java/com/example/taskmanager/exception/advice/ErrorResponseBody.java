package com.example.taskmanager.exception.advice;

import lombok.*;

import java.util.List;
import java.util.Map;
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ErrorResponseBody {
    private String title;
    private Map<String, List<String>> response;
}
