package com.example.taskmanager.repo;

import com.example.taskmanager.entity.project.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface TaskRepository extends JpaRepository<Task, Long> {


    @Query(value = "select t from Task where t.column.id = :columnId")
    Optional<Task> findTaskByColumId(Long columnId);
}
