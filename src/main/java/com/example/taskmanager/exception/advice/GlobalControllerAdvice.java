package com.example.taskmanager.exception.advice;

import com.example.taskmanager.service.ErrorService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;

import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.UUID;

@ControllerAdvice
@RequiredArgsConstructor
public class GlobalControllerAdvice {
    private final ErrorService errorService;

    private Map<String, Object> createDetails(HttpServletRequest request) {
        Map<String, Object> details = new HashMap<>();
        details.put("serverName", request.getServerName());
        details.put("requestURL", request.getRequestURL().toString());
        details.put("serverPort", request.getServerPort());
        details.put("requestId", UUID.randomUUID().toString());
        return details;
    }

    @ExceptionHandler(IllegalArgumentException.class)
    public String handleIllegalArgumentException(IllegalArgumentException ex, Model model, HttpServletRequest request) {
        HttpStatus status = HttpStatus.BAD_REQUEST;
        model.addAttribute("status", status.value());
        model.addAttribute("reason", status.getReasonPhrase());
        model.addAttribute("details", createDetails(request));
        model.addAttribute("message", ex.getMessage());
        return "errors/error";
    }

    @ExceptionHandler(RuntimeException.class)
    public String handleRuntimeException(RuntimeException ex, Model model, HttpServletRequest request) {
        HttpStatus status = HttpStatus.BAD_REQUEST;
        model.addAttribute("status", status.value());
        model.addAttribute("reason", status.getReasonPhrase());
        model.addAttribute("details", createDetails(request));
        model.addAttribute("message", ex.getMessage());
        return "errors/error";
    }

    @ExceptionHandler(NoSuchElementException.class)
    public String handleNoSuchElementException(NoSuchElementException ex, Model model, HttpServletRequest request) {
        HttpStatus status = HttpStatus.NOT_FOUND;
        model.addAttribute("status", status.value());
        model.addAttribute("reason", status.getReasonPhrase());
        model.addAttribute("details", createDetails(request));
        model.addAttribute("message", ex.getMessage());
        return "errors/error";
    }

    @ExceptionHandler(NumberFormatException.class)
    public String handleNumberFormatException(NumberFormatException ex, Model model, HttpServletRequest request) {
        HttpStatus status = HttpStatus.BAD_REQUEST;
        model.addAttribute("status", status.value());
        model.addAttribute("reason", status.getReasonPhrase());
        model.addAttribute("details", createDetails(request));
        model.addAttribute("message", ex.getMessage());
        return "errors/error";
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ErrorResponseBody> handleValidationException(MethodArgumentNotValidException ex) {
        return new ResponseEntity<>(errorService.makeResponse(ex.getBindingResult()), HttpStatus.BAD_REQUEST);
    }

    @ExceptionHandler(MaxUploadSizeExceededException.class)
    public String handleMaxUploadSizeException(MaxUploadSizeExceededException ex, Model model, HttpServletRequest request) {
        HttpStatus status = HttpStatus.REQUEST_ENTITY_TOO_LARGE;
        model.addAttribute("status", status.value());
        model.addAttribute("reason", status.getReasonPhrase());
        model.addAttribute("details", createDetails(request));
        model.addAttribute("message", "Файл слишком большой. Максимальный размер файла: 10MB");
        return "errors/error";
    }

    @ExceptionHandler(AccessDeniedException.class)
    public String handleAccessDeniedException(AccessDeniedException ex, Model model, HttpServletRequest request) {
        HttpStatus status = HttpStatus.FORBIDDEN;
        model.addAttribute("status", status.value());
        model.addAttribute("reason", status.getReasonPhrase());
        model.addAttribute("details", createDetails(request));
        model.addAttribute("message", ex.getMessage());
        return "errors/error";
    }
}