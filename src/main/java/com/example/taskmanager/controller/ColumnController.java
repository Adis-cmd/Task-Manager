package com.example.taskmanager.controller;

import com.example.taskmanager.dto.RequestColumnDto;
import com.example.taskmanager.exception.BoardNotFoundException;
import com.example.taskmanager.exception.ColumnNotFoundException;
import com.example.taskmanager.service.BoardColumnService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("columns")
public class ColumnController {
    private final BoardColumnService columnService;


    @PostMapping("create")
    public String createColumns(
            @RequestParam Long boardId,
            @Valid @ModelAttribute RequestColumnDto columnDto,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes
    ) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("error", "Ошибка валидации");
            return "redirect:/boards/" + boardId;
        }

        try {
            columnService.createColumn(boardId, columnDto);
            redirectAttributes.addFlashAttribute("success", "Колонка успешно создана!");
        } catch (BoardNotFoundException ex) {
            redirectAttributes.addFlashAttribute("error", "Ошибка при создании колонки: " + ex.getMessage());
        }
        return "redirect:/boards/" + boardId;
    }


    @PostMapping("/edit")
    public String editColumns(
            @RequestParam Long id,
            @ModelAttribute RequestColumnDto dto,
            @RequestParam Long boardId,
            RedirectAttributes redirectAttributes
    ) {
        try {
            columnService.editColumn(id, dto);
            redirectAttributes.addFlashAttribute("success", "Колонка успешно отредактирована!");
        } catch (ColumnNotFoundException ex) {
            redirectAttributes.addFlashAttribute("error",
                    "Ошибка при редактировании колонки: " + ex.getMessage());
        }
        return "redirect:/boards/" + boardId;
    }

}
