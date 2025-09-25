package com.quiz.model;

import lombok.Data;
import javax.persistence.*;

@Data
// Removed entity annotation to fix duplicate mapping issue
public class QuestionOption {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "question_id")
    private Integer questionId;

    @Column(name = "option_text", length = 500)
    private String optionText;

    @Column(name = "is_correct")
    private Boolean isCorrect;
}
