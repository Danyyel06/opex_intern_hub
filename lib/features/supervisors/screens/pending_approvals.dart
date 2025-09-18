import 'package:flutter/material.dart';
import 'package:opex_intern_hub/features/supervisors/screens/review_report.dart';

class PendingApprovalsScreen extends StatelessWidget {
  const PendingApprovalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> approvalCards = [
      {
        'title': 'Onboarding Screen Creation',
        'submittedBy': 'Ifeoluwa Bankole',
        'dueDate': '25-09-2025',
        'submittedDate': '24-09-2025',
      },
      {
        'title': 'UI Design Review',
        'submittedBy': 'Amina Yusuf',
        'dueDate': '30-09-2025',
        'submittedDate': '28-09-2025',
      },
      {
        'title': 'Backend API Integration',
        'submittedBy': 'Chinedu Okafor',
        'dueDate': '05-10-2025',
        'submittedDate': '01-10-2025',
      },
      {
        'title': 'Testing & QA',
        'submittedBy': 'Fatima Bello',
        'dueDate': '10-10-2025',
        'submittedDate': '08-10-2025',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with back button and title
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
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
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xFF1E3A8A),
                        size: 20,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Pending Approvals',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1E3A8A),
                    ),
                  ),
                ],
              ),
            ),

            // List of pending approvals
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  itemCount: approvalCards.length,
                  itemBuilder: (context, index) {
                    final card = approvalCards[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: _buildApprovalCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReviewReport(),
                            ),
                          );
                        },
                        title: card['title']!,
                        submittedBy: card['submittedBy']!,
                        dueDate: card['dueDate']!,
                        submittedDate: card['submittedDate']!,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildApprovalCard({
    required VoidCallback onTap,
    required String title,
    required String submittedBy,
    required String dueDate,
    required String submittedDate,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Submitted by : $submittedBy',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Color(0xFF6B7280),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Due Date : $dueDate',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B7280),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Color(0xFF6B7280),
                ),
                const SizedBox(width: 8),
                Text(
                  'Submitted Date : $submittedDate',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
