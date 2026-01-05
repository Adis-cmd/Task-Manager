package com.example.taskmanager.entity.project;

import com.example.taskmanager.entity.enums.Priority;
import com.example.taskmanager.entity.enums.Status;
import com.example.taskmanager.entity.user.User;
import jakarta.persistence.*;
import jakarta.persistence.Column;
import lombok.*;
import lombok.experimental.FieldDefaults;


import java.time.LocalDateTime;
import java.util.List;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Table(name = "tasks")
@Entity
@FieldDefaults(level = AccessLevel.PRIVATE)
public class Task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    String name;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "author_id")
    User author;

    @ManyToMany
    @JoinTable(
            name = "task_participants",
            joinColumns = @JoinColumn(name = "task_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    List<User> participants;

    String description;

    @OneToMany(mappedBy = "task")
    List<Comment> comments;

    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    Status status;

    LocalDateTime dueDate;

    @Enumerated(EnumType.STRING)
    @Column
    Priority priority;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "column_id")
    BoardColumn column;
}
