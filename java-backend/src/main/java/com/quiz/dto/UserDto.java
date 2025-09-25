package com.quiz.dto;

import lombok.Data;

@Data
public class UserDto {

    private Integer id;
    private String username;
    private String email;
    private String role;
    private Boolean active;
}
