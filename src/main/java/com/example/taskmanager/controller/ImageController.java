package com.example.taskmanager.controller;

import com.example.taskmanager.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("photo")
public class ImageController {
    private final UserService userService;

    @GetMapping("/{imageName}")
    public ResponseEntity<?> getImage(@PathVariable String imageName) {
        return userService.findByName(imageName);
    }
}
