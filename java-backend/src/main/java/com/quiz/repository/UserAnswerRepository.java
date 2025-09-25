package com.quiz.repository;

import com.quiz.entity.UserAnswer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserAnswerRepository extends JpaRepository<UserAnswer, Integer> {

    // Updated to use quizAttemptId instead of attemptId
    List<UserAnswer> findByQuizAttemptId(Integer quizAttemptId);

    // Updated to use quizAttemptId instead of attemptId
    UserAnswer findByQuizAttemptIdAndQuestionId(Integer quizAttemptId, Integer questionId);
}
