package com.quiz.entity;

import lombok.Data;
import javax.persistence.*;

@Data
@Entity
@Table(name = "user_answers")
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuizAttemptId() {
        return quizAttemptId;
    }

    public void setQuizAttemptId(Integer quizAttemptId) {
        this.quizAttemptId = quizAttemptId;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public Integer getSelectedOptionId() {
        return selectedOptionId;
    }

    public void setSelectedOptionId(Integer selectedOptionId) {
        this.selectedOptionId = selectedOptionId;
    }

    public Boolean getIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(Boolean isCorrect) {
        this.isCorrect = isCorrect;
    }
}
