package com.example.taskmanager.controller;

import com.example.taskmanager.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("profile")
public class ProfileController {
    private final UserService userService;



    @GetMapping("main")
    public String profile(Principal principal, Model model) {
        model.addAttribute("profile", userService.profile(principal.getName()));
        return "profile/main";
    }



}
