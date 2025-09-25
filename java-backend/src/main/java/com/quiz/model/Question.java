package com.quiz.model;

import lombok.Data;
import javax.persistence.*;

@Data
// Removed entity annotation to fix duplicate mapping issue
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "quiz_id")
    private Integer quizId;

    @Column(name = "subject_id")
    private Integer subjectId;

    @Column(name = "question_text", length = 1000)
    private String questionText;

    @Column(name = "question_type")
    private String questionType;

    private Integer points;

    @Column(name = "order_num")
    private Integer orderNum;
}
