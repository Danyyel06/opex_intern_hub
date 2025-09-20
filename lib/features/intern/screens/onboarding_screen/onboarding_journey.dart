import 'package:flutter/material.dart';
// import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/orientation_widget/complete_onboarding.dart';
import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/orientation_widget/page1.dart';
import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/orientation_widget/page2.dart';
import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/orientation_widget/page3.dart';
import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/orientation_widget/page4.dart';
import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/orientation_widget/page5.dart';

class OnboardingHome extends StatefulWidget {
  const OnboardingHome({super.key});

  @override
  State<OnboardingHome> createState() => _OnboardingHomeState();
}

class _OnboardingHomeState extends State<OnboardingHome> {
  int currentStage = 1;
  List<bool> isStageCompleted = List.generate(5, (_) => false);
  double progress = 0.0;

  void _navigateToStage(int stageNumber, Widget destination) async {
    if (stageNumber <= currentStage) {
      final bool? result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      );

      if (result != null && result) {
        setState(() {
          isStageCompleted[stageNumber - 1] = true;
          if (stageNumber < 5) {
            currentStage = stageNumber + 1;
          }
          progress = (stageNumber) / 5;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Intern Onboarding',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E3A8A),
          ),
        ),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[300],
            color: const Color(0xFF1E3A8A),
            minHeight: 8,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Welcome, Intern!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your journey to becoming a full-fledged Opex team member starts here. Complete these stages to get oriented with our company culture, values, and vision.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6B7280),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildStageCard(
                    stageNumber: 1,
                    title: 'The Opex Foundation',
                    imagePath: 'images/Step One 1.png',
                    onTap: () => _navigateToStage(1, OpexFoundationScreen()),
                  ),
                  _buildStageCard(
                    stageNumber: 2,
                    title: 'Our Services & Solutions',
                    imagePath: 'images/Problem Solving 5.png',
                    onTap: () => _navigateToStage(2, Stage2Screen()),
                  ),
                  _buildStageCard(
                    stageNumber: 3,
                    title: 'Our Leadership',
                    imagePath: 'images/Leadership 2 (1).png',
                    onTap: () => _navigateToStage(3, LeadershipStage3Screen()),
                  ),
                  _buildStageCard(
                    stageNumber: 4,
                    title: 'Our Partners',
                    imagePath: 'images/Handshake.png',
                    onTap:
                        () => _navigateToStage(4, const Stage4PartnersScreen()),
                  ),
                  _buildStageCard(
                    stageNumber: 5,
                    title: 'Your Desired Path',
                    imagePath: 'images/Progress.png',
                    onTap: () => _navigateToStage(5, OnboardingStage5()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStageCard({
    required int stageNumber,
    required String title,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    bool isCompleted = isStageCompleted[stageNumber - 1];
    bool isCurrent = currentStage == stageNumber;
    bool isLocked = currentStage < stageNumber;

    Color cardColor;
    Color borderColor;
    Color textColor;
    IconData icon;

    if (isCompleted) {
      cardColor = const Color(0xFFE8F5E9);
      borderColor = const Color(0xFF107C41);
      textColor = const Color(0xFF107C41);
      icon = Icons.check_circle;
    } else if (isCurrent) {
      cardColor = const Color(0xFFEFF6FF);
      borderColor = const Color(0xFF2B5CE6);
      textColor = const Color(0xFF2B5CE6);
      icon = Icons.play_circle_fill;
    } else {
      cardColor = Colors.white;
      borderColor = const Color(0xFFE5E7EB);
      textColor = const Color(0xFF4B5563);
      icon = Icons.lock;
    }

    return GestureDetector(
      onTap: isLocked ? null : onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isLocked ? Colors.grey[300] : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'STAGE $stageNumber',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(icon, color: textColor, size: 24),
          ],
        ),
      ),
    );
  }
}
