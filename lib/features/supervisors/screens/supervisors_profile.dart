import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/supervisors/screens/supervisors_dashboard.dart';
import 'package:opex_intern_hub/features/supervisors/screens/task_manager.dart';
import 'package:opex_intern_hub/features/admin/screens/admin_dashboard.dart';

class SupervisorsProfile extends StatefulWidget {
  const SupervisorsProfile({Key? key}) : super(key: key);

  @override
  State<SupervisorsProfile> createState() => _SupervisorsProfileState();
}

class _SupervisorsProfileState extends State<SupervisorsProfile> {
  void _onNavTap(int index) {
    if (index == 0) return; // Already on Home
    if (index == 1) {
      // TODO: Replace with your actual History page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TaskManagerScreen()),
      );
    } else if (index == 2) {
      // TODO: Replace with your actual Profile page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) =>
                  SupervisorDashboard(), // Replace with your Profile screen widget
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
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      // Profile Image
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 3),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile_placeholder.png', // Replace with your image path
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
                      // Name
                      const Text(
                        'Japheth Egbedele',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A8A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Email
                      const Text(
                        'tolagben23@gmail.com',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Personal Information Section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Personal Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A8A),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildInfoField(
                        'Full Name',
                        'Japheth Egbedele Obatoluwa',
                      ),
                      const SizedBox(height: 16),
                      _buildInfoField(
                        'Role in Organization',
                        'Software Engineer Lead',
                      ),
                      const SizedBox(height: 16),
                      _buildInfoField('E-mail', 'tolagben23@gmail.com'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Supervisor Information Section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Supervisor Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A8A),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildInfoField('Username', 'ifeoluwa'),
                      const SizedBox(height: 16),
                      _buildInfoField('Password', '••••••••••'),
                      const SizedBox(height: 16),
                      _buildInfoField('User Role', 'Supervisor'),
                    ],
                  ),
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
                      MaterialPageRoute(builder: (context) => AdminDashboard()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A8A),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
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
              child: _buildNavItem(Icons.add, 'Tasks', false),
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

  Widget _buildInfoField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xFFE5E5E5), width: 1),
            ),
          ),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
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
