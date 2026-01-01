package com.example.taskmanager.entity;

import jakarta.persistence.*;
import lombok.*;

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
    @Column(name = "user_name")
    String userName;
    @Column(name = "avatar")
    String avatar;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "authorities_id", referencedColumnName = "id")
    Authority authority;
}

