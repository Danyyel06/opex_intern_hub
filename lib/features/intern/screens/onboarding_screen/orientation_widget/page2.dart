import 'package:flutter/material.dart';

class Stage2Screen extends StatefulWidget {
  @override
  _Stage2ScreenState createState() => _Stage2ScreenState();
}

class _Stage2ScreenState extends State<Stage2Screen> {
  int? question1Answer;
  int? question2Answer;
  int? question3Answer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16, top: 8, bottom: 8),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Color(0xFF1E3A8A),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF1E3A8A), width: 2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  'images/Problem Solving 5.png',
                  fit: BoxFit.cover,
                  width: 350,
                  height: 350,
                ),
              ),
            ),
            SizedBox(height: 24),

            // Stage 2 Title
            Text(
              'STAGE 2',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6B7280),
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 8),

            // Main Title
            Text(
              'Our Services &\nSolutions',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
                height: 1.2,
              ),
            ),
            SizedBox(height: 16),

            // Description
            Text(
              'This module provides an overview of the key products and solutions that set Opex Consulting apart. We draw on industry expertise to make companies more competitive by offering innovative solutions. Our comprehensive product catalog is designed to help a diverse range of clients, from major corporations to individual professionals.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            SizedBox(height: 32),

            // Our Core Offerings Section
            Text(
              'Our Core Offerings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'A comprehensive offering like RegTech365, a platform that helps businesses regulate their compliance processes from a single location. It provides real-time monitoring, automated reporting, and predictive analytics to ensure adherence to regulations. We also have FormsAgora, a state-of-the-art agricultural platform aimed at transforming the industry by providing cutting-edge solutions for the marketplace, customized loans, and comprehensive coverage of the agricultural value chain.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            SizedBox(height: 32),

            // Innovation and Impact Section
            Text(
              'Innovation and Impact',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Finally, we offer OpexA, a solution designed to help individuals navigate their career journey with personalized guidance needed to discover their passion, learn new skills, and thrive in the exciting world of IT. Each of our products is a testament to our commitment to innovation and leveraging technology for maximum impact.',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            SizedBox(height: 40),

            // Questions Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Questions',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 20),

                // Question 1
                _buildQuestion(
                  questionNumber: 1,
                  question:
                      'Which Opex product is designed to help with compliance processes?',
                  options: [
                    'OpexA',
                    'RegTech365',
                    'FormsAgora',
                    'PORA Solutions',
                  ],
                  selectedValue: question1Answer,
                  onChanged: (value) {
                    setState(() {
                      question1Answer = value;
                    });
                  },
                  correctAnswer: 1,
                ),

                const SizedBox(height: 24),

                // Question 2
                _buildQuestion(
                  questionNumber: 2,
                  question:
                      'What does the FormsAgora platform offer to farmers?',
                  options: [
                    'A direct retail marketplace and customized loan options.',
                    'Only livestock management tools.',
                    'Specialized transportation services.',
                    'International export logistics.',
                  ],
                  selectedValue: question2Answer,
                  onChanged: (value) {
                    setState(() {
                      question2Answer = value;
                    });
                  },
                  correctAnswer: 0,
                ),

                const SizedBox(height: 24),

                // Question 3
                _buildQuestion(
                  questionNumber: 3,
                  question:
                      'According to the provided content, what is OpexA used for?',
                  options: [
                    'Providing real-time compliance reporting.',
                    'Managing agricultural businesses.',
                    'Streamlining supply chain operations.',
                    'Helping individuals navigate their career journey in IT.',
                  ],
                  selectedValue: question3Answer,
                  onChanged: (value) {
                    setState(() {
                      question3Answer = value;
                    });
                  },
                  correctAnswer: 3,
                ),
              ],
            ),
            SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed:
                    _allQuestionsAnswered()
                        ? () {
                          // Handle submit action
                          _submitAnswers();
                        }
                        : null,

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2B5CE6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Submit & Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestion({
    required int questionNumber,
    required String question,
    required List<String> options,
    required int? selectedValue,
    required Function(int?) onChanged,
    required int correctAnswer,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$questionNumber. $question',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1A1A1A),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 12),
        ...options.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          bool isSelected = selectedValue == index;
          bool isCorrect = index == correctAnswer;

          return GestureDetector(
            onTap: () => onChanged(index),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFEFF6FF) : Colors.white,
                border: Border.all(
                  color:
                      isSelected
                          ? const Color(0xFF2B5CE6)
                          : const Color(0xFFE5E7EB),
                  width: isSelected ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            isSelected
                                ? const Color(0xFF2B5CE6)
                                : const Color(0xFFD1D5DB),
                        width: 2,
                      ),
                      color:
                          isSelected ? const Color(0xFF2B5CE6) : Colors.white,
                    ),
                    child:
                        isSelected
                            ? const Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 12,
                            )
                            : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      option,
                      style: TextStyle(
                        fontSize: 14,
                        color:
                            isSelected
                                ? const Color(0xFF1A1A1A)
                                : const Color(0xFF4B5563),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  bool _allQuestionsAnswered() {
    return question1Answer != null &&
        question2Answer != null &&
        question3Answer != null;
  }

  void _submitAnswers() {
    // Calculate score
    int score = 0;
    if (question1Answer == 1) score++;
    if (question2Answer == 0) score++;
    if (question3Answer == 3) score++;

    // Handle submission logic here
    print('Score: $score/3');

    // Navigate to next screen or show results
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Quiz submitted! Score: $score/3'),
        backgroundColor: const Color(0xFF10B981),
      ),
    );
    Navigator.pop(context);
  }
}
