package com.example.taskmanager.repo;

import com.example.taskmanager.entity.project.BoardColumn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface BoardColumnRepository extends JpaRepository<BoardColumn, Long> {


    @Query("select c from BoardColumn c where c.board.id = :id")
    List<BoardColumn> findByBoardId(Long id);
}
