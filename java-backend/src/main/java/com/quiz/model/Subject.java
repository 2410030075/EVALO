package com.quiz.model;

import lombok.Data;
import javax.persistence.*;

@Data
// Removed entity annotation to fix duplicate mapping issue
public class Subject {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private String description;
    private String color;
}
