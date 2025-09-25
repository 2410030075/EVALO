package com.quiz.repository;

import com.quiz.entity.QuestionOption;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface QuestionOptionRepository extends JpaRepository<QuestionOption, Integer> {

    List<QuestionOption> findByQuestionId(Integer questionId);

    @Query("SELECT qo FROM QuestionOption qo WHERE qo.questionId IN :questionIds ORDER BY qo.questionId, qo.orderNum")
    List<QuestionOption> findByQuestionIds(@Param("questionIds") List<Integer> questionIds);

    @Query("SELECT qo FROM QuestionOption qo WHERE qo.questionId = :questionId AND qo.isCorrect = true")
    QuestionOption findCorrectOptionByQuestionId(@Param("questionId") Integer questionId);
}
