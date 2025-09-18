import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/intern/screens/task_list_screen.dart';
import 'package:opex_intern_hub/features/intern/screens/intern_profile.dart';

class InternDashboard extends StatefulWidget {
  const InternDashboard({Key? key}) : super(key: key);

  @override
  State<InternDashboard> createState() => _InternDashboardState();
}

class _InternDashboardState extends State<InternDashboard> {
  void _onNavTap(int index) {
    if (index == 0) return; // Already on Home
    if (index == 1) {
      // TODO: Replace with your actual History page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TaskListScreen()),
      );
    } else if (index == 2) {
      // TODO: Replace with your actual Profile page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) =>
                  ProfilePage(), // Replace with your Profile screen widget
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with greeting and refresh icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Hi, Ifeoluwa',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A1A1A),
                          ),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.refresh,
                            color: Color(0xFF666666),
                            size: 20,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // Ongoing Task Section
                    const Text(
                      'Ongoing Task',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Task Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Creating Userflows',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Progress Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Progress',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF666666),
                                ),
                              ),
                              const Text(
                                '90%',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF4F46E5),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          // Progress Bar
                          Container(
                            width: double.infinity,
                            height: 8,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5E7EB),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: 0.9,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4F46E5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          // Bottom Row with Button and Time
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4F46E5),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Open Project',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: const Color(0xFF666666),
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '1 Hour',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF666666),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Mentor Section
                    const Text(
                      'Your mentor is here to help.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1A1A1A),
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Mentor Card
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Profile Image
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xFFE5E7EB),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                'assets/images/mentor_profile.png', // Replace with your image path
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 50,
                                    height: 50,
                                    color: const Color(0xFFE5E7EB),
                                    child: const Icon(
                                      Icons.person,
                                      color: Color(0xFF9CA3AF),
                                      size: 24,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          const SizedBox(width: 16),

                          // Name and Title
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Samson Adejumo',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF1A1A1A),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE0E7FF),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: const Text(
                                        'Supervisor',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF4F46E5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Senior Software Engineer',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Arrow Button
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4F46E5),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Navigation
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _onNavTap(0),
                    child: _buildNavItem(Icons.home, 'Home', true),
                  ),
                  GestureDetector(
                    onTap: () => _onNavTap(1),
                    child: _buildNavItem(Icons.task, 'Tasks', false),
                  ),
                  GestureDetector(
                    onTap: () => _onNavTap(2),
                    child: _buildNavItem(
                      Icons.person_outline,
                      'Profile',
                      false,
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

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isActive ? const Color(0xFF4F46E5) : const Color(0xFF9CA3AF),
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isActive ? const Color(0xFF4F46E5) : const Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }
}
