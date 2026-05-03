package com.example.taskmanager.repo;

import com.example.taskmanager.entity.project.Project;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Long> {

    @Query(
            value = "SELECT p FROM Project p " +
                    "LEFT JOIN FETCH p.leader " +
                    "LEFT JOIN FETCH p.members m " +
                    "LEFT JOIN FETCH m.user " +
                    "WHERE EXISTS (" +
                    "SELECT pm FROM ProjectMember pm " +
                    "WHERE pm.project = p AND pm.user.id = :userId" +
                    ")",
            countQuery = "SELECT COUNT(p) FROM Project p " +
                    "JOIN p.members pm " +
                    "WHERE pm.user.id = :userId"
    )
    Page<Project> findAllProjectByUserId(Pageable pageable, @Param("userId") Long userId);

}
