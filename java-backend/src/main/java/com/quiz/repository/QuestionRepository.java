package com.quiz.repository;

import com.quiz.entity.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuestionRepository extends JpaRepository<Question, Integer> {

    List<Question> findByQuizIdAndSubjectId(Integer quizId, Integer subjectId);

    List<Question> findByQuizId(Integer quizId);

    @Query("SELECT q FROM Question q WHERE q.quizId = :quizId ORDER BY q.subjectId, q.orderNum")
    List<Question> findByQuizIdOrdered(@Param("quizId") Integer quizId);
}
