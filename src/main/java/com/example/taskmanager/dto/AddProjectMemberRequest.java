package com.example.taskmanager.dto;

import lombok.*;
import lombok.experimental.FieldDefaults;

@Getter
@Setter
@Builder
@FieldDefaults(level = AccessLevel.PRIVATE)
@NoArgsConstructor
@AllArgsConstructor
public class AddProjectMemberRequest {
    Long projectId;
    String email;
    String role;
}
