package com.example.taskmanager.controller;

import com.example.taskmanager.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
@RequestMapping("project")
@RequiredArgsConstructor
public class ProjectController {
    private final ProjectService projectService;



    @GetMapping("/create")
    public String showCreateForm() {
        return "project/create";
    }

    @PostMapping("/create")
    public String createProject(@RequestParam String name,
                                Principal principal,
                                RedirectAttributes redirectAttributes) {
        try {
            projectService.createProject(principal.getName(), name);
            redirectAttributes.addFlashAttribute("success", "Проект успешно создан!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Ошибка при создании проекта");
        }
        return "redirect:/profile/main";
    }


}
