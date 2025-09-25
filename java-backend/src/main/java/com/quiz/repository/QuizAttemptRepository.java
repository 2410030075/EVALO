package com.quiz.repository;

import com.quiz.entity.QuizAttempt;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface QuizAttemptRepository extends JpaRepository<QuizAttempt, Integer> {

    List<QuizAttempt> findByUserId(Integer userId);

    List<QuizAttempt> findByQuizId(Integer quizId);
}
