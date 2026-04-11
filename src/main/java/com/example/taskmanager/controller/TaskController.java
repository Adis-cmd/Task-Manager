package com.example.taskmanager.controller;

import com.example.taskmanager.dto.RequestTaskDto;
import com.example.taskmanager.dto.TaskDto;
import com.example.taskmanager.exception.ProjectPermissionDeniedException;
import com.example.taskmanager.exception.TaskNotFoundException;
import com.example.taskmanager.service.TaskService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
@RequestMapping("tasks")
public class TaskController {
    private final TaskService taskService;

    @PostMapping("/create")
    public String createTask(
            @RequestParam Long projectId,
            @RequestParam Long columnId,
            @Valid @ModelAttribute RequestTaskDto taskDto,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Principal principal
    ) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("error", "Ошибка валидации");
            return "redirect:/project/" + projectId;
        }
        taskService.createTask(columnId, taskDto, principal.getName());
        redirectAttributes.addFlashAttribute("success", "Задача создана");

        return "redirect:/project/" + projectId;
    }

    @PostMapping("/{id}")
    public String editTask(
            @PathVariable Long id,
            @RequestParam Long projectId,
            @RequestParam Long columnId,
            @Valid @ModelAttribute("dto") RequestTaskDto dto,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Principal principal) {

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("error", "Ошибка валидации данных");
            return "redirect:/project/" + projectId;
        }

        try {
            taskService.editTask(id, principal.getName(), dto, columnId);
            redirectAttributes.addFlashAttribute("success", "Задача успешно отредактирована");
        } catch (TaskNotFoundException ex) {
            redirectAttributes.addFlashAttribute("error", "Задача не найдена");
        } catch (ProjectPermissionDeniedException ex) {
            redirectAttributes.addFlashAttribute("error", "Недостаточно прав для редактирования задачи");
        }

        return "redirect:/project/" + projectId;
    }


    @GetMapping
    public String showAllTask(Pageable pageable, Principal principal, Model model) {
        Page<TaskDto> taskDto = taskService.allTask(pageable, principal.getName());
        model.addAttribute("taskDto", taskDto);
        return "task/main";
    }

}
