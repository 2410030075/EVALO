package com.quiz.model;

import lombok.Data;
import javax.persistence.*;
import java.util.Date;

@Data
// Removed entity annotation to fix duplicate mapping issue
public class QuizAttempt {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "user_id")
    private Integer userId;

    @Column(name = "quiz_id")
    private Integer quizId;

    @Column(name = "start_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date startTime;

    @Column(name = "end_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endTime;

    private Integer score;

    @Column(name = "total_questions")
    private Integer totalQuestions;

    @Column(name = "correct_answers")
    private Integer correctAnswers;

    private Boolean completed;

    @Column(name = "time_spent_seconds")
    private Integer timeSpentSeconds;
}
