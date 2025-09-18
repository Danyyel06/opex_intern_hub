import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/supervisors/screens/task_creation.dart';
import 'package:opex_intern_hub/features/supervisors/screens/supervisors_dashboard.dart';
import 'package:opex_intern_hub/features/supervisors/screens/supervisors_profile.dart';

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({Key? key}) : super(key: key);

  @override
  State<TaskManagerScreen> createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends State<TaskManagerScreen> {
  void _onNavTap(int index) {
    if (index == 0) return; // Already on Home
    if (index == 1) {
      // TODO: Replace with your actual History page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SupervisorDashboard()),
      );
    } else if (index == 2) {
      // TODO: Replace with your actual Profile page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) =>
                  SupervisorsProfile(), // Replace with your Profile screen widget
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Task Manager',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              // Task Cards
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    _buildTaskCard(
                      onEdit: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateTaskScreen(),
                          ),
                        );
                      },
                      title: 'Creating Userflows',
                      date: '19-09-2025',
                    ),
                    const SizedBox(height: 16),
                    _buildTaskCard(
                      onEdit: () {},
                      title: 'Design System',
                      date: '20-09-2025',
                    ),
                    const SizedBox(height: 16),
                    _buildTaskCard(
                      onEdit: () {},
                      title: 'API Integration',
                      date: '21-09-2025',
                    ),
                    const SizedBox(height: 32),

                    // Add Task Button
                    Container(
                      width: double.infinity,
                      height: 56,
                      margin: const EdgeInsets.only(bottom: 24),
                      child: ElevatedButton(
                        onPressed: () {
                          // Add task functionality
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2B4BC7),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: const Text(
                          'Add Task',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
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
              onTap: () => _onNavTap(1),
              child: _buildNavItem(Icons.home, 'Home', false),
            ),
            GestureDetector(
              onTap: () => _onNavTap(0),
              child: _buildNavItem(Icons.add, 'Tasks', true),
            ),
            GestureDetector(
              onTap: () => _onNavTap(2),
              child: _buildNavItem(Icons.person_outline, 'Profile', false),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard({
    required VoidCallback onEdit,
    required String title,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: onEdit,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2B4BC7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Edit Project',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            date,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
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
