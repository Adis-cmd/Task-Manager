package com.example.taskmanager.mapper;

import com.example.taskmanager.dto.UserDto;
import com.example.taskmanager.entity.user.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class UserMapper {

    public UserDto toDto(User user) {
        if (user == null) {
            return null;
        }

        return UserDto.builder()
                .id(user.getId())
                .name(user.getName())
                .avatar(user.getAvatar())
                .build();
    }

    public List<UserDto> toDtoList(List<User> users) {
        if (users == null || users.isEmpty()) {
            return List.of();
        }

        return users.stream()
                .map(this::toDto)
                .toList();
    }
}