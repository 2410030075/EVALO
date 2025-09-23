document.addEventListener("DOMContentLoaded", function () {
    // Setup variables
    const questions = document.querySelectorAll(".question");
    const totalQuestions = questions.length;
    let currentQuestionIndex = 0;
    let userAnswers = {};
    let quizStarted = false;
    const quizPassword = "123"; // Default password for the quiz
    const authorPassword = "456"; // New password for the author to show answers

    // Timer setup - 3 hours
    let timeLeft = 1.5 * 60 * 60;  // 3 hours in seconds
    const timerElement = document.getElementById("timer");

    // Navigation buttons
    const prevBtn = document.getElementById("prevBtn");
    const nextBtn = document.getElementById("nextBtn");
    const submitBtn = document.getElementById("submitBtn");
    const resultDiv = document.getElementById("result");

    // Question navigation panel
    const rightBox = document.querySelector(".right.box");

    // Subject configuration
    const subjects = [
        { name: "DBMS", color: "#000000ff", questions: 25 },
        { name: "FEDF", color: "#000000ff", questions: 25 },
        { name: "OOP", color: "#000000ff", questions: 25 },
        { name: "OS", color: "#000000ff", questions: 25 }
    ];

    // Correct answers
    const correctAnswers = {
        q1: "B", // To manage and organize data
        q2: "A", // Data stored in tables
        q3: "A", // Structured Query Language
        q4: "B", // Primary Key
        q5: "B", // To establish a relationship between tables
        q6: "C", // Third Normal Form (3NF)
        q7: "C", // To retrieve data
        q8: "A", // Hierarchical
        q9: "A", // Atomicity, Consistency, Isolation, Durability
        q10: "C", // UPDATE
        q11: "B", // A virtual table based on a query
        q12: "A", // Constraints
        q13: "B", // To combine rows from two or more tables
        q14: "D", // FULL OUTER JOIN
        q15: "B", // To improve query performance
        q16: "C", // WHERE
        q17: "B", // A stored procedure executed automatically
        q18: "B", // Document
        q19: "B", // Saves a transaction permanently
        q20: "B", // To group rows with similar values
        q21: "B", // Reduced data redundancy
        q22: "B", // A collection of database objects
        q23: "B", // DROP
        q24: "B", // To filter grouped rows
        q25: "B", // MySQL
        q26: "B", // To remove all rows from a table
        q27: "B", // It must be unique and non-null
        q28: "B", // Storing the same data in multiple places
        q29: "B", // ORDER BY
        q30: "B", // To uniquely identify a record
        q31: "B", // Improved data security
        q32: "B", // A primary key made of multiple columns
        q33: "B", // INSERT
        q34: "B", // To undo changes in a transaction
        q35: "B", // NoSQL
        q36: "B", // Ensuring foreign keys match primary keys
        q37: "B", // Oracle
        q38: "B", // To modify the structure of a table
        q39: "C", // NOT NULL
        q40: "B", // To count the number of rows
        q41: "B", // Increased data redundancy
        q42: "B", // A precompiled set of SQL statements
        q43: "A", // LIMIT
        q44: "A", // To ensure data meets a specified condition
        q45: "C", // MongoDB
        q46: "B", // Eliminate data anomalies
        q47: "B", // MAX
        q48: "B", // To ensure data consistency
        q49: "A", // Clustered
        q50: "B", // To remove duplicate rows
        q26: "B", // Creating reusable UI components
        q27: "B", // Angular
        q28: "B", // Rendering efficiency
        q29: "B", // Bootstrap
        q30: "B", // To simplify user interface development
        q31: "A", // Svelte
        q32: "B", // A JavaScript syntax extension
        q33: "C", // Angular
        q34: "B", // Simple and intuitive syntax
        q35: "B", // Bulma
        q36: "A", // MVC architecture
        q37: "B", // Backbone.js
        q38: "B", // Simplifying DOM manipulation
        q39: "B", // Angular
        q40: "B", // Incremental adoptability
        q41: "B", // Compiles to vanilla JavaScript
        q42: "B", // Responsive design and styling
        q43: "B", // React
        q44: "B", // Convention over configuration
        q45: "B", // Utility-first CSS classes
        q46: "B", // Angular
        q47: "B", // Steep learning curve
        q48: "A", // Astro
        q49: "B", // Intuitive and human-readable classes
        q50: "A", // Foundation
        q51: "B", // To organize code using objects and classes
        q52: "A", // Encapsulation
        q53: "B", // A blueprint for creating objects
        q54: "B", // An instance of a class
        q55: "B", // Inheritance
        q56: "A", // Hiding data and exposing methods
        q57: "A", // Using one interface for multiple data types
        q58: "A", // Simplifying complex systems by modeling classes
        q59: "A", // extends
        q60: "B", // A special method to initialize objects
        q61: "B", // private
        q62: "A", // Defining multiple methods with the same name but different parameters
        q63: "A", // Redefining a parent class method in a subclass
        q64: "A", // A class that cannot be instantiated
        q65: "B", // A blueprint for methods that must be implemented
        q66: "A", // new
        q67: "A", // Calls the parent class constructor or methods
        q68: "A", // Refers to the current object
        q69: "A", // A method that belongs to the class rather than an instance
        q70: "A", // They cannot be inherited
        q71: "D", // package-private
        q72: "A", // To retrieve the value of a private field
        q73: "B", // To set the value of a private field
        q74: "C", // Polymorphism
        q75: "A", // Better code organization and reusability
        q76: "B", // To manage computer resources and provide a user interface
        q77: "B", // Unix
        q78: "B", // A program in execution
        q79: "B", // To manage core system operations like memory and CPU
        q80: "B", // Shortest Job Next
        q81: "B", // A situation where processes are unable to proceed due to resource contention
        q82: "A", // Allocating and deallocating memory to processes
        q83: "B", // A memory management technique using disk space as an extension of RAM
        q84: "B", // To organize and store data on storage devices
        q85: "B", // RTOS
        q86: "B", // A lightweight process that shares resources with other threads
        q87: "A", // To manage hardware signals and prioritize tasks
        q88: "A", // Mutual Exclusion
        q89: "A", // To allocate CPU time to processes
        q90: "A", // Dividing memory into fixed-size blocks
        q91: "A", // A synchronization tool for managing access to resources
        q92: "A", // Batch Processing
        q93: "A", // To store temporary data for virtual memory
        q94: "B", // Switching the CPU from one process to another
        q95: "B", // To facilitate communication between the OS and hardware
        q96: "A", // To load the operating system into memory
        q97: "A", // Increased program execution speed
        q98: "A", // To provide an interface between a process and the OS
        q99: "A", // NTFS
        q100: "B" // To protect system resources and data
    };

    // Show answers control flag
    let showAnswersEnabled = false;

    // Device detection
    function isMobileDevice() {
        return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
    }

    // Create quiz prerequisites panel
    const quizContainer = document.querySelector(".container");
    const prerequisiteDiv = document.createElement("div");
    prerequisiteDiv.classList.add("prerequisite");
    prerequisiteDiv.innerHTML = `
        <div class="prerequisite-box">
            <h2>Quiz Prerequisites</h2>
            <p>Before starting the quiz, please ensure:</p>
            <ul>
                <li id="flightmode-check">✗ ${isMobileDevice() ? 'Device must be in flight/airplane mode' : 'Please disconnect from internet (Wi-Fi/Ethernet)'}</li>
            </ul>
            <div id="password-section" style="display: none;">
                <p>Enter Quiz Password:</p>
                <input type="password" id="quiz-password" placeholder="Enter password">
                <p id="password-feedback" style="color: red; display: none;">Incorrect password!</p>
            </div>
            <button id="startQuizBtn" disabled>Start Quiz</button>
            <p id="flightmode-instruction">${isMobileDevice() ? 'Please enable flight/airplane mode on your device, then click below to confirm' : 'Please disconnect from internet, then click below to confirm'}</p>
            <button id="checkFlightModeBtn">${isMobileDevice() ? "I've Enabled Flight Mode" : "I've Disconnected Internet"}</button>
        </div>
    `;

    // Insert prerequisite div before the container
    document.body.insertBefore(prerequisiteDiv, quizContainer);
    quizContainer.style.display = "none";
    document.querySelector(".heading").style.display = "none";

    // Check flight mode button
    document.getElementById("checkFlightModeBtn").addEventListener("click", checkFlightMode);

    // Start quiz button
    document.getElementById("startQuizBtn").addEventListener("click", function () {
        const passwordInput = document.getElementById("quiz-password");
        if (passwordInput.value === quizPassword) {
            prerequisiteDiv.style.display = "none";
            quizContainer.style.display = "flex";
            document.querySelector(".heading").style.display = "flex";
            quizStarted = true;
            updateTimer(); // Start the timer only when quiz starts
        } else {
            const passwordFeedback = document.getElementById("password-feedback");
            passwordFeedback.style.display = "block";
            passwordInput.value = "";
        }
    });

    // Network status detection
    window.addEventListener("online", checkQuizViolation);

    function checkFlightMode() {
        const isLocalhost = window.location.hostname === 'localhost' ||
            window.location.hostname === '127.0.0.1' ||
            window.location.hostname === '0.0.0.0';

        let isOffline = !navigator.onLine;

        // For localhost, we'll simulate offline detection by checking external connectivity
        if (isLocalhost) {
            // For local development, we'll allow the quiz to proceed
            isOffline = true;
        }

        const flightmodeCheck = document.getElementById("flightmode-check");

        if (isOffline) {
            flightmodeCheck.innerHTML = `✓ ${isMobileDevice() ? 'Device is in flight/airplane mode' : 'Internet disconnected successfully'}`;
            flightmodeCheck.style.color = "green";

            // Show password section when flight mode is enabled
            document.getElementById("password-section").style.display = "block";
        } else {
            flightmodeCheck.innerHTML = `✗ ${isMobileDevice() ? 'Device must be in flight/airplane mode' : 'Please disconnect from internet (Wi-Fi/Ethernet)'}`;
            flightmodeCheck.style.color = "red";
        }

        updateStartButton();
    }

    function updateStartButton() {
        const startBtn = document.getElementById("startQuizBtn");
        const passwordSection = document.getElementById("password-section");

        // Check if running on localhost/local server
        const isLocalhost = window.location.hostname === 'localhost' ||
            window.location.hostname === '127.0.0.1' ||
            window.location.hostname === '0.0.0.0';

        let isOffline = !navigator.onLine;

        // For localhost, allow the quiz to proceed
        if (isLocalhost) {
            isOffline = true;
        }

        if (isOffline) {
            passwordSection.style.display = "block";
            startBtn.disabled = false;
        } else {
            passwordSection.style.display = "none";
            startBtn.disabled = true;
        }
    }

    function checkQuizViolation() {
        if (quizStarted) {
            if (navigator.onLine) {
                // Auto-submit quiz due to violation
                submitQuiz(true);
            }
        }
    }

    // Initialize subject-wise question navigation buttons
    rightBox.innerHTML = '';
    let questionCounter = 1;

    subjects.forEach((subject, subjectIndex) => {
        // Create subject header
        const subjectHeader = document.createElement("div");
        subjectHeader.classList.add("subject-header");
        subjectHeader.innerHTML = `<h3>${subject.name}</h3>`;
        subjectHeader.style.cssText = `
            background-color: ${subject.color};
            color: white;
            padding: 8px 12px;
            margin: 10px 0 5px 0;
            border-radius: 5px;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        `;
        rightBox.appendChild(subjectHeader);

        // Create questions container for this subject
        const questionsContainer = document.createElement("div");
        questionsContainer.classList.add("questions-container");
        questionsContainer.style.cssText = `
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 5px;
            margin-bottom: 15px;
            padding: 8px;
            background-color: #E8E8E8;
            border-radius: 5px;
            border: 2px solid black;
            overflow-y: auto;
            overflow-x: auto;

        `;

        // Create question buttons for this subject
        for (let i = 0; i < subject.questions; i++) {
            const btn = document.createElement("button");
            btn.classList.add("btn", "subject-btn");
            btn.textContent = questionCounter;
            btn.dataset.subject = subjectIndex;
            btn.dataset.questionIndex = questionCounter - 1;

            btn.style.cssText = `
                padding: 8px;
                border: 2px solid ${subject.color};
                background-color: white;
                color: ${subject.color};
                border-radius: 4px;
                font-weight: bold;
                cursor: pointer;
                transition: all 0.3s ease;
                min-height: 35px;
                font-size: 12px;
            `;

            btn.addEventListener("click", function () {
                showQuestion(parseInt(this.dataset.questionIndex));
            });

            // Hover effects
            btn.addEventListener("mouseenter", function () {
                if (!this.classList.contains('active')) {
                    this.style.backgroundColor = subject.color + '20';
                }
            });

            btn.addEventListener("mouseleave", function () {
                if (!this.classList.contains('active')) {
                    this.style.backgroundColor = 'white';
                }
            });

            questionsContainer.appendChild(btn);
            questionCounter++;
        }

        rightBox.appendChild(questionsContainer);
    });

    // Add enhanced CSS styles
    const subjectStyles = document.createElement("style");
    subjectStyles.textContent = `
        .right.box {
            overflow-y: auto;
            max-height: 80vh;
            padding: 10px;
        }

        .right.box::-webkit-scrollbar {
            width: 6px;
        }

        .right.box::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 3px;
        }

        .right.box::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 3px;
        }

        .right.box::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        .subject-header h3 {
            margin: 0;
            font-size: 14px;
        }

        .questions-container {
            animation: fadeIn 0.3s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Enhanced button states */
        .right.box .btn.subject-btn.active {
            background-color: #2196F3 !important;
            color: white !important;
            border-color: #2196F3 !important;
            transform: scale(1.1);
            box-shadow: 0 2px 8px rgba(33, 150, 243, 0.3);
        }

        .right.box .btn.subject-btn.answered {
            background-color: #4CAF50 !important;
            color: white !important;
            border-color: #4CAF50 !important;
        }

        .right.box .btn.subject-btn.correct {
            background-color: #4CAF50 !important;
            color: white !important;
            border-color: #4CAF50 !important;
            box-shadow: 0 0 10px rgba(76, 175, 80, 0.5);
        }

        .right.box .btn.subject-btn.incorrect {
            background-color: #f44336 !important;
            color: white !important;
            border-color: #f44336 !important;
            box-shadow: 0 0 10px rgba(244, 67, 54, 0.5);
        }

        .right.box .btn.subject-btn.not-attempted {
            background-color: #ff9800 !important;
            color: white !important;
            border-color: #ff9800 !important;
            opacity: 0.8;
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            .questions-container {
                grid-template-columns: repeat(4, 1fr);
                gap: 3px;
            }
            
            .right.box .btn.subject-btn {
                padding: 6px;
                font-size: 11px;
                min-height: 30px;
            }
            
            .subject-header {
                font-size: 12px !important;
                padding: 6px 8px !important;
            }
        }

        @media (max-width: 480px) {
            .questions-container {
                grid-template-columns: repeat(3, 1fr);
            }
        }
    `;
    document.head.appendChild(subjectStyles);

    // Track answer changes
    document.querySelectorAll('input[type="radio"]').forEach(radio => {
        radio.addEventListener('change', function () {
            const questionName = this.name;
            const questionNumber = parseInt(questionName.substring(1)) - 1;
            userAnswers[questionName] = this.value;

            // Update the navigation button to show it's been answered
            document.querySelectorAll('.right.box .btn.subject-btn')[questionNumber].classList.add('answered');
        });
    });

    // Function to display a specific question
    function showQuestion(index) {
        questions.forEach((q, i) => {
            q.style.display = i === index ? "block" : "none";
        });

        // Update navigation buttons
        if (!resultDiv.style.display || resultDiv.style.display === "none") {
            prevBtn.style.display = index === 0 ? "none" : "inline-block";
            nextBtn.style.display = index === questions.length - 1 ? "none" : "inline-block";

            // Only show submit button on the last question
            if (index === questions.length - 1) {
                submitBtn.style.display = "block";
            } else {
                submitBtn.style.display = "none";
            }
        } else {
            // After quiz submission, always show navigation
            prevBtn.style.display = "inline-block";
            nextBtn.style.display = "inline-block";
            submitBtn.style.display = "none";
        }

        // Update the active question button
        document.querySelectorAll('.right.box .btn.subject-btn').forEach((btn, i) => {
            if (parseInt(btn.dataset.questionIndex) === index) {
                btn.classList.add('active');
                // Get subject color for active state
                const subjectIndex = parseInt(btn.dataset.subject);
                const subjectColor = subjects[subjectIndex].color;
                btn.style.backgroundColor = '#2196F3';
                btn.style.color = 'white';
                btn.style.borderColor = '#2196F3';
            } else {
                btn.classList.remove('active');
                // Reset to appropriate state
                const qKey = `q${i + 1}`;
                const subjectIndex = parseInt(btn.dataset.subject);
                const subjectColor = subjects[subjectIndex].color;

                if (!btn.classList.contains('answered') && !btn.classList.contains('correct') &&
                    !btn.classList.contains('incorrect') && !btn.classList.contains('not-attempted')) {
                    btn.style.backgroundColor = 'white';
                    btn.style.color = subjectColor;
                    btn.style.borderColor = subjectColor;
                }
            }
        });

        currentQuestionIndex = index;
    }

    // Initialize timer
    function updateTimer() {
        let minutes = Math.floor(timeLeft / 60);
        let seconds = timeLeft % 60;

        timerElement.textContent = `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;

        if (timeLeft > 0) {
            timeLeft--;
            setTimeout(updateTimer, 1000);
        } else {
            // Time's up - auto submit
            submitQuiz();
        }
    }

    // Submit the quiz
    function submitQuiz(violation = false) {
        let score = 0;
        let answeredCount = 0;

        // Calculate score
        for (let key in correctAnswers) {
            if (userAnswers[key]) {
                answeredCount++;
                if (userAnswers[key] === correctAnswers[key]) {
                    score++;
                }
            }
        }

        // Display simplified result
        const timeExpired = timeLeft <= 0;
        resultDiv.innerHTML = `
            <h2>Quiz Results</h2>
            <p>Your Score: ${score}/${totalQuestions}</p>
            <p>Questions Answered: ${answeredCount}/${totalQuestions}</p>
            ${timeExpired ? '<p>Time Expired!</p>' : ''}
            ${violation ? '<p>Quiz rules violated! Quiz auto-submitted.</p>' : ''}
            <p>You can now navigate through the questions to see the correct answers.</p>
            <div id="author-controls" style="margin-top: 20px; padding: 10px; border: 1px dashed #ccc; background-color: #f9f9f9;">
                <p><strong>Author Controls:</strong></p>
                <input type="password" id="author-password" placeholder="Author Password">
                <button id="toggle-answers-btn">Show Answers</button>
                <p id="author-feedback" style="color: red; display: none;">Incorrect author password!</p>
            </div>
        `;

        resultDiv.style.display = "block";

        // Set up the toggle answers button
        document.getElementById("toggle-answers-btn").addEventListener("click", function () {
            const authorPasswordInput = document.getElementById("author-password");
            const authorFeedback = document.getElementById("author-feedback");

            if (authorPasswordInput.value === authorPassword) {
                showAnswersEnabled = !showAnswersEnabled;
                this.textContent = showAnswersEnabled ? "Hide Answers" : "Show Answers";
                authorFeedback.style.display = "none";

                if (showAnswersEnabled) {
                    showCorrectAnswers();
                } else {
                    hideCorrectAnswers();
                }

                // Update navigation button styles
                updateNavigationButtonStyles();
            } else {
                authorFeedback.style.display = "block";
                authorPasswordInput.value = "";
            }
        });

        // Disable all inputs but keep navigation enabled
        document.querySelectorAll("input[type=radio]").forEach(input => {
            input.disabled = true;
        });

        // Enable navigation buttons for review
        prevBtn.disabled = false;
        nextBtn.disabled = false;
        submitBtn.disabled = true;

        // Show navigation buttons for review mode
        prevBtn.style.display = "inline-block";
        nextBtn.style.display = "inline-block";
        submitBtn.style.display = "none";

        // Update navigation button styles to show answer status
        updateNavigationButtonStyles();

        // Only show correct answers if enabled
        if (showAnswersEnabled) {
            showCorrectAnswers();
        }

        // End quiz state
        quizStarted = false;
    }

    // Show correct answers in each question
    function showCorrectAnswers() {
        questions.forEach((question, index) => {
            const questionKey = `q${index + 1}`;
            const correctAnswer = correctAnswers[questionKey];

            // Create or find the correct answer display element
            let answerDisplay = question.querySelector('.correct-answer-display');
            if (!answerDisplay) {
                answerDisplay = document.createElement('div');
                answerDisplay.className = 'correct-answer-display';
                answerDisplay.style.marginTop = '10px';
                answerDisplay.style.padding = '10px';
                answerDisplay.style.backgroundColor = '#e8f5e9';
                answerDisplay.style.border = '1px solid #4CAF50';
                answerDisplay.style.borderRadius = '5px';
                question.appendChild(answerDisplay);
            }

            // Show the correct answer
            answerDisplay.innerHTML = `<strong>Correct Answer:</strong> ${correctAnswer}`;
            answerDisplay.style.display = 'block';

            // Highlight the correct and user-selected options
            const options = question.querySelectorAll('input[type="radio"]');
            options.forEach(option => {
                const optionLabel = option.parentElement;

                // Reset styles
                optionLabel.style.fontWeight = 'normal';

                // Highlight correct answer
                if (option.value === correctAnswer) {
                    optionLabel.style.color = '#4CAF50';
                    optionLabel.style.fontWeight = 'bold';
                }

                // Highlight user's incorrect answer if applicable
                const userAnswer = userAnswers[questionKey];
                if (userAnswer && userAnswer !== correctAnswer && option.value === userAnswer) {
                    optionLabel.style.color = '#ffffffff';
                    optionLabel.style.fontWeight = 'bold';
                }
            });
        });
    }

    // Hide correct answers
    function hideCorrectAnswers() {
        questions.forEach((question) => {
            // Hide correct answer display
            const answerDisplay = question.querySelector('.correct-answer-display');
            if (answerDisplay) {
                answerDisplay.style.display = 'none';
            }

            // Reset option styles
            const options = question.querySelectorAll('input[type="radio"]');
            options.forEach(option => {
                const optionLabel = option.parentElement;
                optionLabel.style.color = '';
                optionLabel.style.fontWeight = 'normal';
            });
        });
    }

    // Update navigation button styles
    function updateNavigationButtonStyles() {
        document.querySelectorAll('.right.box .btn.subject-btn').forEach((btn, i) => {
            const qKey = `q${i + 1}`;
            btn.disabled = false;

            // Clear previous classes
            btn.classList.remove('answered', 'correct', 'incorrect', 'not-attempted');

            // Get subject color for this button
            const subjectIndex = parseInt(btn.dataset.subject);
            const subjectColor = subjects[subjectIndex].color;

            // If answers are enabled, show correct/incorrect status
            if (showAnswersEnabled) {
                if (userAnswers[qKey]) {
                    if (userAnswers[qKey] === correctAnswers[qKey]) {
                        btn.classList.add('correct');
                    } else {
                        btn.classList.add('incorrect');
                    }
                } else {
                    btn.classList.add('not-attempted');
                }
            } else {
                // If answers are disabled, just show which ones were answered
                if (userAnswers[qKey]) {
                    btn.classList.add('answered');
                } else {
                    // Reset to original subject color
                    btn.style.backgroundColor = 'white';
                    btn.style.color = subjectColor;
                    btn.style.borderColor = subjectColor;
                }
            }
        });
    }

    // Event listeners
    prevBtn.addEventListener("click", function () {
        if (currentQuestionIndex > 0) {
            showQuestion(currentQuestionIndex - 1);
        }
    });

    nextBtn.addEventListener("click", function () {
        if (currentQuestionIndex < questions.length - 1) {
            showQuestion(currentQuestionIndex + 1);
        }
    });

    submitBtn.addEventListener("click", function () { submitQuiz(false); });

    // Initialize the quiz - but don't start timer yet
    showQuestion(0);
    // updateTimer() is now only called when quiz actually starts
});

