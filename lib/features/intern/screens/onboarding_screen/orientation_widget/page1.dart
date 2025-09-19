import 'package:flutter/material.dart';

class OpexFoundationScreen extends StatefulWidget {
  const OpexFoundationScreen({Key? key}) : super(key: key);

  @override
  State<OpexFoundationScreen> createState() => _OpexFoundationScreenState();
}

class _OpexFoundationScreenState extends State<OpexFoundationScreen> {
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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
              '1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            Center(
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF1E3A8A), width: 2),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    'images/Step One 1.png',
                    fit: BoxFit.cover,
                    width: 350,
                    height: 350,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Stage 1 Text
            const Text(
              'STAGE 1',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            // Title
            const Text(
              'The Opex Foundation',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 20),
            // Description
            const Text(
              'Welcome to Opex Consulting! This module introduces you to our core mission and foundational principles. Since being established in 2011, Opex has been committed to helping clients achieve their goals with flawless execution and world-class expertise. We pride ourselves on leveraging innovative technology solutions and best-practice methodologies to deliver results up to seven times faster than traditional methods, without compromising on quality.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),
            // Core Values Section
            const Text(
              'Our Mission and Impact',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Our primary mission is to enhance the economic productivity of businesses, from startups to large corporations. We believe in the power of technology to drive growth and prosperity by helping clients streamline operations, improve data management, and enhance decision-making. By partnering with businesses across diverse sectors—including finance, logistics, and oil and gas—we aim to make a significant and sustainable impact.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Your Role in Our Journey',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'As an intern, you are now a key part of this journey. This module will serve as your guide to our values and the purpose that drives us, preparing you to contribute meaningfully to our team and our clients\' success.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),
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
                      'What is Opex Consulting committed to helping their clients and team members achieve?',
                  options: [
                    'Unparalleled brand recognition and global market share.',
                    'Their goals with flawless execution and world-class expertise.',
                    'The highest possible return on investment for every single project.',
                    'Leadership in every industry through direct competition.',
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
                  question: 'What year was Opex Consulting established?',
                  options: ['2011', '2015', '2010', '2020'],
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
                      'According to the provided text, what does Opex Consulting use to tackle complex business challenges?',
                  options: [
                    'Only traditional methods and frameworks.',
                    'Innovative technology solutions and best-practice methodologies.',
                    'Large-scale financial investments and market speculation.',
                    'Outsourcing key projects to third-party firms.',
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
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _allQuestionsAnswered() ? _submitAnswers : null,
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
            const SizedBox(height: 20),
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
    int score = 0;
    if (question1Answer == 1) score++;
    if (question2Answer == 0) score++;
    if (question3Answer == 1) score++;

    bool quizPassed = score == 3;

    if (quizPassed) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect answers. Please try again!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
