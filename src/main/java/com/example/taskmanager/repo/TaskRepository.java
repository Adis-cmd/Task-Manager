package com.example.taskmanager.repo;

import com.example.taskmanager.entity.project.Task;
import com.example.taskmanager.entity.user.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface TaskRepository extends JpaRepository<Task, Long> {


    @Query(value = "select t from Task t where t.column.id = :columnId")
    Optional<Task> findTaskByColumId(Long columnId);

    @Query(value = "SELECT DISTINCT t FROM Task t LEFT JOIN t.participants p WHERE t.author = :user OR p = :user",
            countQuery = "SELECT COUNT(DISTINCT t) FROM Task t LEFT JOIN t.participants p WHERE t.author = :user OR p = :user")
    Page<Task> findAllTaskForUser(Pageable pageable, @Param("user") User user);
}
