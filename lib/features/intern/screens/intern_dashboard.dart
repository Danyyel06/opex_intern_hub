import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/intern/screens/task_list_screen.dart';
import 'package:opex_intern_hub/features/intern/screens/intern_profile.dart';
import 'package:opex_intern_hub/services/intern_service.dart';
import 'package:opex_intern_hub/services/auth_service.dart';

class InternDashboard extends StatefulWidget {
  const InternDashboard({Key? key}) : super(key: key);

  @override
  State<InternDashboard> createState() => _InternDashboardState();
}

class _InternDashboardState extends State<InternDashboard> {
  bool isAssigned = false;
  String? track;
  Map<String, dynamic>? supervisor;
  List<Map<String, dynamic>> tasks = [];
  bool isLoading = true;
  String internName = 'Intern';
  Map<String, dynamic>? currentTask;

  @override
  void initState() {
    super.initState();
    loadDashboardData();
  }

  Future<void> loadDashboardData() async {
    setState(() => isLoading = true);

    try {
      // Get current user info
      final userInfo = await AuthService.getCurrentUserInfo();
      if (userInfo != null) {
        internName = userInfo['full_name']?.split(' ').first ?? 'Intern';
      }

      // Get dashboard data
      final dashboardData = await InternService.getDashboardData();
      final tasksList = await InternService.getTasks();

      setState(() {
        isAssigned = dashboardData['assigned'] ?? false;
        track = dashboardData['track'];
        supervisor = dashboardData['supervisor'];
        tasks = tasksList;

        // Find current ongoing task (in_progress status)
        currentTask =
            tasks.isNotEmpty
                ? tasks.firstWhere(
                  (task) => task['status'] == 'in_progress',
                  orElse: () => tasks.first,
                )
                : null;

        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error loading data: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _refreshDashboard() async {
    await loadDashboardData();
  }

  void _onNavTap(int index) {
    if (index == 0) return; // Already on Home
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TaskListScreen()),
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
              child: RefreshIndicator(
                onRefresh: _refreshDashboard,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with greeting and refresh icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hi, $internName',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                          IconButton(
                            onPressed: _refreshDashboard,
                            icon:
                                isLoading
                                    ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                    : const Icon(Icons.refresh),
                          ),
                        ],
                      ),

                      const SizedBox(height: 40),

                      // Assignment Status Section
                      if (isLoading)
                        const Center(child: CircularProgressIndicator())
                      else if (!isAssigned)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.orange[300]!),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Assignment Status',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1A1A1A),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                children: [
                                  Icon(
                                    Icons.pending,
                                    color: Colors.orange[700],
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      track != null
                                          ? 'Track: $track - Waiting for supervisor assignment'
                                          : 'Complete your track selection to be assigned a supervisor',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.orange[700],
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      else ...[
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
                          child:
                              currentTask != null
                                  ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        currentTask!['tasks']['title'] ??
                                            'No Task Title',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF1A1A1A),
                                        ),
                                      ),

                                      const SizedBox(height: 12),

                                      Text(
                                        currentTask!['tasks']['description'] ??
                                            'No description available',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF666666),
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),

                                      const SizedBox(height: 20),

                                      // Progress Section
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Status',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF666666),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: _getStatusColor(
                                                currentTask!['status'],
                                              ).withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              _formatStatus(
                                                currentTask!['status'],
                                              ),
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: _getStatusColor(
                                                  currentTask!['status'],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 24),

                                      // Bottom Row with Button and Due Date
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder:
                                                      (context) =>
                                                          TaskListScreen(),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(
                                                0xFF1E3A8A,
                                              ),
                                              foregroundColor: Colors.white,
                                              elevation: 0,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 24,
                                                    vertical: 12,
                                                  ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            child: const Text(
                                              'View All Tasks',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          if (currentTask!['tasks']['due_date'] !=
                                              null)
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.calendar_month,
                                                  color: Color(0xFF666666),
                                                  size: 16,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  currentTask!['tasks']['due_date'],
                                                  style: const TextStyle(
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
                                  )
                                  : const Center(
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.task_alt,
                                          size: 48,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          'No tasks assigned yet',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
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
                          padding: const EdgeInsets.all(28),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 24,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              // Top-right label inside the card
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE0E7FF),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                  ),
                                  child: const Text(
                                    'Supervisor',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF1E3A8A),
                                    ),
                                  ),
                                ),
                              ),
                              // Main Row content
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Row(
                                  children: [
                                    // Profile Image
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: const Color(0xFFE5E7EB),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child:
                                            supervisor != null
                                                ? Icon(
                                                  Icons.person,
                                                  color: Colors.grey[600],
                                                  size: 28,
                                                )
                                                : Image.asset(
                                                  'assets/images/mentor_profile.png',
                                                  width: 60,
                                                  height: 60,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) {
                                                    return Container(
                                                      width: 60,
                                                      height: 60,
                                                      color: const Color(
                                                        0xFFE5E7EB,
                                                      ),
                                                      child: const Icon(
                                                        Icons.person,
                                                        color: Color(
                                                          0xFF9CA3AF,
                                                        ),
                                                        size: 28,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            supervisor != null
                                                ? supervisor!['profiles']['full_name'] ??
                                                    'Assigned Supervisor'
                                                : 'No Supervisor Assigned',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF1A1A1A),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          const Text(
                                            'Supervisor',
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 58.0),
                                      child: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF1E3A8A),
                                          borderRadius: BorderRadius.circular(
                                            22,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
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
          color: isActive ? const Color(0xFF1E3A8A) : const Color(0xFF9CA3AF),
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isActive ? const Color(0xFF1E3A8A) : const Color(0xFF9CA3AF),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'assigned':
        return Colors.blue;
      case 'in_progress':
        return Colors.orange;
      case 'submitted':
        return Colors.purple;
      case 'completed':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatStatus(String status) {
    switch (status.toLowerCase()) {
      case 'in_progress':
        return 'In Progress';
      case 'assigned':
        return 'Assigned';
      case 'submitted':
        return 'Submitted';
      case 'completed':
        return 'Completed';
      case 'rejected':
        return 'Rejected';
      default:
        return status;
    }
  }
}
