// Instructions for integrating the Java backend with frontend

/*
To integrate the Java backend with your existing frontend, follow these steps:

1. Include the quizService.js file in your HTML:
   <script src="quizService.js"></script>

2. Modify your script.js to use the quizService functions for:
   - Loading quiz data
   - Fetching questions
   - Submitting answers
   - Completing the quiz

3. Update your database operations to call the Java backend APIs

Integration points:

1. When starting a quiz:
   - Call quizService.getAllQuizzes() to get available quizzes
   - Call quizService.getQuizById(quizId) to load a specific quiz
   - Call quizService.startQuizAttempt(quizId, userId) to begin the quiz

2. When loading questions:
   - Call quizService.getQuestionsForQuiz(quizId) to load all questions
   - Call quizService.getOptionsForQuestion(questionId) to load options for each question

3. When answering questions:
   - Call quizService.saveUserAnswer(attemptId, questionId, selectedOptionId) to save each answer

4. When completing the quiz:
   - Call quizService.completeQuizAttempt(attemptId) to submit and get final results

Example implementation changes:

1. Loading quiz data:
   ```javascript
   async function loadQuiz(quizId) {
     try {
       const quiz = await quizService.getQuizById(quizId);
       if (!quiz) {
         console.error("Failed to load quiz");
         return;
       }
       
       // Start the quiz attempt
       const userId = 1; // Get from login if available
       const attempt = await quizService.startQuizAttempt(quizId, userId);
       attemptId = attempt.id;
       
       // Load questions
       const questions = await quizService.getQuestionsForQuiz(quizId);
       // Process questions and setup the UI
     } catch (error) {
       console.error("Error loading quiz:", error);
     }
   }
   ```

2. Saving answers:
   ```javascript
   async function saveAnswer(questionId, selectedOptionId) {
     try {
       await quizService.saveUserAnswer(attemptId, questionId, selectedOptionId);
     } catch (error) {
       console.error("Error saving answer:", error);
     }
   }
   ```

3. Completing the quiz:
   ```javascript
   async function completeQuiz() {
     try {
       const result = await quizService.completeQuizAttempt(attemptId);
       displayResults(result);
     } catch (error) {
       console.error("Error completing quiz:", error);
     }
   }
   ```

These changes will connect your frontend to the Java backend while maintaining the existing UI and functionality.
*/