-- Database schema for Quiz Application with 100 Questions
-- Create database
CREATE DATABASE IF NOT EXISTS quiz_system;
USE quiz_system;

-- Users table for authentication and user management
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    full_name VARCHAR(100),
    role ENUM('admin', 'student', 'teacher') DEFAULT 'student',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Subjects table
CREATE TABLE subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    color VARCHAR(20) DEFAULT '#FF6B6B',
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Quizzes table
CREATE TABLE quizzes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    creator_id INT,
    time_limit_minutes INT DEFAULT 90,
    passing_score INT DEFAULT 60,
    password VARCHAR(100),
    author_password VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

-- Quiz-Subjects relationship table
CREATE TABLE quiz_subjects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    quiz_id INT NOT NULL,
    subject_id INT NOT NULL,
    question_count INT DEFAULT 25,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE,
    UNIQUE KEY unique_quiz_subject (quiz_id, subject_id)
);

-- Questions table
CREATE TABLE questions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    quiz_id INT NOT NULL,
    subject_id INT NOT NULL,
    question_text TEXT NOT NULL,
    question_type ENUM('MULTIPLE_CHOICE', 'TRUE_FALSE', 'SHORT_ANSWER') DEFAULT 'MULTIPLE_CHOICE',
    points INT DEFAULT 1,
    order_num INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(id) ON DELETE CASCADE
);

-- Answer options table
CREATE TABLE question_options (
    id INT PRIMARY KEY AUTO_INCREMENT,
    question_id INT NOT NULL,
    option_text TEXT NOT NULL,
    is_correct BOOLEAN DEFAULT FALSE,
    order_num INT DEFAULT 0,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);

-- Quiz attempts table
CREATE TABLE quiz_attempts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    quiz_id INT NOT NULL,
    started_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    submitted_at TIMESTAMP NULL,
    time_spent INT DEFAULT 0,
    score INT DEFAULT 0,
    total_questions INT DEFAULT 0,
    status ENUM('in_progress', 'completed', 'abandoned') DEFAULT 'in_progress',
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id)
);

-- User answers table
CREATE TABLE user_answers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    attempt_id INT NOT NULL,
    question_id INT NOT NULL,
    selected_option_id INT,
    answer_text TEXT,
    is_correct BOOLEAN DEFAULT FALSE,
    answered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (attempt_id) REFERENCES quiz_attempts(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (selected_option_id) REFERENCES question_options(id),
    UNIQUE KEY unique_attempt_question (attempt_id, question_id)
);

-- Insert initial data
INSERT INTO users (username, email, password_hash, full_name, role) VALUES
('admin', 'admin@example.com', '$2a$10$abcdefghijklmnopqrstuvwxyz01234567890', 'System Administrator', 'admin'),
('teacher1', 'teacher1@example.com', '$2a$10$abcdefghijklmnopqrstuvwxyz01234567891', 'John Teacher', 'teacher'),
('student1', 'student1@example.com', '$2a$10$abcdefghijklmnopqrstuvwxyz01234567892', 'Jane Student', 'student');

INSERT INTO subjects (name, color, description) VALUES
('DBMS', '#000000', 'Database Management Systems'),
('FEDF', '#FF6B6B', 'Front-End Development Frameworks'),
('OOP', '#4ECDC4', 'Object-Oriented Programming'),
('OS', '#45B7D1', 'Operating Systems');

INSERT INTO quizzes (title, description, creator_id, time_limit_minutes, passing_score, password, author_password, is_active) VALUES
('2nd Year Computer Science Fundamentals Quiz', 'Comprehensive quiz covering DBMS, FEDF, OOP, and OS fundamentals - 100 Questions', 1, 90, 60, '123', 'boat4567', TRUE);

INSERT INTO quiz_subjects (quiz_id, subject_id, question_count) VALUES
(1, 1, 25),
(1, 2, 25),
(1, 3, 25),
(1, 4, 25);
