package com.example.taskmanager.controller;

import com.example.taskmanager.dto.RequestTaskDto;
import com.example.taskmanager.exception.ProjectPermissionDeniedException;
import com.example.taskmanager.exception.TaskNotFoundException;
import com.example.taskmanager.service.TaskService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
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
            @RequestParam Long boardId,
            @RequestParam Long columnId,
            @Valid @ModelAttribute RequestTaskDto taskDto,
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

    @GetMapping("{id}")
    public String showTask(Long id, Model model) {
        model.addAttribute("task", taskService.showTask(id));
        return "board/detail";
    }

    @PostMapping("/{id}")
    public String editTask(
            @PathVariable Long id,
            @RequestParam Long boardId,
            @RequestParam Long columnId,
            @Valid @ModelAttribute("dto") RequestTaskDto dto,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Principal principal) {

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("error", "Ошибка валидации данных");
            return "redirect:/board/" + boardId;
        }

        try {
            taskService.editTask(id, principal.getName(), dto, columnId);
            redirectAttributes.addFlashAttribute("success", "Задача успешно отредактирована");
        } catch (TaskNotFoundException ex) {
            redirectAttributes.addFlashAttribute("error", "Задача не найдена");
        } catch (ProjectPermissionDeniedException ex) {
            redirectAttributes.addFlashAttribute("error", "Недостаточно прав для редактирования задачи");
        }

        return "redirect:/boards/" + boardId;
    }

}
