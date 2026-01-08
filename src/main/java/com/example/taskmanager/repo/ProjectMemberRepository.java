package com.example.taskmanager.repo;

import com.example.taskmanager.entity.project.Project;
import com.example.taskmanager.entity.project.ProjectMember;
import com.example.taskmanager.entity.user.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProjectMemberRepository extends JpaRepository<ProjectMember, Long> {
    List<ProjectMember> findByUserId(Long userId);

    @Query(value = "select p from ProjectMember p where p.project.id = :projectId")
    List<ProjectMember> findAllUsersForProject(Long projectId);


    Optional<ProjectMember> findByUserAndProject(User user, Project project);
}
