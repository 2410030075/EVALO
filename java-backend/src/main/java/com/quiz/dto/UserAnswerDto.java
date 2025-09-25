package com.quiz.dto;

import lombok.Data;

@Data
public class UserAnswerDto {

    private Integer id;
    private Integer quizAttemptId;
    private Integer questionId;
    private Integer selectedOptionId;
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
