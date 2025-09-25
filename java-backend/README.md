# Quiz System Java Backend

This Java backend provides REST APIs for the 100-question quiz system, connecting the frontend to a MySQL database.

## Project Structure

```
java-backend/
├── src/main/java/com/quiz/
│   ├── controller/
│   │   └── QuizController.java
│   ├── dto/
│   │   ├── QuestionDto.java
│   │   ├── QuestionOptionDto.java
│   │   ├── QuizAttemptDto.java
│   │   ├── QuizDto.java
│   │   ├── SubjectDto.java
│   │   ├── UserAnswerDto.java
│   │   └── UserDto.java
│   ├── model/
│   │   ├── Question.java
│   │   ├── QuestionOption.java
│   │   ├── Quiz.java
│   │   ├── QuizAttempt.java
│   │   ├── Subject.java
│   │   ├── User.java
│   │   └── UserAnswer.java
│   ├── repository/
│   │   ├── QuestionOptionRepository.java
│   │   ├── QuestionRepository.java
│   │   ├── QuizAttemptRepository.java
│   │   ├── QuizRepository.java
│   │   ├── SubjectRepository.java
│   │   ├── UserAnswerRepository.java
│   │   └── UserRepository.java
│   ├── service/
│   │   └── QuizService.java
│   └── QuizApplication.java
├── src/main/resources/
│   └── application.properties
└── pom.xml
```

## Database Integration

The backend connects to a MySQL database using Spring Data JPA. The database schema is defined in `database_schema.sql`, and initial data is provided in `data_migration.sql`.

## API Endpoints

### Quiz Management
- `GET /api/quiz` - Get all quizzes
- `GET /api/quiz/{id}` - Get quiz by ID
- `GET /api/quiz/{quizId}/questions` - Get questions for a quiz
- `GET /api/quiz/questions/{questionId}/options` - Get options for a question
- `GET /api/quiz/subjects` - Get all subjects

### Quiz Attempts
- `POST /api/quiz/{quizId}/start` - Start a new quiz attempt
- `POST /api/quiz/attempts/{attemptId}/answer` - Save user answer
- `POST /api/quiz/attempts/{attemptId}/complete` - Complete quiz attempt

## Frontend Integration

A JavaScript service (`quizService.js`) is provided to integrate the frontend with the Java backend. Instructions for integration are in `backend-integration-instructions.js`.

## Setup Instructions

1. Install Java 8+ and Maven
2. Create a MySQL database named `quiz_system`
3. Run the SQL scripts (`database_schema.sql` and `data_migration.sql`)
4. Configure `application.properties` with your database credentials
5. Build the project: `mvn clean install`
6. Run the application: `mvn spring-boot:run`

The backend will start on http://localhost:8080

## Technologies Used

- Spring Boot 2.7.9
- Spring Data JPA
- MySQL
- Lombok
- JWT for authentication (optional)