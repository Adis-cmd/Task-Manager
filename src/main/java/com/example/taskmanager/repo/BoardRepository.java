package com.example.taskmanager.repo;

import com.example.taskmanager.entity.project.Board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface BoardRepository extends JpaRepository<Board, Long> {


    @Query(value = "select b from Board b where b.project.id = :projectId")
    List<Board> findAllBoardByProjectId(@Param("projectId") Long projectId);
}
