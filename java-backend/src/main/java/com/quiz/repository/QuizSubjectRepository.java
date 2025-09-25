package com.quiz.repository;

import com.quiz.entity.QuizSubject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuizSubjectRepository extends JpaRepository<QuizSubject, Integer> {

    List<QuizSubject> findByQuizId(Integer quizId);

    @Query("SELECT qs FROM QuizSubject qs JOIN FETCH qs.subject WHERE qs.quizId = :quizId")
    List<QuizSubject> findByQuizIdWithSubject(@Param("quizId") Integer quizId);
}
