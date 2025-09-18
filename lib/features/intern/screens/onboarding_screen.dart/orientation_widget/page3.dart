import 'package:flutter/material.dart';

class LeadershipStage3Screen extends StatefulWidget {
  const LeadershipStage3Screen({Key? key}) : super(key: key);

  @override
  State<LeadershipStage3Screen> createState() => _LeadershipStage3ScreenState();
}

class _LeadershipStage3ScreenState extends State<LeadershipStage3Screen> {
  int? question1Answer;
  int? question2Answer;
  int? question3Answer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF1E3A8A),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              '3',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image and Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Illustration
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF1E3A8A), width: 2),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        'images/Leadership 2 (1).png',
                        fit: BoxFit.cover,
                        width: 350,
                        height: 350,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Stage 3 Header
                const Text(
                  'STAGE 3',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B7280),
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),

                // Title
                const Text(
                  'Our Leadership',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 16),

                // Description
                const Text(
                  'This module introduces you to the visionaries who are shaping the future of Opex Consulting and guiding our clients to new heights of success. Our core leadership team brings a wealth of knowledge, strategic vision, and a commitment to excellence, with decades of combined experience in fintech, commercial banking, and financial institutions. They are the driving force behind our top-tier consulting, technology solutions, and training for clients.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xFF4B5563),
                  ),
                ),
                const SizedBox(height: 20),

                // Core and Team Leadership
                const Text(
                  'Core and Team Leadership',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Our leadership is structured into two main groups: the Core leadership team and the Board of Teams. The Core Leadership team includes key figures like Musibau Lasisi, our MD/CEO, and Oladapo Olagbaye, in Finance. These leaders ensure that every part of our company aligns with our mission of providing world class expertise.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xFF4B5563),
                  ),
                ),
                const SizedBox(height: 20),

                // A Network of Specialists
                const Text(
                  'A Network of Specialists',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Supporting the core leaders are our Heads of Teams, who bring their specialized skills to each department. This group includes our Engineering Manager, Infrastructure Manager, Sales Manager, Cybersecurity and Business Development. Together, our leaders work to ensure we are always at the forefront of the industry, delivering innovative solutions to our clients.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Color(0xFF4B5563),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

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
                      'What is the main role of Opex Consulting\'s leadership team?',
                  options: [
                    'Handling all client support requests and complaints.',
                    'Providing top-tier consulting advisory and technology solutions.',
                    'Managing daily administrative tasks.',
                    'Directly managing every single project in a centralized order.',
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
                      'According to the provided text, the Opex leadership team has combined experience in which industries?',
                  options: [
                    'Agriculture, education management and manufacturing.',
                    'Fintech, commercial banking, and financial institutions.',
                    'E-commerce, security management and retail.',
                    'Human Resources, management and accounting.',
                  ],
                  selectedValue: question2Answer,
                  onChanged: (value) {
                    setState(() {
                      question2Answer = value;
                    });
                  },
                  correctAnswer: 1,
                ),

                const SizedBox(height: 24),

                // Question 3
                _buildQuestion(
                  questionNumber: 3,
                  question: 'Who is Opex Consulting\'s MD/CEO?',
                  options: [
                    'Samson Adejumo',
                    'Musibau Lasisi',
                    'Omotayo Oladapo',
                    'Seun Akinyemi',
                  ],
                  selectedValue: question3Answer,
                  onChanged: (value) {
                    setState(() {
                      question3Answer = value;
                    });
                  },
                  correctAnswer: 1,
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Submit Button
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
                color:
                    isSelected
                        ? (isCorrect ? const Color(0xFFECFDF5) : Colors.white)
                        : Colors.white,
                border: Border.all(
                  color:
                      isSelected
                          ? (isCorrect
                              ? const Color(0xFF10B981)
                              : const Color(0xFF2B5CE6))
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
                                ? (isCorrect
                                    ? const Color(0xFF10B981)
                                    : const Color(0xFF2B5CE6))
                                : const Color(0xFFD1D5DB),
                        width: 2,
                      ),
                      color:
                          isSelected
                              ? (isCorrect
                                  ? const Color(0xFF10B981)
                                  : const Color(0xFF2B5CE6))
                              : Colors.white,
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
                                ? (isCorrect
                                    ? const Color(0xFF047857)
                                    : const Color(0xFF1A1A1A))
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
    if (question2Answer == 1) score++;
    if (question3Answer == 1) score++;

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
