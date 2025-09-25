package com.quiz.service;

import com.quiz.dto.*;
import com.quiz.entity.*;
import com.quiz.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.stream.Collectors;
import java.util.Optional;
import java.util.Date;

@Service
public class QuizService {

    @Autowired
    private QuizRepository quizRepository;

    @Autowired
    private SubjectRepository subjectRepository;

    @Autowired
    private QuestionRepository questionRepository;

    @Autowired
    private QuestionOptionRepository optionRepository;

    @Autowired
    private QuizAttemptRepository attemptRepository;

    @Autowired
    private UserAnswerRepository userAnswerRepository;

    /**
     * Get all available quizzes
     */
    public List<QuizDto> getAllQuizzes() {
        return quizRepository.findAll().stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }

    /**
     * Get a quiz by id
     */
    public QuizDto getQuizById(Integer id) {
        Optional<Quiz> quiz = quizRepository.findById(id);
        return quiz.map(this::convertToDto).orElse(null);
    }

    /**
     * Get all questions for a quiz
     */
    public List<QuestionDto> getQuestionsByQuizId(Integer quizId) {
        return questionRepository.findByQuizId(quizId).stream()
                .map(this::convertToQuestionDto)
                .collect(Collectors.toList());
    }

    /**
     * Get options for a question
     */
    public List<QuestionOptionDto> getOptionsForQuestion(Integer questionId) {
        return optionRepository.findByQuestionId(questionId).stream()
                .map(this::convertToOptionDto)
                .collect(Collectors.toList());
    }

    /**
     * Start a new quiz attempt
     */
    public QuizAttemptDto startQuizAttempt(Integer quizId, Integer userId) {
        QuizAttempt attempt = new QuizAttempt();
        attempt.setQuizId(quizId);
        attempt.setUserId(userId);
        attempt.setStartTime(new Date());
        attempt.setCompleted(false);

        attempt = attemptRepository.save(attempt);
        return convertToAttemptDto(attempt);
    }

    /**
     * Save user answer
     */
    public UserAnswerDto saveUserAnswer(Integer attemptId, Integer questionId, Integer selectedOptionId) {
        UserAnswer userAnswer = new UserAnswer();
        userAnswer.setQuizAttemptId(attemptId);
        userAnswer.setQuestionId(questionId);
        userAnswer.setSelectedOptionId(selectedOptionId);

        // Check if the answer is correct
        QuestionOption selectedOption = optionRepository.findById(selectedOptionId).orElse(null);
        if (selectedOption != null) {
            userAnswer.setIsCorrect(selectedOption.getIsCorrect());
        } else {
            userAnswer.setIsCorrect(false);
        }

        userAnswer = userAnswerRepository.save(userAnswer);
        return convertToUserAnswerDto(userAnswer);
    }

    /**
     * Complete quiz attempt
     */
    public QuizAttemptDto completeQuizAttempt(Integer attemptId) {
        Optional<QuizAttempt> attemptOpt = attemptRepository.findById(attemptId);
        if (attemptOpt.isPresent()) {
            QuizAttempt attempt = attemptOpt.get();
            attempt.setEndTime(new Date());
            attempt.setCompleted(true);

            // Calculate score
            List<UserAnswer> userAnswers = userAnswerRepository.findByQuizAttemptId(attemptId);
            int correctAnswers = (int) userAnswers.stream()
                    .filter(UserAnswer::getIsCorrect)
                    .count();

            attempt.setScore(correctAnswers);
            attempt.setCorrectAnswers(correctAnswers);
            attempt.setTotalQuestions(userAnswers.size());

            // Calculate time spent
            long timeSpentMillis = attempt.getEndTime().getTime() - attempt.getStartTime().getTime();
            int timeSpentSeconds = (int) (timeSpentMillis / 1000);
            attempt.setTimeSpentSeconds(timeSpentSeconds);

            attempt = attemptRepository.save(attempt);
            return convertToAttemptDto(attempt);
        }
        return null;
    }

    /**
     * Get all subjects
     */
    public List<SubjectDto> getAllSubjects() {
        return subjectRepository.findAll().stream()
                .map(this::convertToSubjectDto)
                .collect(Collectors.toList());
    }

    /**
     * Convert Quiz entity to DTO
     */
    private QuizDto convertToDto(Quiz quiz) {
        QuizDto dto = new QuizDto();
        dto.setId(quiz.getId());
        dto.setTitle(quiz.getTitle());
        dto.setDescription(quiz.getDescription());
        dto.setTimeLimit(quiz.getTimeLimit());
        dto.setTotalQuestions(quiz.getTotalQuestions());
        dto.setDifficulty(quiz.getDifficulty());
        dto.setActive(quiz.getActive());
        dto.setCreatedAt(quiz.getCreatedAt());
        return dto;
    }

    /**
     * Convert Subject entity to DTO
     */
    private SubjectDto convertToSubjectDto(Subject subject) {
        SubjectDto dto = new SubjectDto();
        dto.setId(subject.getId());
        dto.setName(subject.getName());
        dto.setDescription(subject.getDescription());
        dto.setColor(subject.getColor());
        return dto;
    }

    /**
     * Convert Question entity to DTO
     */
    private QuestionDto convertToQuestionDto(Question question) {
        QuestionDto dto = new QuestionDto();
        dto.setId(question.getId());
        dto.setQuizId(question.getQuizId());
        dto.setSubjectId(question.getSubjectId());
        dto.setQuestionText(question.getQuestionText());
        dto.setQuestionType(question.getQuestionType());
        dto.setPoints(question.getPoints());
        dto.setOrderNum(question.getOrderNum());

        // Get subject details
        Optional<Subject> subject = subjectRepository.findById(question.getSubjectId());
        if (subject.isPresent()) {
            dto.setSubjectName(subject.get().getName());
            dto.setSubjectColor(subject.get().getColor());
        }

        return dto;
    }

    /**
     * Convert QuestionOption entity to DTO
     */
    private QuestionOptionDto convertToOptionDto(QuestionOption option) {
        QuestionOptionDto dto = new QuestionOptionDto();
        dto.setId(option.getId());
        dto.setQuestionId(option.getQuestionId());
        dto.setOptionText(option.getOptionText());
        dto.setIsCorrect(option.getIsCorrect());
        return dto;
    }

    /**
     * Convert QuizAttempt entity to DTO
     */
    private QuizAttemptDto convertToAttemptDto(QuizAttempt attempt) {
        QuizAttemptDto dto = new QuizAttemptDto();
        dto.setId(attempt.getId());
        dto.setUserId(attempt.getUserId());
        dto.setQuizId(attempt.getQuizId());
        dto.setStartTime(attempt.getStartTime());
        dto.setEndTime(attempt.getEndTime());
        dto.setScore(attempt.getScore());
        dto.setTotalQuestions(attempt.getTotalQuestions());
        dto.setCorrectAnswers(attempt.getCorrectAnswers());
        dto.setCompleted(attempt.getCompleted());
        dto.setTimeSpentSeconds(attempt.getTimeSpentSeconds());
        return dto;
    }

    /**
     * Convert UserAnswer entity to DTO
     */
    private UserAnswerDto convertToUserAnswerDto(UserAnswer userAnswer) {
        UserAnswerDto dto = new UserAnswerDto();
        dto.setId(userAnswer.getId());
        dto.setQuizAttemptId(userAnswer.getQuizAttemptId());
        dto.setQuestionId(userAnswer.getQuestionId());
        dto.setSelectedOptionId(userAnswer.getSelectedOptionId());
        dto.setIsCorrect(userAnswer.getIsCorrect());
        return dto;
    }
}
