package com.example.taskmanager.controller;

import com.example.taskmanager.dto.AddProjectMemberRequest;
import com.example.taskmanager.exception.ProjectNotFountException;
import com.example.taskmanager.exception.ProjectOperationException;
import com.example.taskmanager.service.ProjectService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
@RequestMapping("/project/member")
@RequiredArgsConstructor
public class ProjectMemberController {

    private final ProjectService projectService;

    @PostMapping("/add")
    public String addMemberForProject(
            @ModelAttribute AddProjectMemberRequest request,
            Principal principal,
            RedirectAttributes redirectAttributes) {

        try {
            projectService.addMemberForProject(request, principal.getName());
            redirectAttributes.addFlashAttribute("successMessage", "Участник успешно добавлен");
        } catch (ProjectOperationException ex) {
            redirectAttributes.addFlashAttribute("errorMessage", ex.getMessage());
        }

        return "redirect:/project/" + request.getProjectId();
    }

}