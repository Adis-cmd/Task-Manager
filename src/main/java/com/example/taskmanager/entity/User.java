package com.example.taskmanager.entity;

import com.example.taskmanager.entity.project.Project;
import com.example.taskmanager.entity.project.Task;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "users")
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    Long id;
    @Column(name = "email")
    String email;
    @Column(name = "password")
    String password;
    @Column(name = "enabled")
    Boolean enabled;
    @Column(name = "name")
    String name;
    @Column(name = "avatar")
    String avatar;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "authorities_id", referencedColumnName = "id")
    Authority authority;

    @OneToMany(mappedBy = "author", cascade = CascadeType.ALL)
    List<Task> createdTasks;

    @ManyToMany(mappedBy = "participants")
    List<Task> participatingTasks;

    @OneToMany(mappedBy = "author", cascade = CascadeType.ALL)
    List<Comment> comments;

    @OneToMany(mappedBy = "leader")
    List<Project> leadProjects;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    List<ProjectMember> projectMemberships;
}

