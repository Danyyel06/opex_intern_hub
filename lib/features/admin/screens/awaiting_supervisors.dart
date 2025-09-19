import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/admin/screens/supervisor_assignment.dart';

class SupervisorAssignmentScreen extends StatelessWidget {
  const SupervisorAssignmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F9FD),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E3A8A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Awaiting Supervisors',
          style: TextStyle(
            color: Color(0xFF1E3A8A), // Blue color
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),

        centerTitle: false,
      ),
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 3),
                // Title
                const Text(
                  'Ready for Supervisor\'s\nAssignment',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A8A),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 32),
                // Team Members List
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        _buildTeamMember(
                          'Emery Korsgard',
                          'Project Manager',
                          'assets/images/emery.png',
                        ),
                        const SizedBox(height: 24),
                        _buildTeamMember(
                          'Jeremy Zucker',
                          'Front-End Engineer',
                          'assets/images/jeremy.png',
                        ),
                        const SizedBox(height: 24),
                        _buildTeamMember(
                          'Nadia Lauren',
                          'UI/UX Designer',
                          'assets/images/nadia.png',
                        ),
                        const SizedBox(height: 24),
                        _buildTeamMember(
                          'Jason Statham',
                          'Back-End Engineer',
                          'assets/images/jason_s.png',
                        ),
                        const SizedBox(height: 24),
                        _buildTeamMember(
                          'Angel Kimberly',
                          'UI/UX Designer',
                          'assets/images/angel.png',
                        ),
                        const SizedBox(height: 24),
                        _buildTeamMember(
                          'Jason Momoa',
                          'Creating a User Flow',
                          'assets/images/jason_m.png',
                        ),
                        const SizedBox(height: 24),
                        _buildTeamMember(
                          'Jason Momoa',
                          'Creating a User Flow',
                          'assets/images/jason_m.png',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Create Intern Account Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SupervisorAssignmentPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3A8A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Assign a supervisor',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamMember(String name, String role, String imagePath) {
    return Row(
      children: [
        // Profile Image
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: const Color(0xFFF1F5F9), // Placeholder background color
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              imagePath,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback placeholder if image doesn't exist
                return Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFFF1F5F9),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 24,
                    color: Color(0xFF94A3B8),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 16),
        // Name and Role
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                role,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
