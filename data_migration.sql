-- Complete Data Migration Script
-- Populate database with all 100 questions across 4 subjects

USE quiz_system;

-- Clear existing data
DELETE FROM user_answers;
DELETE FROM quiz_attempts;
DELETE FROM question_options;
DELETE FROM questions;

-- Reset auto-increment counters
ALTER TABLE questions AUTO_INCREMENT = 1;
ALTER TABLE question_options AUTO_INCREMENT = 1;

-- Insert all 100 questions across 4 subjects

-- Insert all 100 questions
INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(1, 1, 1, "What is the primary function of a Database Management System (DBMS)?", 'MULTIPLE_CHOICE', 1, 1);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(2, 1, 1, "Which of the following is a key feature of a relational database?", 'MULTIPLE_CHOICE', 1, 2);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(3, 1, 1, "What does SQL stand for in the context of DBMS?", 'MULTIPLE_CHOICE', 1, 3);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(4, 1, 1, "Which of the following is used to uniquely identify a record in a table?", 'MULTIPLE_CHOICE', 1, 4);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(5, 1, 1, "What is the purpose of a foreign key in a relational database?", 'MULTIPLE_CHOICE', 1, 5);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(6, 1, 1, "Which normal form ensures no transitive dependencies exist?", 'MULTIPLE_CHOICE', 1, 6);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(7, 1, 1, "What is the purpose of the SELECT statement in SQL?", 'MULTIPLE_CHOICE', 1, 7);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(8, 1, 1, "Which of the following is a type of database model?", 'MULTIPLE_CHOICE', 1, 8);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(9, 1, 1, "What does ACID stand for in the context of database transactions?", 'MULTIPLE_CHOICE', 1, 9);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(10, 1, 1, "Which SQL command is used to modify existing data in a table?", 'MULTIPLE_CHOICE', 1, 10);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(11, 1, 1, "What is a view in a DBMS?", 'MULTIPLE_CHOICE', 1, 11);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(12, 1, 1, "Which of the following ensures data integrity in a database?", 'MULTIPLE_CHOICE', 1, 12);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(13, 1, 1, "What is the purpose of the JOIN clause in SQL?", 'MULTIPLE_CHOICE', 1, 13);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(14, 1, 1, "Which type of join returns all rows from both tables, with NULLs in places where there is no match?", 'MULTIPLE_CHOICE', 1, 14);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(15, 1, 1, "What is the role of an index in a database?", 'MULTIPLE_CHOICE', 1, 15);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(16, 1, 1, "Which SQL clause is used to filter the results of a query?", 'MULTIPLE_CHOICE', 1, 16);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(17, 1, 1, "What is a trigger in a DBMS?", 'MULTIPLE_CHOICE', 1, 17);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(18, 1, 1, "Which of the following is a NoSQL database type?", 'MULTIPLE_CHOICE', 1, 18);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(19, 1, 1, "What does the COMMIT command do in SQL?", 'MULTIPLE_CHOICE', 1, 19);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(20, 1, 1, "What is the purpose of the GROUP BY clause in SQL?", 'MULTIPLE_CHOICE', 1, 20);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(21, 1, 1, "Which of the following is a benefit of database normalization?", 'MULTIPLE_CHOICE', 1, 21);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(22, 1, 1, "What is a schema in a DBMS?", 'MULTIPLE_CHOICE', 1, 22);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(23, 1, 1, "Which SQL command is used to remove a table from a database?", 'MULTIPLE_CHOICE', 1, 23);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(24, 1, 1, "What is the purpose of the HAVING clause in SQL?", 'MULTIPLE_CHOICE', 1, 24);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(25, 1, 1, "Which of the following is an example of a DBMS software?", 'MULTIPLE_CHOICE', 1, 25);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(26, 1, 2, "What is a primary benefit of using a front-end framework like React?", 'MULTIPLE_CHOICE', 1, 26);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(27, 1, 2, "Which front-end framework is known for its two-way data binding feature?", 'MULTIPLE_CHOICE', 1, 27);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(28, 1, 2, "What does the Virtual DOM in React primarily improve?", 'MULTIPLE_CHOICE', 1, 28);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(29, 1, 2, "Which of the following is a CSS framework commonly used for responsive design?", 'MULTIPLE_CHOICE', 1, 29);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(30, 1, 2, "What is the main purpose of a front-end framework?", 'MULTIPLE_CHOICE', 1, 30);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(31, 1, 2, "Which framework is known for compiling code at build time to optimize performance?", 'MULTIPLE_CHOICE', 1, 31);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(32, 1, 2, "What is JSX in the context of React?", 'MULTIPLE_CHOICE', 1, 32);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(33, 1, 2, "Which front-end framework is developed by Google?", 'MULTIPLE_CHOICE', 1, 33);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(34, 1, 2, "What is a key feature of Vue.js that makes it beginner-friendly?", 'MULTIPLE_CHOICE', 1, 34);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(35, 1, 2, "Which of the following frameworks is primarily a CSS framework?", 'MULTIPLE_CHOICE', 1, 35);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(36, 1, 2, "What does a front-end framework like Angular use to structure applications?", 'MULTIPLE_CHOICE', 1, 36);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(37, 1, 2, "Which framework is known for its lightweight and minimalistic approach?", 'MULTIPLE_CHOICE', 1, 37);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(38, 1, 2, "What is a common use case for the jQuery framework?", 'MULTIPLE_CHOICE', 1, 38);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(39, 1, 2, "Which front-end framework is ideal for building single-page applications (SPAs)?", 'MULTIPLE_CHOICE', 1, 39);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(40, 1, 2, "What is a key advantage of using a front-end framework like Vue.js?", 'MULTIPLE_CHOICE', 1, 40);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(41, 1, 2, "Which of the following is a feature of the Svelte framework?", 'MULTIPLE_CHOICE', 1, 41);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(42, 1, 2, "What is the primary focus of the Bootstrap framework?", 'MULTIPLE_CHOICE', 1, 42);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(43, 1, 2, "Which front-end framework is developed by Facebook?", 'MULTIPLE_CHOICE', 1, 43);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(44, 1, 2, "What does a front-end framework like Ember.js emphasize?", 'MULTIPLE_CHOICE', 1, 44);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(45, 1, 2, "Which of the following is a benefit of using Tailwind CSS?", 'MULTIPLE_CHOICE', 1, 45);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(46, 1, 2, "Which framework is known for its use of TypeScript?", 'MULTIPLE_CHOICE', 1, 46);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(47, 1, 2, "What is a common challenge when using the Angular framework?", 'MULTIPLE_CHOICE', 1, 47);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(48, 1, 2, "Which of the following frameworks is best suited for static site generation?", 'MULTIPLE_CHOICE', 1, 48);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(49, 1, 2, "What is a key feature of the Semantic UI framework?", 'MULTIPLE_CHOICE', 1, 49);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(50, 1, 2, "Which front-end framework is known for its focus on mobile-first development?", 'MULTIPLE_CHOICE', 1, 50);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(51, 1, 3, "What is the main purpose of Object-Oriented Programming (OOP)?", 'MULTIPLE_CHOICE', 1, 51);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(52, 1, 3, "Which of the following is a core principle of OOP?", 'MULTIPLE_CHOICE', 1, 52);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(53, 1, 3, "What is a class in OOP?", 'MULTIPLE_CHOICE', 1, 53);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(54, 1, 3, "What is an object in OOP?", 'MULTIPLE_CHOICE', 1, 54);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(55, 1, 3, "Which OOP principle allows a class to inherit properties from another class?", 'MULTIPLE_CHOICE', 1, 55);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(56, 1, 3, "What does encapsulation in OOP refer to?", 'MULTIPLE_CHOICE', 1, 56);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(57, 1, 3, "What is polymorphism in OOP?", 'MULTIPLE_CHOICE', 1, 57);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(58, 1, 3, "What is abstraction in OOP?", 'MULTIPLE_CHOICE', 1, 58);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(59, 1, 3, "Which keyword is used to inherit a class in Java?", 'MULTIPLE_CHOICE', 1, 59);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(60, 1, 3, "What is a constructor in a class?", 'MULTIPLE_CHOICE', 1, 60);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(61, 1, 3, "Which access modifier makes a member accessible only within its own class?", 'MULTIPLE_CHOICE', 1, 61);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(62, 1, 3, "What is method overloading in OOP?", 'MULTIPLE_CHOICE', 1, 62);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(63, 1, 3, "What is method overriding in OOP?", 'MULTIPLE_CHOICE', 1, 63);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(64, 1, 3, "What is an abstract class in OOP?", 'MULTIPLE_CHOICE', 1, 64);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(65, 1, 3, "What is an interface in OOP?", 'MULTIPLE_CHOICE', 1, 65);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(66, 1, 3, "Which keyword is used to create an instance of a class?", 'MULTIPLE_CHOICE', 1, 66);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(67, 1, 3, "What does the 'super' keyword do in Java?", 'MULTIPLE_CHOICE', 1, 67);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(68, 1, 3, "What is the purpose of the 'this' keyword in OOP?", 'MULTIPLE_CHOICE', 1, 68);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(69, 1, 3, "What is a static method in OOP?", 'MULTIPLE_CHOICE', 1, 69);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(70, 1, 3, "Which of the following is true about final classes in Java?", 'MULTIPLE_CHOICE', 1, 70);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(71, 1, 3, "What is the default access modifier in Java if none is specified?", 'MULTIPLE_CHOICE', 1, 71);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(72, 1, 3, "What is the purpose of a getter method in OOP?", 'MULTIPLE_CHOICE', 1, 72);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(73, 1, 3, "What is the purpose of a setter method in OOP?", 'MULTIPLE_CHOICE', 1, 73);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(74, 1, 3, "Which OOP concept allows different classes to be treated as instances of the same class?", 'MULTIPLE_CHOICE', 1, 74);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(75, 1, 3, "What is the benefit of using OOP over procedural programming?", 'MULTIPLE_CHOICE', 1, 75);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(76, 1, 4, "What is the primary function of an Operating System (OS)?", 'MULTIPLE_CHOICE', 1, 76);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(77, 1, 4, "Which of the following is an example of a multi-user operating system?", 'MULTIPLE_CHOICE', 1, 77);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(78, 1, 4, "What is a process in the context of an operating system?", 'MULTIPLE_CHOICE', 1, 78);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(79, 1, 4, "What is the role of the kernel in an operating system?", 'MULTIPLE_CHOICE', 1, 79);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(80, 1, 4, "Which scheduling algorithm selects the process with the shortest next CPU burst?", 'MULTIPLE_CHOICE', 1, 80);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(81, 1, 4, "What is a deadlock in an operating system?", 'MULTIPLE_CHOICE', 1, 81);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(82, 1, 4, "Which of the following is a function of the operating system's memory management?", 'MULTIPLE_CHOICE', 1, 82);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(83, 1, 4, "What is virtual memory in an operating system?", 'MULTIPLE_CHOICE', 1, 83);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(84, 1, 4, "What is the purpose of the file system in an operating system?", 'MULTIPLE_CHOICE', 1, 84);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(85, 1, 4, "Which of the following is a real-time operating system?", 'MULTIPLE_CHOICE', 1, 85);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(86, 1, 4, "What is a thread in an operating system?", 'MULTIPLE_CHOICE', 1, 86);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(87, 1, 4, "What is the purpose of interrupt handling in an operating system?", 'MULTIPLE_CHOICE', 1, 87);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(88, 1, 4, "Which of the following is a condition for deadlock to occur?", 'MULTIPLE_CHOICE', 1, 88);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(89, 1, 4, "What is the role of the scheduler in an operating system?", 'MULTIPLE_CHOICE', 1, 89);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(90, 1, 4, "What is paging in memory management?", 'MULTIPLE_CHOICE', 1, 90);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(91, 1, 4, "What is a semaphore in an operating system?", 'MULTIPLE_CHOICE', 1, 91);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(92, 1, 4, "Which of the following is a type of operating system?", 'MULTIPLE_CHOICE', 1, 92);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(93, 1, 4, "What is the purpose of the swap space in an operating system?", 'MULTIPLE_CHOICE', 1, 93);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(94, 1, 4, "What is a context switch in an operating system?", 'MULTIPLE_CHOICE', 1, 94);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(95, 1, 4, "Which of the following is a function of device drivers in an operating system?", 'MULTIPLE_CHOICE', 1, 95);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(96, 1, 4, "What is the purpose of the boot loader in an operating system?", 'MULTIPLE_CHOICE', 1, 96);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(97, 1, 4, "Which of the following is a benefit of multiprocessing in an operating system?", 'MULTIPLE_CHOICE', 1, 97);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(98, 1, 4, "What is the role of the system call in an operating system?", 'MULTIPLE_CHOICE', 1, 98);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(99, 1, 4, "Which of the following is a type of file system used in operating systems?", 'MULTIPLE_CHOICE', 1, 99);

