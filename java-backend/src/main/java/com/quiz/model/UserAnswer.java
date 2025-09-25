package com.quiz.model;

import lombok.Data;
import javax.persistence.*;

@Data
// Removed entity annotation to fix duplicate mapping issue
public class UserAnswer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "quiz_attempt_id")
    private Integer quizAttemptId;

    @Column(name = "question_id")
    private Integer questionId;

    @Column(name = "selected_option_id")
    private Integer selectedOptionId;

    @Column(name = "is_correct")
    private Boolean isCorrect;
}
