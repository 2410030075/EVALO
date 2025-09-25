// Enhanced script.js for 100-question database-backed quiz system
document.addEventListener("DOMContentLoaded", function () {
    // Setup variables
    let totalQuestions = 0;
    let currentQuestionIndex = 0;
    let userAnswers = {};
    let quizStarted = false;
    let attemptId = null;
    let quizData = null;
    let correctAnswers = {};

    const quizPassword = "123"; // Default password for the quiz
    const authorPassword = "boat4567"; // Password for showing answers

    // Timer setup - will be set from database
    let timeLeft = 90 * 60; // Default 90 minutes in seconds
    const timerElement = document.getElementById("timer");

    // Navigation buttons
    const prevBtn = document.getElementById("prevBtn");
    const nextBtn = document.getElementById("nextBtn");
    const submitBtn = document.getElementById("submitBtn");
    const resultDiv = document.getElementById("result");
    const progressFill = document.getElementById("progressFill");

    // Question navigation panel
    const rightBox = document.querySelector(".right.box");

    // Show answers control flag
    let showAnswersEnabled = false;

    // API base URL
    // If the page is served from the backend on port 8080, we can use relative '/api'.
    // When opened via a static server (e.g., Live Server on 5500), point explicitly to the backend.
    const API_BASE = (location.port === '8080') ? '/api' : 'http://localhost:8080/api';

    // Subject color mapping
    const subjectColors = {
        1: '#000000', // DBMS - Black
        2: '#FF6B6B', // FEDF - Red
        3: '#4ECDC4', // OOP - Teal
        4: '#45B7D1'  // OS - Blue
    };

    // Device detection
    function isMobileDevice() {
        return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
    }

    // Internet connectivity detection
    let isOnline = navigator.onLine;
    let connectionStatus = {
        online: isOnline,
        lastChecked: new Date(),
        flightModeRequired: true
    };

    function updateConnectionStatus() {
        const wasOnline = connectionStatus.online;
        connectionStatus.online = navigator.onLine;
        connectionStatus.lastChecked = new Date();
        
        console.log(`Status update: navigator.onLine changed from ${wasOnline} to ${connectionStatus.online}`);
        
        if (wasOnline !== connectionStatus.online) {
            updateFlightModeIndicator();
            updateQuizStartButton();
        }
    }

    function checkInternetConnection() {
        console.log("Performing connection check...");
        
        // Use a more reliable technique to check internet connectivity
        // We'll do a direct test to known external resources with actual fetch
        // and consider it offline ONLY if ALL external resource tests fail
        
        // Define some reliable external resources to check
        const testUrls = [
            'https://www.google.com/generate-204',
            'https://www.cloudflare.com/cdn-cgi/trace',
            'https://www.bing.com'
        ];
        
        // Create a fetch promise for each URL with a short timeout
        const fetchPromises = testUrls.map(url => {
            return new Promise((resolve, reject) => {
                // Use Date.now() to prevent caching
                const nocacheUrl = `${url}?nc=${Date.now()}`;
                
                // Set a timeout for the fetch to avoid long waits
                const timeoutId = setTimeout(() => {
                    console.log(`Fetch timeout for ${url}`);
                    reject(new Error('Timeout'));
                }, 2000);
                
                fetch(nocacheUrl, { 
                    method: 'HEAD',
                    mode: 'no-cors',
                    cache: 'no-store'
                })
                .then(response => {
                    clearTimeout(timeoutId);
                    console.log(`Fetch success for ${url}`);
                    resolve(true);
                })
                .catch(error => {
                    clearTimeout(timeoutId);
                    console.log(`Fetch failed for ${url}: ${error.message}`);
                    reject(error);
                });
            });
        });
        
        // Consider online only if at least one fetch succeeds
        Promise.any(fetchPromises)
            .then(() => {
                // At least one URL was reachable - we're online
                console.log('ONLINE: At least one external resource reachable');
                if (!connectionStatus.online) {
                    connectionStatus.online = true;
                    updateFlightModeIndicator();
                    updateQuizStartButton();
                }
            })
            .catch(error => {
                // ALL URLs failed - we're likely offline
                console.log('OFFLINE: All external resources unreachable');
                connectionStatus.online = false;
                updateFlightModeIndicator();
                updateQuizStartButton();
            });
    }

    function updateFlightModeIndicator() {
        const indicator = document.getElementById('flight-mode-indicator');
        const statusText = document.getElementById('connection-status');
        const startButton = document.querySelector('button[onclick="verifyPasswordAndStart()"]');
        
        console.log('Updating flight mode indicator - online status:', connectionStatus.online);
        
        if (indicator) {
            if (connectionStatus.online) {
                indicator.className = 'flight-mode-indicator online';
                statusText.textContent = '🌐 Internet Connected - Flight mode required to start quiz';
                indicator.style.borderColor = '#ff4757';
                indicator.style.backgroundColor = '#ff6b7a';
                console.log('UI updated: Online state');
            } else {
                indicator.className = 'flight-mode-indicator offline';
                statusText.textContent = '✈️ Flight mode active - Quiz can be started';
                indicator.style.borderColor = '#2ed573';
                indicator.style.backgroundColor = '#7bed9f';
                console.log('UI updated: Offline state');
            }
        } else {
            console.log('Warning: flight-mode-indicator element not found');
        }
    }

    function updateQuizStartButton() {
        const startButton = document.querySelector('button[onclick="verifyPasswordAndStart()"]');
        console.log('Updating start button - online status:', connectionStatus.online);
        
        if (startButton) {
            if (connectionStatus.online) {
                startButton.disabled = true;
                startButton.style.backgroundColor = '#ccc';
                startButton.style.cursor = 'not-allowed';
                startButton.textContent = 'Turn off Internet to Start Quiz';
                console.log('Start button disabled - internet detected');
            } else {
                startButton.disabled = false;
                startButton.style.backgroundColor = '';
                startButton.style.cursor = '';
                startButton.textContent = 'Start 100-Question Quiz';
                console.log('Start button enabled - flight mode active');
            }
        } else {
            console.log('Warning: start button not found');
        }
    }

    // Set up event listeners for online/offline events
    window.addEventListener('online', updateConnectionStatus);
    window.addEventListener('offline', updateConnectionStatus);

    // Periodically check connection status
    setInterval(checkInternetConnection, 3000); // Check every 3 seconds

    // API helper functions
    async function apiCall(endpoint, method = 'GET', body = null) {
        try {
            const options = {
                method,
                headers: {
                    'Content-Type': 'application/json',
                }
            };

            if (body) {
                options.body = JSON.stringify(body);
            }

            const url = API_BASE + endpoint;
            const response = await fetch(url, options);

            // Try to parse response safely
            const contentType = response.headers.get('content-type') || '';
            let data = null;
            if (response.status === 204) {
                data = {};
            } else if (contentType.includes('application/json')) {
                // Parse JSON if body exists
                const text = await response.text();
                data = text ? JSON.parse(text) : {};
            } else {
                // Fallback: read text (useful for error messages from proxies/servers)
                data = { message: await response.text() };
            }

            if (!response.ok) {
                const message = (data && (data.error || data.message)) || `API request failed (${response.status})`;
                throw new Error(message);
            }

            return data;
        } catch (error) {
            console.error('API Error:', error);
            throw error;
        }
    }

    // Initialize quiz
    async function initializeQuiz() {
        try {
            // Show prerequisite screen
            showPrerequisites();
        } catch (error) {
            console.error('Quiz initialization error:', error);
            alert('Failed to initialize quiz. Please refresh the page.');
        }
    }

    // Show prerequisites panel
    function showPrerequisites() {
        const quizContainer = document.querySelector(".container");
        const prerequisiteDiv = document.createElement("div");
        prerequisiteDiv.classList.add("prerequisite");
        prerequisiteDiv.innerHTML = `
            <div class="prerequisite-content">
                <h2>Computer Science Fundamentals Quiz</h2>
                <div class="quiz-details">
                    <p><strong>100 Questions</strong> covering 4 major subjects:</p>
                    <ul style="list-style: none; padding: 0;">
                        <li>🗄️ <strong>DBMS</strong>: Questions 1-25 (Database Management Systems)</li>
                        <li>🌐 <strong>FEDF</strong>: Questions 26-50 (Front-End Development Frameworks)</li>
                        <li>⚙️ <strong>OOP</strong>: Questions 51-75 (Object-Oriented Programming)</li>
                        <li>💻 <strong>OS</strong>: Questions 76-100 (Operating Systems)</li>
                    </ul>
                </div>
                
                <!-- Flight Mode Status Indicator -->
                <div id="flight-mode-indicator" class="flight-mode-indicator">
                    <div class="indicator-icon">✈️</div>
                    <div id="connection-status" class="connection-status">
                        🌐 Checking internet connection...
                    </div>
                    <button type="button" onclick="forceConnectionCheck()" style="margin-left: 10px; padding: 5px 10px; border: none; border-radius: 5px; background: #3498db; color: white; cursor: pointer; font-size: 12px;">
                        🔄 Recheck
                    </button>
                </div>
                
                <div class="prerequisites-list">
                    <p><strong>Before starting, please ensure:</strong></p>
                    <ul>
                        <li><strong>❗ Turn OFF internet connection (Enable flight mode)</strong></li>
                        <li>Close all other browser tabs and applications</li>
                        <li>Ensure you have a stable power source</li>
                        <li>Find a quiet environment for concentration</li>
                        <li>Allocate 90 minutes for completion</li>
                    </ul>
                    <p style="color: #ff4757; font-weight: bold; margin-top: 15px;">
                        ⚠️ Quiz cannot be started while internet is connected
                    </p>
                </div>
                <div class="password-section">
                    <label for="quiz-password">Enter Quiz Password:</label>
                    <input type="password" id="quiz-password" placeholder="Enter password">
                    <button onclick="verifyPasswordAndStart()" id="start-quiz-btn">Start 100-Question Quiz</button>
                    <div id="password-error" style="color: red; display: none; margin-top: 10px;"></div>
                </div>
            </div>
        `;
        prerequisiteDiv.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.9);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            overflow-y: auto;
        `;

        document.body.appendChild(prerequisiteDiv);

        // Initialize connection status check
        setTimeout(() => {
            // Initial check
            checkInternetConnection();
            
            // Secondary check after a delay for better accuracy
            setTimeout(() => {
                checkInternetConnection();
                updateFlightModeIndicator();
                updateQuizStartButton();
            }, 1000);
        }, 500);

        // Make functions global
        window.forceConnectionCheck = function() {
            console.log('=== Manual Connection Check ===');
            
            // Show checking status
            const statusText = document.getElementById('connection-status');
            if (statusText) {
                statusText.textContent = '🔄 Checking connection status...';
            }
            
            // Clear any previous checks and run a new one
            checkInternetConnection();
            
            // Run a second check after a delay for better accuracy
            setTimeout(() => {
                checkInternetConnection();
            }, 1000);
        };

    window.verifyPasswordAndStart = async function() {
            // Debug information
            console.log('=== Quiz Start Attempt ===');
            console.log('connectionStatus.online:', connectionStatus.online);
            console.log('connectionStatus.lastChecked:', connectionStatus.lastChecked);
            
            // Run a quick connection check first
            await new Promise(resolve => {
                // Show checking status
                const statusText = document.getElementById('connection-status');
                if (statusText) {
                    statusText.textContent = '🔄 Final connection check...';
                }
                
                // Create a separate promise just for this final check
                const testUrls = ['https://www.google.com/generate-204'];
                
                const fetchPromises = testUrls.map(url => {
                    return new Promise((resolve, reject) => {
                        fetch(`${url}?nc=${Date.now()}`, { 
                            method: 'HEAD',
                            mode: 'no-cors',
                            cache: 'no-store'
                        })
                        .then(() => resolve(true))
                        .catch(() => reject(false));
                    });
                });
                
                Promise.any(fetchPromises)
                    .then(() => {
                        connectionStatus.online = true;
                        resolve();
                    })
                    .catch(() => {
                        connectionStatus.online = false;
                        resolve();
                    });
                
                // Set a timeout to ensure we don't wait too long
                setTimeout(resolve, 2000);
            });
            
            updateFlightModeIndicator();
            updateQuizStartButton();
            
            // After final check, verify if we're offline
            if (connectionStatus.online) {
                alert('❗ Please turn off your internet connection (enable flight mode) before starting the quiz.');
                console.log('Quiz start blocked: Connection detected');
                return;
            }

            const password = document.getElementById('quiz-password').value;
            const errorDiv = document.getElementById('password-error');

            // Local password verification to avoid backend dependency
            if (password !== quizPassword) {
                errorDiv.textContent = 'Invalid password';
                errorDiv.style.display = 'block';
                return;
            }

            console.log('Password verified locally, starting quiz...');
            prerequisiteDiv.remove();
            await loadQuizData();
        };
    }

    // Load quiz data from backend
    async function loadQuizData() {
        try {
            // Start quiz attempt (Java backend expects userId as query param)
            const startResponse = await apiCall('/quiz/1/start?userId=1', 'POST');
            attemptId = startResponse.id || startResponse.attempt_id || startResponse.attemptId;

            // Load questions
            const questions = await apiCall('/quiz/1/questions');

            // Load subjects (if available) to enrich with name/color
            let subjects = [];
            try {
                subjects = await apiCall('/quiz/subjects');
            } catch (_) { /* optional */ }

            // Build a lookup for subjects by id (fallback to name/color from question if present)
            const subjectById = new Map();
            if (Array.isArray(subjects)) {
                subjects.forEach(s => subjectById.set(s.id || s.subjectId, s));
            }

            // For each question, fetch options in parallel
            const optionPromises = questions.map(q => apiCall(`/quiz/questions/${q.id}/options`).catch(() => []));
            const allOptions = await Promise.all(optionPromises);

            // Adapt data to expected shape in the UI
            const adaptedQuestions = questions.map((q, idx) => {
                const subjectId = q.subjectId || q.subject_id;
                const subject = subjectById.get(subjectId) || { id: subjectId, name: q.subjectName || 'Subject', color: q.subjectColor || subjectColors[subjectId] || '#999' };
                const optionsRaw = allOptions[idx] || [];
                const options = optionsRaw.map(o => ({
                    id: o.id,
                    option_text: o.optionText || o.option_text,
                    is_correct: (o.isCorrect !== undefined ? o.isCorrect : o.is_correct)
                }));
                return {
                    id: q.id,
                    subject_id: subjectId,
                    order_num: q.orderNum || q.order_num || (idx + 1),
                    question_text: q.questionText || q.question_text,
                    options
                };
            });

            const uniqueSubjectIds = [...new Set(adaptedQuestions.map(q => q.subject_id))];
            const adaptedSubjects = uniqueSubjectIds.map(id => {
                const s = subjectById.get(id);
                return {
                    id,
                    name: s?.name || s?.subjectName || `Subject ${id}`,
                    color: s?.color || s?.subjectColor || subjectColors[id] || '#666'
                };
            });

            quizData = {
                questions: adaptedQuestions,
                subjects: adaptedSubjects,
                total_questions: adaptedQuestions.length
            };

            console.log(`Loaded ${quizData.total_questions} questions from database`);

            // Process and display questions
            await processQuizData();

            // Start the quiz
            startQuiz();

        } catch (error) {
            console.error('Failed to load quiz data:', error);
            alert('Failed to load quiz data. Please refresh the page.');
        }
    }

    // Process quiz data and generate HTML
    async function processQuizData() {
        const quizForm = document.getElementById('quizForm');
        const loadingDiv = document.getElementById('loading');

        quizForm.innerHTML = '';
        loadingDiv.style.display = 'block';

        // Group questions by subject
        const questionsBySubject = {};
        quizData.questions.forEach(q => {
            if (!questionsBySubject[q.subject_id]) {
                questionsBySubject[q.subject_id] = [];
            }
            questionsBySubject[q.subject_id].push(q);
        });

        // Sort questions by order number
        quizData.questions.sort((a, b) => a.order_num - b.order_num);

        let questionIndex = 0;

        // Generate HTML for all questions
        quizData.questions.forEach((question, index) => {
            const subject = quizData.subjects.find(s => s.id === question.subject_id);
            correctAnswers[`q${question.id}`] = question.options.find(opt => opt.is_correct)?.option_text || '';

            const questionDiv = document.createElement('div');
            questionDiv.className = 'question';
            questionDiv.style.display = index === 0 ? 'block' : 'none';

            let optionsHTML = '';
            question.options.forEach((option, optIndex) => {
                optionsHTML += `
                    <label>
                        <input type="radio" name="q${question.id}" value="${option.id}" data-question-id="${question.id}">
                        <span>${option.option_text}</span>
                    </label>
                `;
            });

            questionDiv.innerHTML = `
                <div class="question-header">
                    <h3>Question ${question.order_num}</h3>
                    <span class="subject-badge" style="background-color: ${subject.color}">${subject.name}</span>
                </div>
                <p class="question-text">${question.question_text}</p>
                <div class="options">
                    ${optionsHTML}
                </div>
            `;

            quizForm.appendChild(questionDiv);
            questionIndex++;
        });

        totalQuestions = questionIndex;
        loadingDiv.style.display = 'none';

        // Update navigation
        createNavigationButtons();
        updateNavigationButtonStyles();
    }

    // Create navigation buttons in right panel
    function createNavigationButtons() {
        const navigationGrid = document.querySelector('.navigation-grid');
        navigationGrid.innerHTML = '';

        for (let i = 0; i < totalQuestions; i++) {
            const btn = document.createElement('button');
            btn.textContent = i + 1;
            btn.className = 'nav-btn';
            btn.onclick = () => showQuestion(i);
            navigationGrid.appendChild(btn);
        }
    }

    // Start quiz functionality
    function startQuiz() {
        quizStarted = true;
        document.querySelector('.container').style.display = 'flex';

        // Set up timer based on quiz configuration (90 minutes for 100 questions)
        timeLeft = 90 * 60;

        updateTimer();
        const timer = setInterval(() => {
            if (!quizStarted) {
                clearInterval(timer);
                return;
            }
            updateTimer();
        }, 1000);

        function updateTimer() {
            if (timeLeft <= 0) {
                clearInterval(timer);
                submitQuiz(true); // Auto-submit when time expires
                return;
            }

            const hours = Math.floor(timeLeft / 3600);
            const minutes = Math.floor((timeLeft % 3600) / 60);
            const seconds = timeLeft % 60;

            timerElement.textContent = 
                `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;

            // Change color when time is running low
            if (timeLeft < 300) { // Less than 5 minutes
                timerElement.style.color = '#f44336';
            } else if (timeLeft < 900) { // Less than 15 minutes
                timerElement.style.color = '#ff9800';
            }

            timeLeft--;
        }

        // Set up event listeners
        setupEventListeners();

        // Show first question
        showQuestion(0);
    }

    // Set up event listeners
    function setupEventListeners() {
        // Navigation buttons
        prevBtn.addEventListener("click", () => {
            if (currentQuestionIndex > 0) {
                showQuestion(currentQuestionIndex - 1);
            }
        });

        nextBtn.addEventListener("click", () => {
            if (currentQuestionIndex < totalQuestions - 1) {
                showQuestion(currentQuestionIndex + 1);
            }
        });

        submitBtn.addEventListener("click", () => {
            const answeredCount = Object.keys(userAnswers).length;
            const confirmMessage = answeredCount === totalQuestions 
                ? "Are you sure you want to submit the quiz?" 
                : `You have answered ${answeredCount} out of ${totalQuestions} questions. Are you sure you want to submit?`;

            if (confirm(confirmMessage)) {
                submitQuiz();
            }
        });

        // Answer selection
        document.addEventListener('change', async (e) => {
            if (e.target.type === 'radio' && quizStarted) {
                const questionId = e.target.dataset.questionId;
                const selectedOptionId = e.target.value;
                const questionName = e.target.name;

                // Store locally
                userAnswers[questionName] = selectedOptionId;

                // Update progress
                updateProgress();

                // Visual feedback for selected option
                const labels = e.target.closest('.options').querySelectorAll('label');
                labels.forEach(label => label.classList.remove('selected'));
                e.target.closest('label').classList.add('selected');

                // Send to backend
                try {
                    await apiCall(`/quiz/attempts/${attemptId}/answer`, 'POST', {
                        questionId: parseInt(questionId),
                        selectedOptionId: parseInt(selectedOptionId)
                    });
                } catch (error) {
                    console.error('Failed to save answer:', error);
                }

                updateNavigationButtonStyles();
            }
        });
    }

    // Update progress bar
    function updateProgress() {
        const progress = (Object.keys(userAnswers).length / totalQuestions) * 100;
        progressFill.style.width = `${progress}%`;
    }

    // Show specific question
    function showQuestion(index) {
        const allQuestions = document.querySelectorAll(".question");

        if (allQuestions.length === 0) {
            // No questions available
            const loadingDiv = document.getElementById('loading');
            if (loadingDiv) {
                loadingDiv.style.display = 'none';
            }
            const quizForm = document.getElementById('quizForm');
            quizForm.innerHTML = '<p style="padding:20px;">No questions available for this quiz. Please ensure the database is initialized.</p>';
            prevBtn.disabled = true;
            nextBtn.disabled = true;
            submitBtn.disabled = true;
            return;
        }

        // Hide all questions
        allQuestions.forEach(q => q.style.display = 'none');

        // Show selected question
        if (allQuestions[index]) {
            allQuestions[index].style.display = 'block';
            currentQuestionIndex = index;

            // Restore selected answer if exists
            const questionElement = allQuestions[index];
            const radioInputs = questionElement.querySelectorAll('input[type="radio"]');
            radioInputs.forEach(input => {
                if (userAnswers[input.name] === input.value) {
                    input.checked = true;
                    input.closest('label').classList.add('selected');
                }
            });
        }

        // Update navigation buttons
        prevBtn.disabled = (index === 0);
        nextBtn.disabled = (index === totalQuestions - 1);

        // Update navigation button styles
        updateNavigationButtonStyles();
    }

    // Update navigation button styles
    function updateNavigationButtonStyles() {
        const navButtons = document.querySelectorAll('.nav-btn');
        navButtons.forEach((btn, index) => {
            const questionId = quizData.questions[index]?.id;
            const questionName = `q${questionId}`;

            btn.classList.remove('answered', 'current');

            if (userAnswers[questionName]) {
                btn.classList.add('answered');
            }

            if (index === currentQuestionIndex) {
                btn.classList.add('current');
            }
        });
    }

    // Submit quiz
    async function submitQuiz(timeExpired = false) {
        try {
            quizStarted = false;
            const result = await apiCall(`/quiz/attempts/${attemptId}/complete`, 'POST');

            // Adapt result shape for UI
            const adapted = {
                score: (typeof result.score === 'number') ? result.score : Math.round(((result.correctAnswers ?? 0) * 100) / (result.totalQuestions || totalQuestions || 1)),
                correct_answers: result.correctAnswers ?? result.correct_answers ?? 0,
                total_questions: result.totalQuestions ?? result.total_questions ?? totalQuestions
            };

            showResults(adapted, timeExpired);

        } catch (error) {
            console.error('Failed to submit quiz:', error);
            alert('Failed to submit quiz. Please try again.');
        }
    }

    // Show quiz results
    function showResults(results, timeExpired = false) {
        const { score, correct_answers, total_questions } = results;

        // Calculate subject-wise scores
        const subjectScores = calculateSubjectScores();

        resultDiv.innerHTML = `
            <div class="result-content">
                <h2>Quiz Completed!</h2>
                <div class="score-display">
                    <div class="score-circle">
                        <span class="score">${score}%</span>
                    </div>
                    <p><strong>Your Score: ${correct_answers}/${total_questions}</strong></p>
                    ${timeExpired ? '<p class="warning">⚠️ Time Expired!</p>' : ''}
                </div>

                <div class="subject-breakdown">
                    ${subjectScores.map(subject => `
                        <div class="subject-score" style="border-left-color: ${subject.color}">
                            <strong>${subject.name}</strong><br>
                            Score: ${subject.score}/${subject.total}
                        </div>
                    `).join('')}
                </div>

                <div class="author-section">
                    <h3>Show Answers (Author Only)</h3>
                    <input type="password" id="author-password" placeholder="Enter author password">
                    <button id="toggle-answers-btn">Show Answers</button>
                    <div id="author-feedback" style="color: red; display: none; margin-top: 10px;">
                        Incorrect author password!
                    </div>
                </div>
            </div>
        `;

        resultDiv.style.display = "block";

        // Set up toggle answers functionality
        setupAnswerToggle();

        // Disable all inputs but keep navigation enabled
        document.querySelectorAll("input[type=radio]").forEach(input => {
            input.disabled = true;
        });

        // Enable navigation for review
        prevBtn.disabled = false;
        nextBtn.disabled = false;
        submitBtn.style.display = 'none';
    }

    // Calculate subject-wise scores
    function calculateSubjectScores() {
        const subjectScores = [];

        quizData.subjects.forEach(subject => {
            const subjectQuestions = quizData.questions.filter(q => q.subject_id === subject.id);
            let correctCount = 0;

            subjectQuestions.forEach(question => {
                const questionName = `q${question.id}`;
                if (userAnswers[questionName]) {
                    const selectedOption = question.options.find(opt => opt.id == userAnswers[questionName]);
                    if (selectedOption && selectedOption.is_correct) {
                        correctCount++;
                    }
                }
            });

            subjectScores.push({
                name: subject.name,
                color: subject.color,
                score: correctCount,
                total: subjectQuestions.length
            });
        });

        return subjectScores;
    }

    // Set up answer toggle functionality
    function setupAnswerToggle() {
        const toggleBtn = document.getElementById("toggle-answers-btn");

        toggleBtn.addEventListener("click", async function () {
            const passwordInput = document.getElementById("author-password");
            const feedback = document.getElementById("author-feedback");

            feedback.style.display = "none";

            if (passwordInput.value !== authorPassword) {
                feedback.textContent = "Incorrect author password!";
                feedback.style.display = "block";
                return;
            }

            showAnswersEnabled = !showAnswersEnabled;
            toggleBtn.textContent = showAnswersEnabled ? "Hide Answers" : "Show Answers";

            if (showAnswersEnabled) {
                // Build answers from loaded quizData and userAnswers
                const answers = quizData.questions.map(q => {
                    const selectedId = userAnswers[`q${q.id}`];
                    const correctOpt = q.options.find(o => o.is_correct);
                    const selectedOpt = q.options.find(o => String(o.id) === String(selectedId));
                    return {
                        correct_option: correctOpt?.option_text || '',
                        selected_option: selectedOpt?.option_text || (selectedId ? 'Unknown option' : null),
                        is_correct: !!(selectedOpt && selectedOpt.is_correct)
                    };
                });
                showCorrectAnswers(answers);
            } else {
                hideCorrectAnswers();
            }
        });
    }

    // Show correct answers in questions
    function showCorrectAnswers(answerData) {
        const allQuestions = document.querySelectorAll(".question");

        answerData.forEach((answer, index) => {
            if (allQuestions[index]) {
                const question = allQuestions[index];

                let answerDisplay = question.querySelector('.correct-answer-display');
                if (!answerDisplay) {
                    answerDisplay = document.createElement('div');
                    answerDisplay.className = 'correct-answer-display';
                    question.appendChild(answerDisplay);
                }

                answerDisplay.innerHTML = `
                    <strong>✅ Correct Answer:</strong> ${answer.correct_option}<br>
                    <strong>📝 Your Answer:</strong> ${answer.selected_option || 'Not answered'}<br>
                    <strong>📊 Result:</strong> ${answer.is_correct ? '<span style="color: #4CAF50;">✓ Correct</span>' : '<span style="color: #f44336;">✗ Incorrect</span>'}
                `;
            }
        });
    }

    // Hide correct answers
    function hideCorrectAnswers() {
        document.querySelectorAll('.correct-answer-display').forEach(display => {
            display.remove();
        });
    }

    // Initialize the quiz when page loads
    initializeQuiz();
});
