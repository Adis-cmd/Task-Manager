package com.example.taskmanager.service.impl;

import com.example.taskmanager.dto.AuthRegisterDto;
import com.example.taskmanager.dto.ProjectDto;
import com.example.taskmanager.dto.UserDto;
import com.example.taskmanager.dto.ViewProfileDto;
import com.example.taskmanager.entity.project.ProjectMember;
import com.example.taskmanager.entity.user.User;
import com.example.taskmanager.exception.UserNotFoundException;
import com.example.taskmanager.mapper.UserMapper;
import com.example.taskmanager.repo.UserRepository;
import com.example.taskmanager.service.AuthorityService;
import com.example.taskmanager.service.ProjectMemberService;
import com.example.taskmanager.service.UserService;
import com.example.taskmanager.util.FileUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final AuthorityService authorityService;
    private final ProjectMemberService projectMemberService;
    private final UserMapper userMapper;

    @Override
    public void saveUser(AuthRegisterDto dto) {
        User user = User.builder()
                .name(dto.getName())
                .password(passwordEncoder.encode(dto.getPassword()))
                .email(dto.getEmail())
                .avatar("default.png")
                .enabled(true)
                .authority(authorityService.findAuthorityByName("USER"))
                .build();
        userRepository.saveAndFlush(user);
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new UserNotFoundException("User not found"));
    }


    @Override
    public ResponseEntity<?> findByName(String imageName) {
        log.info("Получение файла изображения с именем: {}", imageName);
        return FileUtil.getOutputFile(imageName, "images/");
    }

    @Override
    public ViewProfileDto profile(String email) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new UserNotFoundException("User not found"));

        List<ProjectMember> members =
                projectMemberService.findAllProjectWithUser(user.getId());

        return userMapper.toViewProfileDto(user, members);
    }


    @Override
    public UserDto getById(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new UserNotFoundException("User not found"));

        return UserDto.builder()
                .avatar(user.getAvatar())
                .name(user.getName())
                .id(user.getId())
                .build();
    }
}
