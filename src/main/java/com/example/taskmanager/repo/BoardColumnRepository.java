package com.example.taskmanager.repo;

import com.example.taskmanager.entity.project.BoardColumn;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BoardColumnRepository extends JpaRepository<BoardColumn, Long> {
}
