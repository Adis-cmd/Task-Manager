package com.example.taskmanager.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AuthRegisterDto {
    @NotBlank(message = "Имя не должно быть пустым ")
    private String name;
    @Email(message = "Эта почта уже занята")
    private String email;
    @NotBlank(message = "Пароль не должен быть пустым")
    @Size(min = 4, max = 120, message = "Пароль должен состоять из 4–120 строк")
    private String password;
}
