import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/intern/screens/task_list_screen.dart';
import 'package:opex_intern_hub/features/intern/screens/intern_dashboard.dart';
import 'package:opex_intern_hub/features/supervisors/screens/supervisors_dashboard.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                  InternDashboard(), // Replace with your Profile screen widget
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Profile Header Section
              Column(
                children: [
                  // Profile Image
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 4),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        'assets/images/profile_avatar.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Ifeoluwa Bankole',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E40AF),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'tolagben23@gmail.com',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Academic Information Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Academic Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E40AF),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('Field Of Study', 'Computer Science'),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      'University /Institution',
                      'Lagos State University',
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow('Graduation Year', '2025/2026'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // User Information Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'User Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1E40AF),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('Username', 'ifeoluwa'),
                    const SizedBox(height: 12),
                    _buildInfoRow('Password', '••••••••••'),
                    const SizedBox(height: 12),
                    _buildInfoRow('User Role', 'Intern'),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Logout Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                SupervisorDashboard(), // Replace with your Profile screen widget
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E40AF),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
              onTap: () => _onNavTap(2),
              child: _buildNavItem(Icons.home, 'Home', false),
            ),
            GestureDetector(
              onTap: () => _onNavTap(1),
              child: _buildNavItem(Icons.task, 'Tasks', false),
            ),
            GestureDetector(
              onTap: () => _onNavTap(0),
              child: _buildNavItem(Icons.person_outline, 'Profile', true),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(height: 1, color: Colors.grey[200]),
      ],
    );
  }
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
