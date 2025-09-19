import 'package:flutter/material.dart';

class Stage4PartnersScreen extends StatefulWidget {
  const Stage4PartnersScreen({Key? key}) : super(key: key);

  @override
  State<Stage4PartnersScreen> createState() => _Stage4PartnersScreenState();
}

class _Stage4PartnersScreenState extends State<Stage4PartnersScreen> {
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
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF1E3A8A),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              '4',
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
                    'images/Handshake.png',
                    fit: BoxFit.cover,
                    width: 350,
                    height: 350,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Stage 4 Text
            const Text(
              'STAGE 4',
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
              'Our\nPartners',
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
              'This module introduces you to the strategic partnerships that are essential to Opex Consulting\'s mission. We are committed to a collaborative approach, and our success is deeply intertwined with the visionaries and leading firms we partner with. These partnerships are a key pillar of our business strategy and help us to shape the future of financial services and guide our clients to new heights.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            // A Network of Expertise Section
            const Text(
              'A Network of Expertise',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Our partners provide us with specialized expertise and a broader network, enabling us to deliver comprehensive, world-class solutions. These relationships are built on a shared commitment to innovation and excellence, ensuring we can tackle complex business challenges with the best resources available. By working together, we can provide seamless, integrated services that deliver exceptional results to our clients.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 30),

            // Understanding our Collaborations Section
            const Text(
              'Understanding our Collaborations',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'This network is a vital part of our journey. As an intern, you will see how these collaborations contribute to our success and help us remain at the forefront of the industry. Understanding the strength and purpose of our partnerships is crucial to your role at Opex.',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 40),

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
                      'What is the primary purpose of Opex Consulting\'s partnerships?',
                  options: [
                    'To help us create our own products.',
                    'To manage our company\'s marketing efforts.',
                    'To shape the future of financial services.',
                    'To manage our company\'s marketing efforts.',
                  ],
                  selectedValue: question1Answer,
                  onChanged: (value) {
                    setState(() {
                      question1Answer = value;
                    });
                  },
                  correctAnswer: 2,
                ),

                const SizedBox(height: 24),

                // Question 2
                _buildQuestion(
                  questionNumber: 2,
                  question:
                      'According to the provided text, Opex Consulting\'s partnerships are part of what kind of strategy?',
                  options: [
                    'A global partnership strategy.',
                    'A brand marketing strategy.',
                    'A local market strategy.',
                    'A talent acquisition strategy.',
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
                      'What is the strength of Opex\'s relationships with its partners based on?',
                  options: [
                    'A commitment to a single business sector.',
                    'A history of direct competition.',
                    'A focus on developing only internal solutions.',
                    'A shared commitment to innovation and excellence.',
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
            const SizedBox(height: 40),

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
    if (question1Answer == 2) score++;
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
