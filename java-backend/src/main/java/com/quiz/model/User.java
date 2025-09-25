package com.quiz.model;

import lombok.Data;
import javax.persistence.*;

@Data
// Removed entity annotation to fix duplicate mapping issue
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String username;
    private String password;
    private String email;
    private String role;
    private Boolean active;
}
