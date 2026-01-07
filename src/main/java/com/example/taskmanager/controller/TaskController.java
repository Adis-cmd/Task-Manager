package com.example.taskmanager.controller;

import com.example.taskmanager.dto.CreateTaskDto;
import com.example.taskmanager.service.TaskService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
@RequestMapping("tasks")
public class TaskController {
    private final TaskService taskService;

    @PostMapping("/create")
    public String createTask(
            @RequestParam Long boardId,
            @RequestParam Long columnId,
            @Valid @ModelAttribute CreateTaskDto taskDto,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Principal principal
    ) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("error", "Ошибка валидации");
            return "redirect:/boards/" + boardId;
        }

        taskService.createTask(columnId, taskDto, principal.getName());
        redirectAttributes.addFlashAttribute("success", "Задача создана");

        return "redirect:/boards/" + boardId;
    }


}