INSERT INTO questions (id, quiz_id, subject_id, question_text, question_type, points, order_num) VALUES
(100, 1, 4, "What is the purpose of the operating system's security management?", 'MULTIPLE_CHOICE', 1, 100);


-- Insert all 400 answer options
INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(1, 1, "To create web applications", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(2, 1, "To manage and organize data", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(3, 1, "To design network protocols", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(4, 1, "To secure hardware components", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(5, 2, "Data stored in tables", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(6, 2, "Data stored in graphs", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(7, 2, "Data stored in files", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(8, 2, "Data stored in arrays", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(9, 3, "Structured Query Language", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(10, 3, "Simple Query Language", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(11, 3, "System Query Logic", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(12, 3, "Sequential Query Language", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(13, 4, "Foreign Key", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(14, 4, "Primary Key", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(15, 4, "Candidate Key", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(16, 4, "Composite Key", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(17, 5, "To uniquely identify a record", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(18, 5, "To establish a relationship between tables", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(19, 5, "To index a table", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(20, 5, "To encrypt data", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(21, 6, "First Normal Form (1NF)", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(22, 6, "Second Normal Form (2NF)", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(23, 6, "Third Normal Form (3NF)", TRUE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(24, 6, "Boyce-Codd Normal Form (BCNF)", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(25, 7, "To delete records", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(26, 7, "To update records", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(27, 7, "To retrieve data", TRUE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(28, 7, "To create tables", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(29, 8, "Hierarchical", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(30, 8, "Linear", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(31, 8, "Circular", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(32, 8, "Modular", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(33, 9, "Atomicity, Consistency, Isolation, Durability", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(34, 9, "Accuracy, Completeness, Integrity, Dependability", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(35, 9, "Adaptability, Connectivity, Isolation, Durability", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(36, 9, "Atomicity, Consistency, Integration, Dependability", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(37, 10, "INSERT", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(38, 10, "DELETE", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(39, 10, "UPDATE", TRUE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(40, 10, "SELECT", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(41, 11, "A physical table", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(42, 11, "A virtual table based on a query", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(43, 11, "A database schema", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(44, 11, "A backup file", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(45, 12, "Constraints", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(46, 12, "Queries", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(47, 12, "Indexes", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(48, 12, "Triggers", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(49, 13, "To delete records from multiple tables", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(50, 13, "To combine rows from two or more tables", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(51, 13, "To create a new table", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(52, 13, "To update records in a single table", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(53, 14, "INNER JOIN", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(54, 14, "LEFT JOIN", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(55, 14, "RIGHT JOIN", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(56, 14, "FULL OUTER JOIN", TRUE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(57, 15, "To store data", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(58, 15, "To improve query performance", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(59, 15, "To define relationships", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(60, 15, "To enforce constraints", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(61, 16, "ORDER BY", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(62, 16, "GROUP BY", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(63, 16, "WHERE", TRUE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(64, 16, "HAVING", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(65, 17, "A type of index", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(66, 17, "A stored procedure executed automatically", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(67, 17, "A type of constraint", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(68, 17, "A backup mechanism", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(69, 18, "Relational", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(70, 18, "Document", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(71, 18, "Hierarchical", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(72, 18, "Network", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(73, 19, "Reverses a transaction", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(74, 19, "Saves a transaction permanently", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(75, 19, "Deletes a transaction", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(76, 19, "Locks a transaction", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(77, 20, "To sort data", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(78, 20, "To group rows with similar values", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(79, 20, "To filter rows", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(80, 20, "To join tables", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(81, 21, "Increased data redundancy", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(82, 21, "Reduced data redundancy", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(83, 21, "Slower query performance", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(84, 21, "Increased storage requirements", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(85, 22, "A single table", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(86, 22, "A collection of database objects", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(87, 22, "A type of query", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(88, 22, "A backup file", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(89, 23, "DELETE", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(90, 23, "DROP", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(91, 23, "TRUNCATE", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(92, 23, "REMOVE", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(93, 24, "To filter individual rows", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(94, 24, "To filter grouped rows", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(95, 24, "To sort data", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(96, 24, "To join tables", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(97, 25, "Microsoft Word", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(98, 25, "MySQL", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(99, 25, "Adobe Photoshop", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(100, 25, "Notepad", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(101, 26, "Managing server-side logic", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(102, 26, "Creating reusable UI components", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(103, 26, "Optimizing database queries", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(104, 26, "Handling network protocols", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(105, 27, "React", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(106, 27, "Angular", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(107, 27, "Vue.js", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(108, 27, "Svelte", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(109, 28, "Server performance", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(110, 28, "Rendering efficiency", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(111, 28, "Database connectivity", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(112, 28, "File compression", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(113, 29, "Node.js", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(114, 29, "Bootstrap", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(115, 29, "Express", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(116, 29, "Django", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(117, 30, "To manage backend databases", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(118, 30, "To simplify user interface development", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(119, 30, "To handle server-side routing", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(120, 30, "To secure network connections", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(121, 31, "Svelte", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(122, 31, "Angular", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(123, 31, "React", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(124, 31, "Vue.js", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(125, 32, "A database query language", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(126, 32, "A JavaScript syntax extension", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(127, 32, "A CSS preprocessor", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(128, 32, "A server-side scripting language", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(129, 33, "Vue.js", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(130, 33, "React", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(131, 33, "Angular", TRUE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(132, 33, "Svelte", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(133, 34, "Complex state management", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(134, 34, "Simple and intuitive syntax", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(135, 34, "Server-side rendering", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(136, 34, "Extensive boilerplate code", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(137, 35, "React", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(138, 35, "Bulma", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(139, 35, "Angular", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(140, 35, "Vue.js", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(141, 36, "MVC architecture", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(142, 36, "Database schema", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(143, 36, "API endpoints", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(144, 36, "File compression", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(145, 37, "Angular", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(146, 37, "Backbone.js", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(147, 37, "React", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(148, 37, "Ember.js", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(149, 38, "Building complex server-side applications", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(150, 38, "Simplifying DOM manipulation", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(151, 38, "Managing database transactions", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(152, 38, "Creating RESTful APIs", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(153, 39, "Bootstrap", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(154, 39, "Angular", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(155, 39, "Tailwind CSS", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(156, 39, "Foundation", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(157, 40, "Built-in database management", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(158, 40, "Incremental adoptability", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(159, 40, "Server-side rendering only", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(160, 40, "Hardware acceleration", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(161, 41, "Uses a virtual DOM", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(162, 41, "Compiles to vanilla JavaScript", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(163, 41, "Requires TypeScript", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(164, 41, "Focuses on backend logic", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(165, 42, "JavaScript interactivity", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(166, 42, "Responsive design and styling", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(167, 42, "Database integration", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(168, 42, "Server-side processing", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(169, 43, "Angular", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(170, 43, "React", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(171, 43, "Vue.js", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(172, 43, "Svelte", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(173, 44, "Minimalistic design", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(174, 44, "Convention over configuration", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(175, 44, "Server-side rendering", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(176, 44, "Database optimization", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(177, 45, "Built-in JavaScript components", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(178, 45, "Utility-first CSS classes", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(179, 45, "Two-way data binding", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(180, 45, "Virtual DOM optimization", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(181, 46, "Vue.js", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(182, 46, "Angular", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(183, 46, "React", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(184, 46, "Svelte", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(185, 47, "Limited community support", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(186, 47, "Steep learning curve", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(187, 47, "Lack of responsive design", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(188, 47, "Poor performance", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(189, 48, "Astro", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(190, 48, "Angular", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(191, 48, "Backbone.js", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(192, 48, "Ember.js", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(193, 49, "Virtual DOM", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(194, 49, "Intuitive and human-readable classes", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(195, 49, "Two-way data binding", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(196, 49, "Server-side rendering", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(197, 50, "Foundation", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(198, 50, "React", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(199, 50, "Vue.js", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(200, 50, "Svelte", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(201, 51, "To write procedural code", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(202, 51, "To organize code using objects and classes", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(203, 51, "To manage hardware resources", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(204, 51, "To optimize database queries", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(205, 52, "Encapsulation", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(206, 52, "Compilation", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(207, 52, "Interpretation", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(208, 52, "Serialization", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(209, 53, "A function definition", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(210, 53, "A blueprint for creating objects", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(211, 53, "A database table", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(212, 53, "A loop construct", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(213, 54, "A variable type", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(214, 54, "An instance of a class", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(215, 54, "A database query", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(216, 54, "A hardware component", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(217, 55, "Polymorphism", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(218, 55, "Inheritance", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(219, 55, "Encapsulation", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(220, 55, "Abstraction", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(221, 56, "Hiding data and exposing methods", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(222, 56, "Creating multiple class instances", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(223, 56, "Overloading functions", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(224, 56, "Defining loops", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(225, 57, "Using one interface for multiple data types", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(226, 57, "Creating private methods", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(227, 57, "Compiling code", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(228, 57, "Managing memory", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(229, 58, "Simplifying complex systems by modeling classes", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(230, 58, "Copying class properties", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(231, 58, "Executing loops", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(232, 58, "Managing databases", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(233, 59, "extends", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(234, 59, "implements", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(235, 59, "inherits", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(236, 59, "super", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(237, 60, "A method to destroy objects", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(238, 60, "A special method to initialize objects", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(239, 60, "A loop structure", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(240, 60, "A database connection", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(241, 61, "public", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(242, 61, "private", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(243, 61, "protected", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(244, 61, "default", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(245, 62, "Defining multiple methods with the same name but different parameters", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(246, 62, "Overriding a parent class method", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(247, 62, "Hiding class properties", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(248, 62, "Creating abstract classes", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(249, 63, "Redefining a parent class method in a subclass", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(250, 63, "Creating multiple methods with the same name", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(251, 63, "Hiding class variables", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(252, 63, "Defining static methods", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(253, 64, "A class that cannot be instantiated", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(254, 64, "A class with only static methods", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(255, 64, "A class with no methods", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(256, 64, "A class that is always public", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(257, 65, "A class with no implementation", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(258, 65, "A blueprint for methods that must be implemented", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(259, 65, "A private class", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(260, 65, "A static method collection", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(261, 66, "new", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(262, 66, "create", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(263, 66, "instance", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(264, 66, "object", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(265, 67, "Calls the parent class constructor or methods", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(266, 67, "Creates a new object", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(267, 67, "Defines a static method", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(268, 67, "Initializes a loop", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(269, 68, "Refers to the current object", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(270, 68, "Refers to the parent class", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(271, 68, "Declares a static method", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(272, 68, "Creates an interface", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(273, 69, "A method that belongs to the class rather than an instance", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(274, 69, "A method that cannot be called", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(275, 69, "A method that is abstract", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(276, 69, "A method that is private", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(277, 70, "They cannot be inherited", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(278, 70, "They cannot have methods", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(279, 70, "They are always abstract", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(280, 70, "They cannot be instantiated", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(281, 71, "public", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(282, 71, "private", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(283, 71, "protected", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(284, 71, "package-private", TRUE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(285, 72, "To retrieve the value of a private field", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(286, 72, "To set the value of a private field", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(287, 72, "To delete a private field", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(288, 72, "To create a new object", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(289, 73, "To retrieve the value of a private field", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(290, 73, "To set the value of a private field", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(291, 73, "To delete a private field", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(292, 73, "To create a new object", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(293, 74, "Encapsulation", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(294, 74, "Inheritance", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(295, 74, "Polymorphism", TRUE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(296, 74, "Abstraction", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(297, 75, "Better code organization and reusability", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(298, 75, "Faster execution speed", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(299, 75, "Reduced memory usage", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(300, 75, "Simpler syntax", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(301, 76, "To design applications", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(302, 76, "To manage computer resources and provide a user interface", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(303, 76, "To compile code", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(304, 76, "To secure network protocols", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(305, 77, "MS-DOS", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(306, 77, "Unix", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(307, 77, "Windows 95", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(308, 77, "Palm OS", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(309, 78, "A hardware component", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(310, 78, "A program in execution", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(311, 78, "A type of memory", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(312, 78, "A user interface", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(313, 79, "To provide a user interface", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(314, 79, "To manage core system operations like memory and CPU", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(315, 79, "To compile applications", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(316, 79, "To design file systems", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(317, 80, "First-Come, First-Served", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(318, 80, "Shortest Job Next", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(319, 80, "Round Robin", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(320, 80, "Priority Scheduling", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(321, 81, "A process that terminates unexpectedly", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(322, 81, "A situation where processes are unable to proceed due to resource contention", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(323, 81, "A memory overflow error", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(324, 81, "A hardware failure", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(325, 82, "Allocating and deallocating memory to processes", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(326, 82, "Designing user interfaces", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(327, 82, "Compiling source code", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(328, 82, "Encrypting network traffic", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(329, 83, "A type of physical RAM", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(330, 83, "A memory management technique using disk space as an extension of RAM", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(331, 83, "A type of cache memory", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(332, 83, "A hardware component", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(333, 84, "To manage hardware drivers", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(334, 84, "To organize and store data on storage devices", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(335, 84, "To compile programs", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(336, 84, "To secure network connections", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(337, 85, "Windows XP", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(338, 85, "RTOS", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(339, 85, "MS-DOS", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(340, 85, "Ubuntu", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(341, 86, "A type of hardware", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(342, 86, "A lightweight process that shares resources with other threads", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(343, 86, "A type of memory", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(344, 86, "A user interface component", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(345, 87, "To manage hardware signals and prioritize tasks", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(346, 87, "To compile code", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(347, 87, "To design file systems", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(348, 87, "To create user interfaces", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(349, 88, "Mutual Exclusion", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(350, 88, "First-Come, First-Served", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(351, 88, "Round Robin", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(352, 88, "Priority Scheduling", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(353, 89, "To allocate CPU time to processes", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(354, 89, "To manage file storage", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(355, 89, "To secure network connections", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(356, 89, "To compile applications", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(357, 90, "Dividing memory into fixed-size blocks", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(358, 90, "Allocating memory dynamically", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(359, 90, "Encrypting memory data", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(360, 90, "Managing CPU registers", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(361, 91, "A synchronization tool for managing access to resources", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(362, 91, "A type of memory", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(363, 91, "A hardware component", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(364, 91, "A user interface", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(365, 92, "Batch Processing", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(366, 92, "Network Protocol", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(367, 92, "Compiler System", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(368, 92, "Database System", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(369, 93, "To store temporary data for virtual memory", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(370, 93, "To compile programs", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(371, 93, "To manage hardware drivers", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(372, 93, "To secure network connections", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(373, 94, "Switching between hardware components", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(374, 94, "Switching the CPU from one process to another", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(375, 94, "Changing the file system", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(376, 94, "Updating the user interface", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(377, 95, "To compile code", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(378, 95, "To facilitate communication between the OS and hardware", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(379, 95, "To manage file systems", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(380, 95, "To design user interfaces", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(381, 96, "To load the operating system into memory", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(382, 96, "To compile applications", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(383, 96, "To manage network connections", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(384, 96, "To design file systems", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(385, 97, "Increased program execution speed", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(386, 97, "Reduced memory usage", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(387, 97, "Simplified file systems", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(388, 97, "Decreased system security", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(389, 98, "To provide an interface between a process and the OS", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(390, 98, "To compile source code", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(391, 98, "To design user interfaces", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(392, 98, "To manage network protocols", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(393, 99, "NTFS", TRUE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(394, 99, "TCP/IP", FALSE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(395, 99, "HTTP", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(396, 99, "FTP", FALSE, 3);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(397, 100, "To compile programs", FALSE, 0);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(398, 100, "To protect system resources and data", TRUE, 1);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(399, 100, "To design user interfaces", FALSE, 2);

INSERT INTO question_options (id, question_id, option_text, is_correct, order_num) VALUES
(400, 100, "To manage hardware drivers", FALSE, 3);


-- Verification queries
SELECT 'Questions by subject:' as info;
SELECT s.name, COUNT(q.id) as question_count 
FROM subjects s 
LEFT JOIN questions q ON s.id = q.subject_id 
GROUP BY s.id, s.name
ORDER BY s.id;

SELECT 'Total questions:', COUNT(*) FROM questions;
SELECT 'Total options:', COUNT(*) FROM question_options;
SELECT 'Correct answers per question check:';
SELECT question_id, COUNT(*) as correct_count 
FROM question_options 
WHERE is_correct = TRUE 
GROUP BY question_id 
HAVING correct_count != 1
ORDER BY question_id;

-- If the above query returns no rows, all questions have exactly one correct answer
SELECT 'Migration completed successfully!' as status;
