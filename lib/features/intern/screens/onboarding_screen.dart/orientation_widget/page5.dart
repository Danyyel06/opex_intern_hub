import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/intern/screens/intern_dashboard.dart';

class OnboardingStage5 extends StatefulWidget {
  @override
  _OnboardingStage5State createState() => _OnboardingStage5State();
}

class _OnboardingStage5State extends State<OnboardingStage5> {
  String? selectedPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const SizedBox(),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 8),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF102592),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                '5',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Hero Image
              Center(
                child: Container(
                  width: double.infinity,
                  height: 200,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/stage5_hero.png', // Replace with your image
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Stage Label
              const Text(
                'STAGE 5',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6B7280),
                  letterSpacing: 0.5,
                ),
              ),

              const SizedBox(height: 8),

              // Title
              const Text(
                'Your Desired\nPath',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF111827),
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 16),

              // Description
              const Text(
                'Congratulations on reaching the final stage of your onboarding journey!',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'This module is your opportunity to define the path you\'d like to take at Opex Consulting. Your selection will help us understand your professional interests and align you with projects and mentors that will be most fulfilling for you.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 16),

              const Text(
                'This is a crucial step in shaping your internship experience and setting you up for success. Please take a moment to review the available roles and select the one that best matches your passion and career goals.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 32),

              // Role Selection Grid
              SizedBox(
                height: 400, // Adjust as needed to fit the grid
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.85,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    _buildRoleCard(
                      'Product Manager',
                      'assets/images/product_manager.png',
                    ),
                    _buildRoleCard(
                      'Front-End Engineer',
                      'assets/images/frontend_engineer.png',
                    ),
                    _buildRoleCard(
                      'Back-End Engineer',
                      'assets/images/backend_engineer.png',
                    ),
                    _buildRoleCard(
                      'UI/UX Designer',
                      'assets/images/uiux_designer.png',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Complete Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed:
                      selectedPath != null
                          ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => InternDashboard(),
                              ),
                            );
                            print('Selected path: $selectedPath');
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF102592),
                    disabledBackgroundColor: const Color(0xFF9CA3AF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Complete Onboarding',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(String title, String imagePath) {
    final isSelected = selectedPath == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPath = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color:
                isSelected ? const Color(0xFF102592) : const Color(0xFFE5E7EB),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color:
                    isSelected
                        ? const Color(0xFF1B4332)
                        : const Color(0xFF111827),
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
