import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/intern/screens/intern_dashboard.dart';
import 'package:opex_intern_hub/features/intern/screens/intern_profile.dart';
import 'package:opex_intern_hub/features/intern/screens/task_detail_page.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  void _onNavTap(int index) {
    if (index == 0) return;
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InternDashboard()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
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
                    const SizedBox(height: 20),
                    const Text(
                      'Learning Hub',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your Projects are ready!!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Active Project Card (90%)
                    ProjectCard(
                      title: 'Creating Userflows',
                      progress: 0.9,
                      progressText: '90%',
                      date: '19-09-2025',
                      status: ProjectStatus.active,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TaskDetailScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    // In Progress Project Card (100%)
                    ProjectCard(
                      title: 'Creating Userflows',
                      progress: 1.0,
                      progressText: '100%',
                      date: '19-09-2025',
                      status: ProjectStatus.inProgress,
                      onTap: () {},
                    ),

                    const SizedBox(height: 16),

                    // Completed Project Card (100%)
                    ProjectCard(
                      title: 'Creating Userflows',
                      progress: 1.0,
                      progressText: '100%',
                      date: '19-09-2025',
                      status: ProjectStatus.completed,
                      onTap: () {},
                    ),

                    const SizedBox(
                      height: 100,
                    ), // Extra space for bottom navigation
                  ],
                ),
              ),
            ),

            // Bottom Navigation
            Container(
              padding: const EdgeInsets.symmetric(vertical: 26),
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
                    child: _buildNavItem(Icons.task, 'Tasks', true),
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
}

enum ProjectStatus { active, inProgress, completed }

class ProjectCard extends StatelessWidget {
  final String title;
  final double progress;
  final String progressText;
  final String date;
  final ProjectStatus status;
  final VoidCallback onTap;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.progress,
    required this.progressText,
    required this.date,
    required this.status,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _getStatusText(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _getStatusTextColor(),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
              ),
            ),

            const SizedBox(height: 24),

            // Progress Section
            const Text(
              'Progress',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF6B7280),
              ),
            ),

            const SizedBox(height: 8),

            // Progress Bar with Percentage
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E7EB),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: progress,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF3B82F6),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  progressText,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3B82F6),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Bottom Row with Button and Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E40AF),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Open Project',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6B7280),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor() {
    switch (status) {
      case ProjectStatus.active:
        return const Color(0xFFE0E7FF);
      case ProjectStatus.inProgress:
        return const Color(0xFFFEF3C7);
      case ProjectStatus.completed:
        return const Color(0xFFD1FAE5);
    }
  }

  Color _getStatusTextColor() {
    switch (status) {
      case ProjectStatus.active:
        return const Color(0xFF3730A3);
      case ProjectStatus.inProgress:
        return const Color(0xFF92400E);
      case ProjectStatus.completed:
        return const Color(0xFF065F46);
    }
  }

  String _getStatusText() {
    switch (status) {
      case ProjectStatus.active:
        return 'Active';
      case ProjectStatus.inProgress:
        return 'In Progress';
      case ProjectStatus.completed:
        return 'Completed';
    }
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const BottomNavItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color:
                isSelected ? const Color(0xFF3B82F6) : const Color(0xFF6B7280),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color:
                  isSelected
                      ? const Color(0xFF3B82F6)
                      : const Color(0xFF6B7280),
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
