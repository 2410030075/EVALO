package com.quiz.controller;

import com.quiz.dto.*;
import com.quiz.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

@RestController
@RequestMapping("/api/quiz")
@CrossOrigin(origins = "*")
public class QuizController {

    @Autowired
    private QuizService quizService;

    /**
     * Get all quizzes
     */
    @GetMapping
    public ResponseEntity<List<QuizDto>> getAllQuizzes() {
        return new ResponseEntity<>(quizService.getAllQuizzes(), HttpStatus.OK);
    }

    /**
     * Get quiz by ID
     */
    @GetMapping("/{id}")
    public ResponseEntity<QuizDto> getQuizById(@PathVariable Integer id) {
        QuizDto quiz = quizService.getQuizById(id);
        if (quiz != null) {
            return new ResponseEntity<>(quiz, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    /**
     * Get all questions for a quiz
     */
    @GetMapping("/{quizId}/questions")
    public ResponseEntity<List<QuestionDto>> getQuestionsByQuizId(@PathVariable Integer quizId) {
        return new ResponseEntity<>(quizService.getQuestionsByQuizId(quizId), HttpStatus.OK);
    }

    /**
     * Get options for a question
     */
    @GetMapping("/questions/{questionId}/options")
    public ResponseEntity<List<QuestionOptionDto>> getOptionsForQuestion(@PathVariable Integer questionId) {
        return new ResponseEntity<>(quizService.getOptionsForQuestion(questionId), HttpStatus.OK);
    }

    /**
     * Start a new quiz attempt
     */
    @PostMapping("/{quizId}/start")
    public ResponseEntity<QuizAttemptDto> startQuizAttempt(
            @PathVariable Integer quizId,
            @RequestParam Integer userId) {
        QuizAttemptDto attempt = quizService.startQuizAttempt(quizId, userId);
        return new ResponseEntity<>(attempt, HttpStatus.CREATED);
    }

    /**
     * Save user answer
     */
    @PostMapping("/attempts/{attemptId}/answer")
    public ResponseEntity<UserAnswerDto> saveUserAnswer(
            @PathVariable Integer attemptId,
            @RequestBody Map<String, Integer> answerData) {
        Integer questionId = answerData.get("questionId");
        Integer selectedOptionId = answerData.get("selectedOptionId");

        if (questionId == null || selectedOptionId == null) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        UserAnswerDto userAnswer = quizService.saveUserAnswer(
                attemptId, questionId, selectedOptionId);
        return new ResponseEntity<>(userAnswer, HttpStatus.CREATED);
    }

    /**
     * Complete quiz attempt
     */
    @PostMapping("/attempts/{attemptId}/complete")
    public ResponseEntity<QuizAttemptDto> completeQuizAttempt(@PathVariable Integer attemptId) {
        QuizAttemptDto result = quizService.completeQuizAttempt(attemptId);
        if (result != null) {
            return new ResponseEntity<>(result, HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }

    /**
     * Get all subjects
     */
    @GetMapping("/subjects")
    public ResponseEntity<List<SubjectDto>> getAllSubjects() {
        return new ResponseEntity<>(quizService.getAllSubjects(), HttpStatus.OK);
    }
}
