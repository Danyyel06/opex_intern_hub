import 'package:flutter/material.dart';

class Stage2Screen extends StatefulWidget {
  @override
  _Stage2ScreenState createState() => _Stage2ScreenState();
}

class _Stage2ScreenState extends State<Stage2Screen> {
  String? selectedQuestion1;
  String? selectedQuestion2;
  String? selectedQuestion3;

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
            Text(
              'Questions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            SizedBox(height: 24),

            // Question 1
            _buildQuestion(
              '1. Which Opex product is designed to help with compliance processes?',
              ['OpexA', 'RegTech365', 'FormsAgora', 'PORA Solutions'],
              selectedQuestion1,
              (value) => setState(() => selectedQuestion1 = value),
              correctAnswer: 'RegTech365',
            ),
            SizedBox(height: 24),

            // Question 2
            _buildQuestion(
              '2. What does the FormsAgora platform offer to farmers?',
              [
                'Only livestock management tools.',
                'A direct retail marketplace and customized loan options.',
                'Specialized transportation services.',
                'International export logistics.',
              ],
              selectedQuestion2,
              (value) => setState(() => selectedQuestion2 = value),
              correctAnswer:
                  'A direct retail marketplace and customized loan options.',
            ),
            SizedBox(height: 24),

            // Question 3
            _buildQuestion(
              '3. According to the provided content, what is OpexA used for?',
              [
                'Providing real-time compliance reporting.',
                'Helping individuals navigate their career journey in IT.',
                'Managing agricultural businesses.',
                'Streamlining supply chain operations.',
              ],
              selectedQuestion3,
              (value) => setState(() => selectedQuestion3 = value),
              correctAnswer:
                  'Helping individuals navigate their career journey in IT.',
            ),
            SizedBox(height: 40),

            // Submit Button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle submit action
                  _handleSubmit();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1E3A8A),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: Text(
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

  Widget _buildQuestion(
    String question,
    List<String> options,
    String? selectedValue,
    Function(String?) onChanged, {
    String? correctAnswer,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
            height: 1.4,
          ),
        ),
        SizedBox(height: 16),
        ...options
            .map(
              (option) => _buildRadioOption(
                option,
                selectedValue,
                onChanged,
                isCorrect: option == correctAnswer,
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _buildRadioOption(
    String option,
    String? selectedValue,
    Function(String?) onChanged, {
    bool isCorrect = false,
  }) {
    bool isSelected = selectedValue == option;
    bool showCorrectAnswer = selectedValue != null && isCorrect;

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color:
            showCorrectAnswer
                ? Color(0xFFDCFCE7)
                : (isSelected ? Color(0xFFF3F4F6) : Colors.white),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              showCorrectAnswer
                  ? Color(0xFF10B981)
                  : (isSelected ? Color(0xFF1E3A8A) : Color(0xFFE5E7EB)),
          width: showCorrectAnswer ? 2 : 1,
        ),
      ),
      child: RadioListTile<String>(
        title: Text(
          option,
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF111827),
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
        value: option,
        groupValue: selectedValue,
        onChanged: onChanged,
        activeColor: showCorrectAnswer ? Color(0xFF10B981) : Color(0xFF1E3A8A),
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        controlAffinity: ListTileControlAffinity.trailing,
        dense: true,
      ),
    );
  }

  void _handleSubmit() {
    // Check if all questions are answered
    if (selectedQuestion1 == null ||
        selectedQuestion2 == null ||
        selectedQuestion3 == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please answer all questions before submitting.'),
          backgroundColor: Color(0xFFEF4444),
        ),
      );
      return;
    }

    // Calculate score
    int score = 0;
    if (selectedQuestion1 == 'RegTech365') score++;
    if (selectedQuestion2 ==
        'A direct retail marketplace and customized loan options.')
      score++;
    if (selectedQuestion3 ==
        'Helping individuals navigate their career journey in IT.')
      score++;

    // Show results
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Quiz Results'),
            content: Text('You scored $score out of 3!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigate to next screen or handle completion
                },
                child: Text('Continue'),
              ),
            ],
          ),
    );
  }
}
