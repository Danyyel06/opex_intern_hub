import 'package:flutter/material.dart';

class OpexFoundationScreen extends StatefulWidget {
  const OpexFoundationScreen({Key? key}) : super(key: key);

  @override
  State<OpexFoundationScreen> createState() => _OpexFoundationScreenState();
}

class _OpexFoundationScreenState extends State<OpexFoundationScreen> {
  // Track selected answers for each question
  Map<int, int> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16, top: 8, bottom: 8),
            width: 32,
            height: 32,
            decoration: const BoxDecoration(
              color: Color(0xFF1E3A8A),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: const Center(
              child: Text(
                '1',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section with Image and Stage Info
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Illustration
                  Center(
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF1E3A8A), // Deep blue border
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(
                          24,
                        ), // Rectangular with rounded corners
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'images/Step One 1.png', // Placeholder - replace with your image
                          fit: BoxFit.cover,
                          width: 350,
                          height: 350,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Stage Title
                  const Text(
                    'STAGE 1',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6B7280),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'The Opex\nFoundation',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Description
                  const Text(
                    'Welcome to Opex Consulting! This module introduces you to our core mission and foundational principles. Since being established in 2011, Opex has been committed to helping clients achieve their goals faster through our collaborative and best-in-class expertise. We pride ourselves on leveraging innovative technologies and best-practice methodologies to deliver results up to seven times faster than traditional methods, without compromising on quality.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Mission Section
                  const Text(
                    'Our Mission and Impact',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Our primary mission is to enhance the economic productivity of businesses, from startups to large corporations. We believe in the power of technology to drive growth and prosperity by helping clients streamline operations, improve data management, and enhance decision-making. By partnering with businesses across diverse sectors - including finance, logistics, and oil and gas - we aim to make a significant and sustainable impact.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Role Section
                  const Text(
                    'Your Role in Our Journey',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'As an intern, you are now a key part of this journey. This module will serve as your guide to our values and the purpose that drives us, preparing you to contribute meaningfully to our team and our clients\' success.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Questions Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Questions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Question 1
                  _buildQuestion(
                    questionNumber: 1,
                    question: 'What year was Opex Consulting established?',
                    options: ['2011', '2015', '2010', '2020'],
                    correctAnswer: 0,
                  ),

                  const SizedBox(height: 32),

                  // Question 2
                  _buildQuestion(
                    questionNumber: 2,
                    question:
                        'What is Opex Consulting committed to helping their clients and team members achieve?',
                    options: [
                      'Unparalleled brand recognition and global market share.',
                      'Their goals with flawless execution and world-class expertise.',
                      'The highest possible return on investment for every single project.',
                      'Leadership in every industry through direct competition.',
                    ],
                    correctAnswer: 1,
                  ),

                  const SizedBox(height: 32),

                  // Question 3
                  _buildQuestion(
                    questionNumber: 3,
                    question:
                        'According to the provided text, what does Opex Consulting use to tackle complex business challenges?',
                    options: [
                      'Only traditional methods and frameworks.',
                      'Innovative technology solutions and best-practice methodologies.',
                      'Large-scale financial investments and market speculation.',
                      'Outsourcing key projects to third-party firms.',
                    ],
                    correctAnswer: 1,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Submit Button
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submit action
                    Navigator.pop(context);
                    _handleSubmit();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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
    required int correctAnswer,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$questionNumber. $question',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF111827),
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        ...options.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          bool isSelected = selectedAnswers[questionNumber] == index;
          bool isCorrect = index == correctAnswer;

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedAnswers[questionNumber] = index;
                });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? (isCorrect
                              ? const Color(0xFFD1FAE5)
                              : const Color(0xFFFEE2E2))
                          : const Color(0xFFF9FAFB),
                  border: Border.all(
                    color:
                        isSelected
                            ? (isCorrect
                                ? const Color(0xFF10B981)
                                : const Color(0xFFEF4444))
                            : const Color(0xFFE5E7EB),
                    width: 1.5,
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
                                      : const Color(0xFFEF4444))
                                  : const Color(0xFFD1D5DB),
                          width: 2,
                        ),
                        color:
                            isSelected
                                ? (isCorrect
                                    ? const Color(0xFF10B981)
                                    : const Color(0xFFEF4444))
                                : Colors.transparent,
                      ),
                      child:
                          isSelected
                              ? const Icon(
                                Icons.check,
                                size: 12,
                                color: Colors.white,
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
                                      : const Color(0xFFDC2626))
                                  : const Color(0xFF374151),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }

  void _handleSubmit() {
    // Check if all questions are answered
    if (selectedAnswers.length < 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please answer all questions before continuing.'),
          backgroundColor: Color(0xFFEF4444),
        ),
      );
      return;
    }

    // Handle submit logic here
    print('Selected answers: $selectedAnswers');
    // Navigate to next screen or show results
  }
}
