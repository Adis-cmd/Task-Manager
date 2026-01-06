package com.example.taskmanager.controller;

import com.example.taskmanager.dto.CreateBoardDto;
import com.example.taskmanager.exception.ProjectNotFountException;
import com.example.taskmanager.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("boards")
public class BoardController {
    private final BoardService boardService;


    @PostMapping("create/{id}")
    public String createBoard(
            CreateBoardDto dto,
            @PathVariable("id") Long id,
            RedirectAttributes redirectAttributes
    ) {

        try{
            boardService.createBoard(dto, id);
            redirectAttributes.addFlashAttribute("successMessage", "Доска успешна добавлена");
        } catch (ProjectNotFountException ex) {
            redirectAttributes.addFlashAttribute("errorMessage", ex.getMessage());
        }
        return "redirect:/project/" + id;
    }


    @GetMapping("{id}")
    public String showBoard(@PathVariable("id") Long id, Model model) {

        model.addAttribute("board", boardService.showBoard(id));
        return "board/detail";
    }
}
