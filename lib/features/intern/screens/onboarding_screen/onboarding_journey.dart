import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/orientation_widget/page1.dart';
import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/orientation_widget/page2.dart';
import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/orientation_widget/page3.dart';
import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/orientation_widget/page4.dart';
import 'package:opex_intern_hub/features/intern/screens/onboarding_screen/orientation_widget/page5.dart';

class OnboardingJourney extends StatelessWidget {
  const OnboardingJourney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 70.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            // Title
            const Text(
              'Onboarding\nJourney',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A8A),
                height: 1.2,
              ),
            ),
            const SizedBox(height: 32),
            // Progress bar
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  // Background (gray) bar
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xFFE5E7EB),
                    ),
                  ),
                  // Foreground (blue) progress
                  FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.6, // 60% progress
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xFF1E3A8A),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '60% Complete',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 40),
            // Onboarding modules
            Expanded(
              child: ListView(
                children: [
                  _buildOnboardingItem(
                    number: '1',
                    title: 'Opex Foundation',
                    description:
                        'This module introduces interns to the\ncompany\'s core mission and history',
                    backgroundColor: const Color(0xFF16A34A),
                    isCompleted: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OpexFoundationScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildOnboardingItem(
                    number: '2',
                    title: 'Services and Solutions',
                    description:
                        'This module covers Opex\'s products,\nservices, and industries.',
                    backgroundColor: const Color(0xFF16A34A),
                    isCompleted: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Stage2Screen()),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildOnboardingItem(
                    number: '3',
                    title: 'Our Leadership',
                    description:
                        'This module introduces the key leaders\nwho drive the company\'s success.',
                    backgroundColor: const Color(0xFF3B82F6),
                    isCompleted: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LeadershipStage3Screen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildOnboardingItem(
                    number: '4',
                    title: 'Our Partners',
                    description:
                        'Interns learn about the strategic\npartners who collaborate with Opex.',
                    backgroundColor: const Color(0xFF9CA3AF),
                    isCompleted: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Stage4PartnersScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildOnboardingItem(
                    number: '5',
                    title: 'Your Desired Path',
                    description:
                        'This module helps interns define their\npath and interests.',
                    backgroundColor: const Color(0xFF9CA3AF),
                    isCompleted: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OnboardingStage5(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingItem({
    required String number,
    required String title,
    required String description,
    required Color backgroundColor,
    required bool isCompleted,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Number circle
            Column(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      number,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color:
                            isCompleted
                                ? const Color(0xFF16A34A)
                                : backgroundColor == const Color(0xFF3B82F6)
                                ? const Color(0xFF3B82F6)
                                : const Color(0xFF9CA3AF),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF6B7280),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
