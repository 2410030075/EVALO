// quizService.js - Frontend JavaScript service to connect to Java backend

const API_BASE_URL = 'http://localhost:8080/api/quiz';

// Fetch all quizzes
async function getAllQuizzes() {
    try {
        const response = await fetch(`${API_BASE_URL}`);
        if (!response.ok) {
            throw new Error('Failed to fetch quizzes');
        }
        return await response.json();
    } catch (error) {
        console.error('Error fetching quizzes:', error);
        return [];
    }
}

// Fetch a single quiz by ID
async function getQuizById(quizId) {
    try {
        const response = await fetch(`${API_BASE_URL}/${quizId}`);
        if (!response.ok) {
            throw new Error('Failed to fetch quiz');
        }
        return await response.json();
    } catch (error) {
        console.error(`Error fetching quiz #${quizId}:`, error);
        return null;
    }
}

// Fetch questions for a quiz
async function getQuestionsForQuiz(quizId) {
    try {
        const response = await fetch(`${API_BASE_URL}/${quizId}/questions`);
        if (!response.ok) {
            throw new Error('Failed to fetch questions');
        }
        return await response.json();
    } catch (error) {
        console.error(`Error fetching questions for quiz #${quizId}:`, error);
        return [];
    }
}

// Fetch options for a question
async function getOptionsForQuestion(questionId) {
    try {
        const response = await fetch(`${API_BASE_URL}/questions/${questionId}/options`);
        if (!response.ok) {
            throw new Error('Failed to fetch options');
        }
        return await response.json();
    } catch (error) {
        console.error(`Error fetching options for question #${questionId}:`, error);
        return [];
    }
}

// Start a new quiz attempt
async function startQuizAttempt(quizId, userId) {
    try {
        const response = await fetch(`${API_BASE_URL}/${quizId}/start?userId=${userId}`, {
            method: 'POST'
        });
        if (!response.ok) {
            throw new Error('Failed to start quiz attempt');
        }
        return await response.json();
    } catch (error) {
        console.error('Error starting quiz attempt:', error);
        return null;
    }
}

// Save a user answer
async function saveUserAnswer(attemptId, questionId, selectedOptionId) {
    try {
        const response = await fetch(`${API_BASE_URL}/attempts/${attemptId}/answer`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                questionId,
                selectedOptionId
            })
        });
        if (!response.ok) {
            throw new Error('Failed to save answer');
        }
        return await response.json();
    } catch (error) {
        console.error('Error saving answer:', error);
        return null;
    }
}

// Complete a quiz attempt
async function completeQuizAttempt(attemptId) {
    try {
        const response = await fetch(`${API_BASE_URL}/attempts/${attemptId}/complete`, {
            method: 'POST'
        });
        if (!response.ok) {
            throw new Error('Failed to complete quiz');
        }
        return await response.json();
    } catch (error) {
        console.error('Error completing quiz:', error);
        return null;
    }
}

// Fetch all subjects
async function getAllSubjects() {
    try {
        const response = await fetch(`${API_BASE_URL}/subjects`);
        if (!response.ok) {
            throw new Error('Failed to fetch subjects');
        }
        return await response.json();
    } catch (error) {
        console.error('Error fetching subjects:', error);
        return [];
    }
}

// Export all functions
const quizService = {
    getAllQuizzes,
    getQuizById,
    getQuestionsForQuiz,
    getOptionsForQuestion,
    startQuizAttempt,
    saveUserAnswer,
    completeQuizAttempt,
    getAllSubjects
};